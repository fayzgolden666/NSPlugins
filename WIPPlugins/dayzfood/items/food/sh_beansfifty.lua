ITEM.name = "Canned Beans [OPENED]"
ITEM.uniqueID = "beans_food"
ITEM.desc = "A can of beans that is %Amount|0% % full ."
ITEM.model = Model("models/props_lab/jar01b.mdl")
ITEM.data = {
    Amount = 0
}
ITEM.functions = {}
ITEM.functions.Consume = {
	run = function(itemTable, client, data)
		if (SERVER) then
        
        local restoreAmountLow = math.random(data.Amount, 50)
        local restoreAmountHigh = math.random(data.Amount, 100)
        
		if (client:Health() >= 100) then
			nut.util.Notify("You do not need to consume this right now.", client)

			return false
		end
            
		if (v.data.Amount < 50) then
			client:SetHealth(math.Clamp(client:Health() + restoreAmountLow))
		end

		if (v.data.Amount > 50) then
			client:SetHealth(math.Clamp(client:Health() + restoreAmountHigh))
		end

			if (client:Health() <= 0) then
				client:Kill()
			end
		end
	end
}
