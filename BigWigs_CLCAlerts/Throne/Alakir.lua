--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("Al'Akir CLC", "Throne of the Four Winds")
if not mod then return end
mod:RegisterEnableMob(46753)
mod.toggleOptions = {89668}
--------------------------------------------------------------------------------
-- Initialization
--

function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "LightningRod", 89668)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:LightningRod(player, spellId, _, _, spellName)
	if UnitIsUnit(player, "player") then
		self:FlashSpell(89668, "_run")
		self:Say(89668, "Rod on me !!!")
	end	
end