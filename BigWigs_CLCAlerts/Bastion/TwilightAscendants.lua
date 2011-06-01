--------------------------------------------------------------------------------
-- Module Declaration
--


local mod = BigWigs:NewBoss("Ascendant Council CLC", 758)
if not mod then return end
mod:RegisterEnableMob(43686, 43687, 43688, 43689) --Ignacious, Feludius, Arion, Terrastra
mod.toggleOptions = {83099, 82665, 82660, 83718, 82752}

--------------------------------------------------------------------------------
-- Locals
--
--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "LightningRodApplied",83099)
	self:Log("SPELL_CAST_SUCCESS", "HeartofIce", 82665)
	self:Log("SPELL_CAST_SUCCESS", "BurningBlood", 82660)
	self:Log("SPELL_CAST_START", "HardenSkin", 83718, 92541, 92542, 92543)
	self:Log("SPELL_CAST_START", "HydroLance", 82752)
end


function mod:OnEngage(diff)	
end

--------------------------------------------------------------------------------
-- Event Handlers
--
function mod:HardenSkin(player, spellId, _, _, spellName)
	self:FlashSpell(83718, "_die")
end

function mod:HydroLance(player, spellId, _, _, spellName)
	self:FlashSpell(82752, "_die")
end

function mod:LightningRodApplied(player, spellId, _, _, spellName)
	if UnitIsUnit(player, "player") then
		self:FlashSpell(83099, "_run")
	end
end

function mod:HeartofIce(player, spellId, _, _, spellName)
	if UnitIsUnit(player, "player") then
		self:FlashSpell(82665, "_run")
	end
end

function mod:BurningBlood(player, spellId, _, _, spellName)
	if UnitIsUnit(player, "player") then
		self:FlashSpell(82660, "_run")
	end
end