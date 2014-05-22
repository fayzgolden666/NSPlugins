ITEM.name = "Canned Beans"
ITEM.uniqueID = "reg_beans"
ITEM.desc = "Old smelly beans in a container."
ITEM.model = Model("models/props_lab/jar01b.mdl")
ITEM.price = 5
ITEM.data = {
    Amount = 0
}
ITEM.functions = {}
ITEM.functions.Open = {
            icon = "icon16/error.png",
        run = function(itemTable, client, data)
            if (SERVER) then
                
            if (!itemTable) then return false end

            if !client:HasItem("kitchen_knife") or !client:HasItem("dayz_wrench") or !client:HasItem("dayz_stone") then
                nut.util.Notify("You don't have the tools to open the can!", client)
                    return false
            end
            
            if client:HasItem("kitchen_knife") or client:HasItem("dayz_wrench") or client:HasItem("dayz_stone") then
                        client:UpdateInv("beans_food", 1, {Amount = math.random(40,100)})
                        client:EmitSound("physics/flesh/flesh_impact_hard"..math.random(1, 5)..".wav")
                        nut.util.Notify("You have opened the can of beans! Some has spilled out.", client) 
        end           
    end
}
