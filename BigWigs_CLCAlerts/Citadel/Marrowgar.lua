--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("Lord Marrowgar CLC", "Icecrown Citadel")
if not mod then return end
mod:RegisterEnableMob(36612)
mod.toggleOptions = {69076}

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "BonestormCast", 69076)
	self:Death("Win", 36612)
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
end
--------------------------------------------------------------------------------
-- Event Handlers
--
function mod:BonestormCast(_, spellId)
	self:FlashSpell(69076, "_run")
end

