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