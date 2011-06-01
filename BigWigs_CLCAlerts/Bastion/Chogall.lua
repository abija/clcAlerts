--------------------------------------------------------------------------------
-- Module Declaration
--


local mod = BigWigs:NewBoss("Cho'gall CLC", 758)
if not mod then return end
mod:RegisterEnableMob(43324)
mod.toggleOptions = {81171}
local CL = LibStub("AceLocale-3.0"):GetLocale("Big Wigs: Common")
mod.optionHeaders = {}

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_CAST_SUCCESS", "Orders", 81171, 81556)
end

function mod:Orders(_, spellId, _, _, spellName)
	if spellId == 81171 then
		if self:GetInstanceDifficulty() > 2 then
			self:Bar(81171, "Flaming Destruction", 20, 81171) -- verified for 25man heroic
		else
			self:Bar(81171, "Flaming Destruction", 11, 81171) -- verified for 10man normal
		end
	end
end
