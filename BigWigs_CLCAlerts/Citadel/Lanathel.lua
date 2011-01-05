--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("Blood-Queen Lana'thel CLC", "Icecrown Citadel")
if not mod then return end
mod:RegisterEnableMob(37955)
mod.toggleOptions = {71340, 71265}

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "Pact", 71340)
	self:Emote("Shadows", "Shadows")
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:Death("Win", 37955)
end

--------------------------------------------------------------------------------
-- Event Handlers
--
function mod:Pact(player, spellId)
	if UnitIsUnit(player, "player") then
		self:FlashSpell(71340, "_run")
	end
end

function mod:Shadows(msg, _, _, _, player)
	if UnitIsUnit(player, "player") then
		self:FlashSpell(71265, "_die")
	end
end