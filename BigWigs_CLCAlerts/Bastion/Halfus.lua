--------------------------------------------------------------------------------
-- Module Declaration
--


local mod = BigWigs:NewBoss("Halfus Wyrmbreaker CLC", 758)
if not mod then return end
mod:RegisterEnableMob(44600)
mod.toggleOptions = {86169}

--------------------------------------------------------------------------------
-- Locals
--

--------------------------------------------------------------------------------
-- Localization
--

local L = mod:NewLocale("enUS", true)
if L then

end
L = mod:GetLocale()

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "FuriousRoar", 86169, 86170, 86171, 83710)
	self:Log("SPELL_CAST_START", "Nova", 86167)
end

function mod:FuriousRoar(_, spellId, _, _, spellName)
	self:FlashSpell(86169, "_die")
end

function mod:Nova()
	self:FlashSpell(86167, "_die")
end
