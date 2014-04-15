PLUGIN.name = "RandomItem"
PLUGIN.desc = "On the creation of a character, they get random items."
PLUGIN.Author = "Oedipus Rex"

function PLUGIN:GetDefaultInv(inventory, client, data)
		if (data.faction == FACTION_CITIZEN) then
			
			pistols = {"weapon_smg1", "weapon_shotgun", "weapon_pistol", "weapon_357"} -- Edit this shit to your liking. These tables are meant for you to edit.
			ammoitems = {"weapon_frag", "bleach", "water", "water"}
			rarerifles = {"bleach", "water", "weapon_ar2"}
			itssoflattering = {"bleach", "bleach", "bleach", "bleach", "bleach"}
			
			local addictionlikesAnal = table.Random(pistols)
			local nicecopypastehaloKiller = table.Random(ammoitems)
			local ateelovesDusty = math.random(1, 100) -- Just the chance modifier thing, leave this alone
			local kipperisaFaggot = table.Random(rarerifles)
			local thanksforcopypastingmycodehaloKiller = table.Random(itssoflattering)
			
-- please don't edit after this line my loves unless you want to get rekt (talking to you addiction) (you too halokiller) (you are buttbuddies and i know it)
			
			if (ateelovesDusty <= 60) then
				inventory:Add(addictionlikesAnal, 1)
				inventory:Add(nicecopypastehaloKiller, 1)
			elseif (ateelovesDusty > 60) then
				inventory:Add(kipperisaFaggot, 1)
				inventory:Add(thanksforcopypastingmycodehaloKiller, 1)
			end
		end
	end
end

-- i need to make this all spaghetti code
-- diabetic raptor if you are looking at this, fuck off loser
-- halokiller, if your version of this is 7 lines then it seems like you clearly don't understand that the amount of lines doesn't fucking matter.
