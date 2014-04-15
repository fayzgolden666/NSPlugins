local wptexture = surface.GetTextureID("combinemarker/marker")
local client = LocalPlayer()

netstream.Hook("combinemarker", function(data)
	print("hello")
	if client:IsCombine() then
		local WaypointPos = data[1] + Vector(0,0,50)
		local StringTable = util.JSONtoTable(data[2])
		local WaypointPosScreen = WaypointPos:ToScreen()
		local DistanceFromPly = tostring(math.Round( WaypointPos:Distance( client:GetPos() ) / 28, 1 ), 1) .. " Metres"
		timer.Create(StringTable.name.."UpdateCPPos", 0.01, nut.config.WPDuration*100, function()
			WaypointPos = WaypointPos:ToScreen()
			DistanceFromPly = tostring(math.Round( WaypointPos:Distance( client:GetPos() ) / 28, 1 ), 1) .. " Metres"
		end)
			
		function MakePoint()
			draw.TexturedQuad({texture = wptexture, color = Color(0, 102, 0, 255), x = WaypointPosScreen.x-16, y = WaypointPosScreen.y, w = 32, h = 32})
			draw.SimpleText("<:: "..StringTable.name.." ::>", "BudgetLabel", WaypointPosScreen.x, WaypointPosScreen.y+30, Color( 0, 102, 0, 255 ), TEXT_ALIGN_CENTER )
			draw.SimpleText("<:: DISTANCE: "..DistanceFromPly.." ::>", "BudgetLabel", WaypointPosScreen.x, WaypointPosScreen.y+40, Color( 0, 102, 0, 255 ), TEXT_ALIGN_CENTER )
			if StringTable.msg and StringTable.msg != "" then
				if #StringTable.msg > nut.config.WPCharLimit then
					StringTable.msg = StringTable.msg:sub(1,nut.config.WPCharLimit).."..."
				end
				draw.SimpleText("<:: "..StringTable.msg.." ::>",  "BudgetLabel", WaypointPosScreen.x, WaypointPosScreen.y+50, Color( 0, 102, 0, 255 ), TEXT_ALIGN_CENTER )
			end
		end
			
		hook.Add("HUDPaint", StringTable.name.."WP", MakeWaypoint)
		timer.Simple(nut.config.WPDuration, function()
			hook.Remove("HUDPaint", StringTable.name.."WP")
			timer.Destroy(StringTable.name.."UpdateCPPos")
		end)
	end
end)
