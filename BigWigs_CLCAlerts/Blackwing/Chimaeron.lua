--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("Chimaeron CLC", "Blackwing Descent")
if not mod then return end
mod:RegisterEnableMob(43296, 44418, 44202) -- Chimaeron, Bile-O-Tron 800, Finkle Einhorn
mod.toggleOptions = {88853}
--------------------------------------------------------------------------------
-- Localization
--

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "SystemFailureStart", 88853)
	self:Log("SPELL_AURA_REMOVED", "SystemFailureEnd", 88853)
end
function mod:OnEngage(diff)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:SystemFailureStart(_, spellId, _, _, spellName)
	self:FlashSpell(88853, "_run")
end

function mod:SystemFailureEnd(_, spellId)
end
