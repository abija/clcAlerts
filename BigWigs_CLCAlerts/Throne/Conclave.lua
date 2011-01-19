--------------------------------------------------------------------------------
-- Module Declaration
--

local mod = BigWigs:NewBoss("Conclave of Wind CLC", "Throne of the Four Winds")
if not mod then return end
mod:RegisterEnableMob(45870, 45871, 45872) -- Anshal, Nezir, Rohash
mod.toggleOptions = {95865, 86193}
--------------------------------------------------------------------------------
-- Locals
--


function mod:OnBossEnable()
	self:Log("SPELL_AURA_APPLIED", "Shield", 95865, 93059)
	self:Log("SPELL_CAST_SUCCESS", "Blast", 86193)
end

function mod:Shield()
	self:FlashSpell(95865, "_die")
end

function mod:Blast()
	self:FlashSpell(86193, "_run")
end


