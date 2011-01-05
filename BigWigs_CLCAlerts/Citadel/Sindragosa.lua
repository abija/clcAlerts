--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("Sindragosa CLC", "Icecrown Citadel")
if not mod then return end
-- Sindragosa, Rimefang, Spinestalker
mod:RegisterEnableMob(36853, 37533, 37534)
mod.toggleOptions = {69762, 69766, 70106, 70127, 70126}

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "Unchained", 69762)
	self:Log("SPELL_AURA_APPLIED_DOSE", "Chilled", 70106)
	self:Log("SPELL_AURA_APPLIED_DOSE", "Instability", 69766)
	self:Log("SPELL_AURA_APPLIED_DOSE", "Buffet", 70127)
	self:Log("SPELL_AURA_APPLIED", "FrostBeacon", 70126)

	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
	self:Death("Win", 36853)
end

--------------------------------------------------------------------------------
-- Event Handlers
--
function mod:FrostBeacon(player, spellId)
	if UnitIsUnit(player, "player") then
		self:FlashSpell(70126, "_run")
	end
end

function mod:Buffet(player, spellId, _, _, _, stack)
	if stack > 4 and UnitIsUnit(player, "player") then
		self:FlashSpell(70127, "_die")
	end
end

function mod:Instability(player, spellId, _, _, _, stack)
	if stack > 4 and UnitIsUnit(player, "player") then
		self:FlashSpell(69766, "_die")
	end
end

function mod:Chilled(player, spellId, _, _, _, stack)
	if stack > 3 and UnitIsUnit(player, "player") then
		self:FlashSpell(70106, "_die")
	end
end

function mod:Unchained(player, spellId)
	if UnitIsUnit(player, "player") then
		self:FlashSpell(69762, "_explosion")
	end
end

