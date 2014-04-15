PLUGIN.name = "Spawn Items"
PLUGIN.author = "Oepidus Rex and Sants1 (Fayz_Golden)"
PLUGIN.desc = "Allows players to spawn with a set of random items"

-----------------------------------------------------

function PLUGIN:GetDefaultInv(inventory, client, data)
	if (SERVER) then
		if (data.faction == FACTION_CITIZEN) then

			pistols = {"weapon_smg1", "weapon_shotgun", "weapon_pistol", "weapon_357"}
			ammoitems = {"weapon_frag", "bleach", "water", "water"}
			rarerifles = {"bleach", "water", "weapon_ar2"}
			itssoflattering = {"bleach", "bleach", "bleach", "bleach", "bleach"}

			local addictionlikesAnal = table.Random(pistols)
			local nicecopypastehaloKiller = table.Random(ammoitems)
			local ateelovesDusty = math.random(1, 100)
			local kipperisaFaggot = table.Random(rarerifles)
			local thanksforcopypastingmycodehaloKiller = table.Random(itssoflattering)

-- please don't edit after this line my loves unless you want to get rekt (talking to you addiction) (you too halokiller) (you are buttbuddies and i know it)

			if (ateelovesDusty <= 60) then
				client:UpdateInv(addictionlikesAnal)
				client:UpdateInv(nicecopypastehaloKiller)
			elseif (ateelovesDusty > 60) then
				client:UpdateInv(kipperisaFaggot)
				client:UpdateInv(thanksforcopypastingmycodehaloKiller)
			end
		end
	end
end

-- i need to make this all spaghetti code

-- diabetic raptor if you are looking at this, fuck off loser
