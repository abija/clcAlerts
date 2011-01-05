--------------------------------------------------------------------------------
-- Module Declaration
--
local mod = BigWigs:NewBoss("Blood Prince Council CLC", "Icecrown Citadel")
if not mod then return end
mod.toggleOptions = {72999}
--Prince Valanar, Prince Keleseth, Prince Taldaram
mod:RegisterEnableMob(37970, 37972, 37973)

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED_DOSE", "Prison", 72999)
	self:RegisterEvent("INSTANCE_ENCOUNTER_ENGAGE_UNIT")
	self:RegisterEvent("ZONE_CHANGED_NEW_AREA", "Reboot")
	self:Death("Deaths", 37970, 37972, 37973)
	count = 0
end

function mod:INSTANCE_ENCOUNTER_ENGAGE_UNIT()
	--Need some sensible event args please Blizz
	count = count + 1
	if count == 3 then --3 bosses engaged
		count = 0
		local guid = UnitGUID("boss1")
		if guid then
			guid = tonumber(guid:sub(-12, -7), 16)
			if guid == 37970 or guid == 37972 or guid == 37973 then
				self:Engage()
				self:Bar(70981, L["switch_bar"], 45, 70981)
				self:Berserk(600)
			else
				self:Disable()
			end
		else
			self:Reboot()
		end
	end
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Prison(player, spellId, _, _, _, stack)
	if stack > 4 and UnitIsUnit(player, "player") then
		self:FlashSpell(72999, "_die")
	end
end

do
	local deaths = 0
	function mod:Deaths()
		deaths = deaths + 1
		if deaths == 3 then
			self:Win()
		end
	end
end

