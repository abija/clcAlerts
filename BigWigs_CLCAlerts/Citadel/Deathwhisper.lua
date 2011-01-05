--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("Lady Deathwhisper CLC", "Icecrown Citadel")
if not mod then return end
--Deathwhisper, Cult Adherent, Reanimated Adherent, Cult Fanatic, Reanimated Fanatic, Deformed Fanatic
mod:RegisterEnableMob(36855, 37949, 38010, 37890, 38009, 38135)
mod.toggleOptions = {72496}

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "DarkMartyrdom", 72496, 72497, 72499, 72500)
	self:Death("Win", 36855)

	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:DarkMartyrdom(player, spellId)
	self:PlaySound(72496, "_run")
	SendChatMessage("Dark Martyrdom casting !!!", "YELL")
end
