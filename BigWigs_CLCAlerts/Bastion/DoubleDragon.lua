--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("Valiona and Theralion CLC", 758)
if not mod then return end
mod:RegisterEnableMob(45992, 45993)
mod.toggleOptions = {86622}

--------------------------------------------------------------------------------
-- Locals
--

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	-- Heroic
	self:Log("SPELL_AURA_APPLIED", "EngulfingMagicApplied", 86622, 95640, 95639)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:EngulfingMagicApplied(player, spellId, _, _, spellName)
	if UnitIsUnit(player, "player") then
		self:FlashSpell(86622, "_run")
	end
end


