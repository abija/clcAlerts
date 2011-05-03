--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("Nefarian CLC", "Blackwing Descent")
if not mod then return end
mod:RegisterEnableMob(41270, 41376)
mod.toggleOptions = {79339, 94130, 94090}
function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "ExplosiveCindersApplied", 79339)
	self:Log("SPELL_CAST_SUCCESS", "Tail", 94130)
	
	self:Emote("Electrocute", "The air crackles with electricity!")
end

function mod:ExplosiveCindersApplied(player)
	if UnitIsUnit(player, "player") then
		self:FlashSpell(79339, "_run")
	end
end

function mod:Tail(_, _, source)
	if source == "Nefarian" then
		self:FlashSpell(94130, "nil")
	end
end

function mod:Electrocute()
	self:FlashSpell(94090, "_die")
end
