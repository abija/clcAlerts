--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("Deathbringer Saurfang CLC", "Icecrown Citadel")
if not mod then return end
-- Deathbringer Saurfang, Muradin, Marine, Overlord Saurfang, Kor'kron Reaver
mod:RegisterEnableMob(37813, 37200, 37830, 37187, 37920)
mod.toggleOptions = {72410, 72293}

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "RuneofBlood", 72410)
	self:Log("SPELL_CAST_START", "Mark", 72293)
	self:Death("Win", 37813)

	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:RuneofBlood(player, spellId)
	if not UnitIsUnit(player, "player") then
		self:FlashSpell(72410, "_explosion")
	end
end

function mod:Mark(player, spellId)
		self:FlashSpell(72293, "_die")
end

