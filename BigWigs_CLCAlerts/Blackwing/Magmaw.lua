--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("Magmaw CLC", 754)
if not mod then return end
mod:RegisterEnableMob(41570)
mod.toggleOptions = {78006}

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	--normal
	self:Log("SPELL_AURA_APPLIED", "PillarOfFlame", 78006)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:PillarOfFlame(_, spellId, _, _, spellName)
	self:FlashSpell(78006, "_run")
end

