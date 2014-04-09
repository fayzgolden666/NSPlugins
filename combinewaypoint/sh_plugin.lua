PLUGIN.name = "Combine Waypoints"
PLUGIN.author = "FayZ and Oedipus"
PLUGIN.desc = "Adds waypoints for people in the combine faction."

nut.util.Include("sv_hooks.lua")
nut.util.Include("cl_hooks.lua")
nut.util.Include("sh_config.lua")

nut.command.Register({
		onRun = function(player, arguments)
			if (client:IsCombine()) then
				local trace = client:GetEyeTraceNoCursor()
				if (!trace.Hit) then return end
				
				local strings = {name = client:Name(), msg = table.concat(arguments, " ") or false}
				local transmitstring = util.TableToJSON(strings)
				net.Start("combinemarker")
					net.WriteVector(trace.HitPos)
					net.WriteString(transmitstring)
				net.Broadcast()
			else
			nut.util.Notify("You're not apart of the Combine!", client)
		end
}, "createwaypoint")
