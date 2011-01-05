--------------------------------------------------------------------------------
-- Module Declaration
--


local mod = BigWigs:NewBoss("Ascendant Council CLC", "The Bastion of Twilight")
if not mod then return end
mod:RegisterEnableMob(43686, 43687, 43688, 43689) --Ignacious, Feludius, Arion, Terrastra
mod.toggleOptions = {83099, 82665, 82660}

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
end


function mod:OnEngage(diff)	
end

--------------------------------------------------------------------------------
-- Event Handlers
--
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