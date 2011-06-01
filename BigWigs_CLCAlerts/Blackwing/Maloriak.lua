--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("Maloriak CLC", 754)
if not mod then return end
mod:RegisterEnableMob(41378)
mod.toggleOptions = {77896}

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "ArcaneStorm", 77896)
end

function mod:ArcaneStorm(_, spellId, _, _, spellName)
	self:FlashSpell(77896, "_ding")
end
