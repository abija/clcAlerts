--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("Omnotron Defense System CLC", "Blackwing Descent")
if not mod then return end
mod:RegisterEnableMob(42166, 42179, 42178, 42180) -- Arcanotron, Electron, Magmatron, Toxitron
mod.toggleOptions = {79501, 80094, 79888, 91849, 92048, 92023}

--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_CAST_START", "GripOfDeath", 91849)
	self:Log("SPELL_AURA_APPLIED", "ShadowInfusion", 92048)
	self:Log("SPELL_AURA_APPLIED", "EncasingShadows", 92023)
	
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

function mod:GripOfDeath()
	self:XSay("Grip of Death")
	-- self:FlashSpell(91849)
	-- print("Grip of Death")
end

function mod:ShadowInfusion(player, spellId)
	self:XSay("Shadow Infusion !!!")
	-- print("Shadow Infusion", player)
	-- self:FlashSpell(spellId)
end

function mod:EncasingShadows(player, spellId)
	self:XSay("Encasing Shadows !!!")
	-- print("Encasing Shadows", player)
	-- self:FlashSpell(spellId)
end