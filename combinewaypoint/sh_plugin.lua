PLUGIN.name = "Combine Waypoints"
PLUGIN.author = "FayZ and Oedipus"
PLUGIN.desc = "Adds waypoints for people in the combine faction."

nut.command.Register({
	onRun = function(client, arguments)
		if (client:IsCombine()) then
			local trace = client:GetEyeTraceNoCursor()
			
			if (!trace.Hit) then return end
			 
			local strings = {name = client:Name(), msg = table.concat(arguments, " ") or false}
			local transmitstring = util.TableToJSON(strings)
 
			netstream.Start(nil, "CombineMarker", {trace.HitPos,transmitstring})
		else
			nut.util.Notify("You're not apart of the Combine!", client)
		end
end
}, "createwaypoint")

nut.util.Include("sv_hooks.lua")
nut.util.Include("cl_hooks.lua")
nut.util.Include("sh_config.lua")
