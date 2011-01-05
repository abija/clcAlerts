--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("Omnotron Defense System CLC", "Blackwing Descent")
if not mod then return end
mod:RegisterEnableMob(42166, 42179, 42178, 42180) -- Arcanotron, Electron, Magmatron, Toxitron
mod.toggleOptions = {79501, 80094, 79888}

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "AcquiringTarget", 79501, 92035)
	self:Log("SPELL_AURA_APPLIED", "Fixate", 80094)
	self:Log("SPELL_AURA_APPLIED", "LightningConductor", 79888, 91433, 91431, 91432)
end

function mod:OnEngage(diff)
end

--------------------------------------------------------------------------------
-- Event Handlers
--
function mod:AcquiringTarget(player, spellId)
	if UnitIsUnit(player, "player") then
		self:FlashSpell(78006, "_run")
	end
end

function mod:Fixate(player, spellId)
	if UnitIsUnit(player, "player") then
		self:FlashSpell(80094, "_run")
	end
end

function mod:LightningConductor(player, spellId)
	if UnitIsUnit(player, "player") then
		self:FlashSpell(79888, "_run")
	end
end

