function PLUGIN:HUDPaint()
	if LocalPlayer():Team() == FACTION_OW then
     local mat = Material("effects/combine_tactview")
				surface.SetDrawColor(255, 255, 255, 220)
				surface.SetMaterial(mat)
				surface.DrawTexturedRect(0, 0, ScrW(), ScrH())
		end
end