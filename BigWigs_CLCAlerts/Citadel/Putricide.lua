--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("Professor Putricide CLC", "Icecrown Citadel")
if not mod then return end
--Putricide, Gas Cloud (Red Ooze), Volatile Ooze (Green Ooze)
mod:RegisterEnableMob(36678, 37562, 37697)
mod.toggleOptions = {72455, 72855, 72295}
--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "ChasedByRedOoze", 72455, 70672, 72832, 72833)
	self:Log("SPELL_AURA_APPLIED", "UnboundPlague", 72855, 72856)
	self:Log("SPELL_CAST_SUCCESS", "Goo", 72295, 74280, 72615, 74281)
	self:Death("Win", 36678)
	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
end

--------------------------------------------------------------------------------
-- Event Handlers
--
function mod:Goo()
	self:FlashSpell(72295, "_run")
end

function mod:ChasedByRedOoze(player, spellId)
	if UnitIsUnit(player, "player") then
		self:FlashSpell(72855, "_run")
	else
		self:PlaySound(72855, "_explosion")
	end
end

function mod:UnboundPlague(player, spellId)
	if UnitIsUnit(player, "player") then
		self:FlashSpell(72455, "_die")
		SendChatMessage("!!! UNBOUND ME !!!", "SAY")
	end
end

