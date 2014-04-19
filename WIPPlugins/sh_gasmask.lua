ITEM.name = "Gas Mask"
ITEM.partdata = { -- You can use PAC3 to setup the part.
        model = "models/half-dead/metroll/p_mask_2.mdl",
        bone = "ValveBiped.Bip01_Head1",
        position = Vector( 2.36, -3.093, -0.113 ),
        angle = Angle( -90.448, 0.01, 0.011 ),
        scale = Vector( 1, 1, 1 ),
        size = 1,
--
}
ITEM.model = Model("models/half-dead/metroll/p_mask_2.mdl")
ITEM.weight = 1
ITEM.desc = "A Mask that protects you from the bad air area."
ITEM.price = 200
ITEM.functions = {}
ITEM.functions.Equip = {
	onRun = function(client)
		if (client:Health() >= 20) then
			surface.SetMaterial("effects/gasmask_screen_4.vmt")
		elseif (client:Health >= 30) then
			surface.SetMaterial("effects/gasmask_screen_3.vmt")
		elseif (client:Health >= 60) then
			surface.SetMaterial("effects/gasmask_screen_2.vmt")
		elseif (client:Health >= 90) then
			surface.SetMaterial( "effects/gasmask_screen_1.vmt")
		else
			surface.SetMaterial( "effects/gasmask_screen.vmt")
	end
}
