--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("Festergut CLC", "Icecrown Citadel")
if not mod then return end
mod:RegisterEnableMob(36626)
mod.toggleOptions = {69279}

--------------------------------------------------------------------------------
-- Initialization
--

-- XXX validate spell IDs in triggers, especially vile gas

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "Spore", 69279)
	self:Death("Win", 36626)
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Spore(player, spellId, _, _, spellName)
	if UnitIsUnit(player, "player") then
		self:FlashSpell(69279, "_run")
	else
		self:PlaySound(69279, "_explosion")
	end
end