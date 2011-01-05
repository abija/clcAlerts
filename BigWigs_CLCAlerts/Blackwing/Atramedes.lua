--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("Atramedes CLC", "Blackwing Descent")
if not mod then return end
mod:RegisterEnableMob(41442)
mod.toggleOptions = {78092}

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "Tracking", 78092)
end

function mod:OnEngage(diff)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Tracking(player, spellId, _, _, spellName)
	if UnitIsUnit(player, "player") then
		self:FlashSpell(78092, "_run")
	end	
	self:Say(78092, UnitName(player))
end
