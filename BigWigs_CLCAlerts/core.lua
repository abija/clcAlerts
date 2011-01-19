local function bprint(...)
	local t = {}
	for i = 1, select("#", ...) do
		t[i] = tostring(select(i, ...))
	end
	DEFAULT_CHAT_FRAME:AddMessage("BW_CLCAlerts: " .. table.concat(t, " "))
end
if not BigWigs then bprint("BigWigs required.") return end

local boss = BigWigs.bossCore.defaultModulePrototype
if not boss then bprint("ERROR: No default prototype.") return end

-- config
--------------------------------------------------------------------------------
local alphaStart = 0.3
local alphaVariation = 0.5
local scaleStart = 1
local scaleVariation = 0.3
local animDuration = 0.7
local animLoop = 0.3
local frameSize = 200
--------------------------------------------------------------------------------

-- sounds
--------------------------------------------------------------------------------
local sounds = {
	_default = "Sound\\Doodad\\BellTollAlliance.wav",
	_run = "Sound\\Creature\\HoodWolf\\HoodWolfTransformPlayer01.wav",
	_explosion = "Sound\\Doodad\\Hellfire_Raid_FX_Explosion05.wav",
	_die = "Sound\\Creature\\CThun\\CThunYouWillDIe.wav",
}

-- /run _G.PlaySoundFile("Sound\\Creature\\CThun\\CThunYouWillDIe.wav")

local function XPlaySound(s)
	if sounds[s] then
		PlaySoundFile(sounds[s])
	else
		PlaySoundFile(sounds._default)
	end
end
--------------------------------------------------------------------------------

-- animation stuff
--------------------------------------------------------------------------------
local animFrame
local doAnim = false
local animTime = 0
local scanStart = 0

-- stop animation and hide frame
local function AnimStop()
	doAnim = false
	animFrame:Hide()
end

-- start animation and show frame
local function AnimStart(tex)
	if doAnim then AnimStop()end
	doAnim = true
	animTime = 0
	animFrame:SetAlpha(alphaStart)
	animFrame:SetScale(scaleStart)
	animFrame.tex:SetTexture(tex)
	animFrame:Show()
end

-- process next frame in animation
local function AnimUpdate(elapsed)
	animTime = animTime + elapsed
	if animTime > animDuration then
		AnimStop()
		return
	end
	
	animFrame:SetAlpha(alphaStart + alphaVariation * (animTime % animLoop))
	animFrame:SetScale(scaleStart + scaleVariation * (animTime % animLoop))
end
--------------------------------------------------------------------------------

-- update
--------------------------------------------------------------------------------
local function OnUpdate(this, elapsed)
	if doAnim then
		AnimUpdate(elapsed)
	end
end
--------------------------------------------------------------------------------

-- event and display frame
--------------------------------------------------------------------------------
local f = CreateFrame("Frame")
f:SetScript("OnUpdate", OnUpdate)

animFrame = CreateFrame("Frame")
animFrame:Hide()
animFrame:SetPoint("CENTER", UIParent, 0, 0)
animFrame:SetWidth(frameSize)
animFrame:SetHeight(frameSize)
animFrame.tex = animFrame:CreateTexture(nil, "BACKGROUND")
animFrame.tex:SetTexture("Interface\\TargetingFrame\\UI-RaidTargetingIcon_8")
animFrame.tex:SetAllPoints()

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


-- ops
--------------------------------------------------------------------------------
function boss:XPlaySound(key, sound)
	if self.db.profile[GetSpellInfo(key)] and (self.db.profile[GetSpellInfo(key)] == 0) then return end
	XPlaySound(sound)
end

function boss:FlashSpell(spellId, sound)
	if self.db.profile[GetSpellInfo(spellId)] and (self.db.profile[GetSpellInfo(spellId)] == 0) then return end
	local _, _, icon = GetSpellInfo(spellId)
	XPlaySound(sound)
	AnimStart(icon)
end

function boss:XSay(s)
	SendChatMessage(s, "SAY")
end
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------