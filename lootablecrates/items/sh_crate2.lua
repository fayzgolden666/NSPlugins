ITEM.name = "Medium Crate"
ITEM.uniqueID = "base_lootcrate2"
ITEM.desc = "A box, it may have items inside of it"
ITEM.model = Model("models/props_junk/wood_crate001a_damaged.mdl")
ITEM.category = "Crates"
ITEM.functions = {}
ITEM.functions.Open = {
	run = function(itemTable, client, data)
		if (CLIENT) then return end
		
		rareitems = {""} -- Put Unique ID for item HERE
		
		regitems = {""} -- Put Unique ID for item HERE
		
		local chance = math.random(1, 100)
		
		if !client:HasItem("weapon_crowbar") then
			nut.util.Notify("You can't open this crate!", client) return false
		end
		
		if (chance >= 80) then
			client:UpdateInv(table.Random(rareitems), 1)
		elseif (chance >= 50) then
			client:UpdateInv(table.Random(regitems), 1)
		elseif (chance < 50) then
			nut.util.Notify("The crate is empty.", client)
		end
	end
}