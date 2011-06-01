if true then return end
--------------------------------------------------------------------------------
-- Module Declaration
--


local mod = BigWigs:NewBoss("Sinestra", 758)
if not mod then return end
mod:RegisterEnableMob()
mod.toggleOptions = {"bosskill"}
mod.optionHeaders = {
	bosskill = "general",
}

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

end


function mod:OnEngage(diff)

end

--------------------------------------------------------------------------------
-- Event Handlers
--

