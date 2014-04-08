PLUGIN.name = "Third Person"
PLUGIN.author = "FayZ and Oedipus"
PLUGIN.desc = "Adds third-person to Nutscript. The command is /thirdperson"

nut.util.Include("sv_hooks.lua")

nut.command.Register({
		onRun = function(client)
				client:ConCommand("chasecam")
		
			nut.util.Notify("Third Person toggled.", client)
		end
}, "thirdperson")