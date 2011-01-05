--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("The Lich King CLC", "Icecrown Citadel")
if not mod then return end
mod:RegisterEnableMob(36597)
mod.toggleOptions = {70337, 69409, 72762, 70541, 69200}


function mod:OnBossEnable()
	-- Phase 1
	self:Log("SPELL_CAST_START", "Infest", 70541, 73779, 73780, 73781)
	self:Log("SPELL_CAST_SUCCESS", "NecroticPlague", 70337, 70338, 73785, 73786, 73787, 73912, 73913, 73914)
	self:Log("SPELL_DISPEL", "PlagueScan", 528, 552, 4987, 51886) --cure, abolish, cleanse, cleanse spirit
	self:Log("SPELL_CAST_SUCCESS", "RagingSpirit", 69200)
	self:Log("UNIT_DIED", "PlagueScan")

	-- Phase 2
	self:Log("SPELL_CAST_SUCCESS", "SoulReaper", 69409, 73797, 73798, 73799)
	self:Log("SPELL_CAST_START", "DefileCast", 72762)

	self:Death("Win", 36597)

	self:RegisterEvent("PLAYER_REGEN_ENABLED", "CheckForWipe")
end

--------------------------------------------------------------------------------
-- Event Handlers
--
function mod:RagingSpirit(player)
	--if UnitIsUnit(player, "player") then
		mod:FlashSpell(69200, "_run")
	--end
end

function mod:Infest(_, spellId, _, _, spellName)
	local start, duration = GetSpellCooldown("Aura Mastery")
	if duration and duration < 2 then 
		mod:FlashSpell(31821, "_default")
		return
	end
end

function mod:SoulReaper(player, spellId)
	mod:FlashSpell(69409, "_die")
end

function mod:NecroticPlague(player, spellId, _, _, spellName)
	if UnitIsUnit(player, "player") then
		mod:FlashSpell(70337, "_die")
	end
end

do
	local plague = GetSpellInfo(70337)
	local function scanRaid()
		for i = 1, GetNumRaidMembers() do
			local player = GetRaidRosterInfo(i)
			if player then
				local debuffed, _, _, _, _, _, expire = UnitDebuff(player, plague)
				if debuffed and (expire - GetTime()) > 13 then
					if UnitIsUnit(player, "player") then
						mod:FlashSpell(70337, "_die")
					end
				end
			end
		end
	end
	function mod:PlagueScan()
		self:ScheduleTimer(scanRaid, 0.8)
	end
end

do
	local id, name, handle = nil, nil, nil
	local function scanTarget()
		local bossId = mod:GetUnitIdByGUID(36597)
		if not bossId then return end
		local target = UnitName(bossId .. "target")
		if target then
			if UnitIsUnit(target, "player") then
				mod:FlashSpell(72762, "_run")
				mod:Say("!!! DEFILE ON ME !!!")
			end
		end
		handle = nil
	end

	function mod:DefileCast(player, spellId, _, _, spellName)
		id, name = spellId, spellName
		self:CancelTimer(handle, true)
		handle = self:ScheduleTimer(scanTarget, 0.01)
	end
end