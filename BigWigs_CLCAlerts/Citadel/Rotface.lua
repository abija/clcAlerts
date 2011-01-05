--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("Rotface CLC", "Icecrown Citadel")
if not mod then return end
mod:RegisterEnableMob(36627)
mod.toggleOptions = {69674, 69839}

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "Infection", 69674, 71224, 73022, 73023)
	self:Log("SPELL_CAST_START", "Explode", 69839, 73029, 73030)
	self:Death("Win", 36627)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:Infection(player, spellId)
	if UnitIsUnit(player, "player") then
		self:FlashSpell(69674, "_run")
	end
end

do
	--The cast is sometimes pushed back
	local handle = nil
	local function explodeWarn()
		handle = nil
		mod:FlashSpell(69839, "_die")
	end
	function mod:Explode(_, spellId)
		if handle then self:CancelTimer(handle, true) end
		handle = self:ScheduleTimer(explodeWarn, 4)
	end
end
