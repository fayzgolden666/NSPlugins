BASE.name = "Base Kevlar"
BASE.uniqueID = "base_kevlar"
BASE.category = "Kevlar Vests"
BASE.data = {
	Condition = 100
	Equipped = false
}
BASE.functions = {}
BASE.functions.Equip = {
	run = function(itemTable, client, data)
		if (SERVER) then
			if (client:HasPartModel(itemTable.uniqueID)) then
				nut.util.Notify("You already has this vest equipped.", client)

				return false
			end
			
			local kevlarType = itemTable.name
			local conditionData = data.Condition
			
			if (conditionData <= 10) then
				nut.util.Notify("Your "..kevlarType.." is broken!", client)
			end
			
			if (itemTable.type and IsValid(client:GetNutVar(itemTable.type))) then
				nut.util.Notify("You already have a vest in the "..itemTable.type.." slot.", client)

				return false
			end
			
			if itemTable.type then
				client:SetNutVar(itemTable.type, itemTable.uniqueID)
			end
			
			client:AddPartModel(itemTable.uniqueID, itemTable.partdata)
			
			local newData = table.Copy(data)
			
			newData.Equipped = true
			client:UpdateInv(itemTable.uniqueID, 1, newData, true)
			nut.schema.Call("OnPartEquipped", client, itemTable, true)
		end
	end,
	shouldDisplay = function(itemTable, data, entity)
		return !data.Equipped or data.Equipped == nil
	end
}
BASE.functions.Repair = {
		run = function(itemTable, client, data)
			if (SERVER) then
				if (!client:HasItem("repairkit")) then
                nut.util.Notify("You don't have a repair-kit.", client)
 
                    return false
                end
				client:UpdateInv("repairkit", -1, nil, true)
					
				local newData = table.Copy(data)
				local kevlarType = itemTable.name
				
                newData.Condition = 100
				nut.util.Notify("You've repaired your "..kevlarType.."!", client)
			end
		end
		shouldDisplay = function(itemTable, data, entity)
			return !data.Equipped or data.Equipped == nil
		end
}
BASE.functions.Unequip = {
	run = function(itemTable, client, data)
		if (SERVER) then
			if itemTable.type then
				client:SetNutVar(itemTable.type, nil)
			end
			client:RemovePartModel(itemTable.uniqueID, itemTable.partdata)
			local newData = table.Copy(data)
			newData.Equipped = false
			newData.Condition = client:Armor()
			client:SetArmor(0)
			client:UpdateInv(itemTable.uniqueID, 1, newData, true)
			nut.schema.Call("OnPartEquipped", client, itemTable, false)
			return true
		end
	end,
	shouldDisplay = function(itemTable, data, entity)
		return data.Equipped == true
	end
}

local size = 16
local border = 4
local distance = size + border
local tick = Material("icon16/tick.png")

function BASE:PaintIcon(w, h)
	if (self.data.Equipped) then
		surface.SetDrawColor(0, 0, 0, 50)
		surface.DrawRect(w - distance - 1, w - distance - 1, size + 2, size + 2)

		surface.SetDrawColor(255, 255, 255)
		surface.SetMaterial(tick)
		surface.DrawTexturedRect(w - distance, w - distance, size, size)
	end
end

function BASE:CanTransfer(client, data)
	if (data.Equipped) then
		nut.util.Notify("You must unequip the item before doing that.", client)
	end

	return !data.Equipped
end

if (SERVER) then
	hook.Add("PlayerSpawn", "nut_PartBase", function(client)
		timer.Simple(0.1, function()
			if (!IsValid(client) or !client.character) then
				return
			end
			client:ResetPartModels()
			for class, items in pairs(client:GetInventory()) do
				local itemTable = nut.item.Get(class)

				if (itemTable and itemTable.partdata) then
					for k, v in pairs(items) do
						if (v.data.Equipped) then
							client:SetArmor(v.data.Condition)
							client:AddPartModel(itemTable.uniqueID, itemTable.partdata)
						end
					end
				end
			end
		end)
	end)
	hook.Add("PlayerDeath", "nut_PartDeath", function(client)
		timer.Simple(0.1, function()
			if (!IsValid(client) or !client.character) then
				return
			end
			client:ResetPartModels()
			for class, items in pairs(client:GetInventory()) do
				local itemTable = nut.item.Get(class)

				if (itemTable and itemTable.partdata) then
					for k, v in pairs(items) do
						if (v.data.Equipped) then
							v.data.Condition = client:Armor()
						end
					end
				end
			end
		end)
	end)
