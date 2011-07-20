

--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("Shannox_CLC", 800, 195)
if not mod then return end
mod:RegisterEnableMob(53691)

local CL = LibStub("AceLocale-3.0"):GetLocale("Big Wigs: Common")
function mod:GetOptions(CL)
	return { 99839 }
end

function mod:OnBossEnable()
	self:Log("SPELL_SUMMON", "ImmTrap", 99839)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

do
	local timer, fired = nil, 0
	local function trapWarn()
		fired = fired + 1
		if UnitExists("boss1target") then
			--If we've done 14 (0.7s) checks and still not passing the threat check, it's probably being cast on the tank
			if not UnitDetailedThreatSituation("boss1target", "boss1") or fired > 13 then
				mod:CancelTimer(timer, true)
				if UnitIsUnit("boss1target", "player") then
					mod:FlashSpell(99839, "_run")
				end
				return
			end
		end
		if fired > 18 then mod:CancelTimer(timer, true) end --Safety check if the unit doesn't exist
	end
	function mod:ImmTrap()
		fired = 0
		timer = self:ScheduleRepeatingTimer(trapWarn, 0.05)
	end
end
