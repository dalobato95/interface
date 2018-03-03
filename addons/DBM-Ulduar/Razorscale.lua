local mod	= DBM:NewMod("Razorscale", "DBM-Ulduar")
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 262 $"):sub(12, -3))
mod:SetCreatureID(33186)
mod:SetEncounterID(1139)
mod:SetModelID(28787)

mod:RegisterCombat("combat_yell", L.YellAir)

mod:RegisterEventsInCombat(
	"SPELL_CAST_START 63317 64021",
	"SPELL_DAMAGE 64733 64704",
	"SPELL_MISSED 64733 64704",
	"CHAT_MSG_MONSTER_YELL",
	"RAID_BOSS_EMOTE"
)

--TODO, fuse armor taunt/swap warnings
local warnTurretsReadySoon			= mod:NewAnnounce("warnTurretsReadySoon", 1, 48642)
local warnTurretsReady				= mod:NewAnnounce("warnTurretsReady", 3, 48642)

local specWarnDevouringFlame		= mod:NewSpecialWarningMove(64733, nil, nil, nil, 1, 2)

local enrageTimer					= mod:NewBerserkTimer(900)
local timerDeepBreathCooldown		= mod:NewCDTimer(21, 64021, nil, nil, nil, 5)
local timerDeepBreathCast			= mod:NewCastTimer(2.5, 64021)
local timerTurret1					= mod:NewTimer(53, "timerTurret1", 48642, nil, nil, 5)
local timerTurret2					= mod:NewTimer(73, "timerTurret2", 48642, nil, nil, 5)
local timerTurret3					= mod:NewTimer(93, "timerTurret3", 48642, nil, nil, 5)
local timerTurret4					= mod:NewTimer(113, "timerTurret4", 48642, nil, nil, 5)
local timerGrounded                 = mod:NewTimer(45, "timerGrounded", nil, nil, nil, 6)

local combattime = 0

function mod:OnCombatStart(delay)
	enrageTimer:Start(-delay)
	combattime = GetTime()
	warnTurretsReadySoon:Schedule(93-delay)
	warnTurretsReady:Schedule(113-delay)
	timerTurret1:Start(-delay) -- 53sec
	timerTurret2:Start(-delay) -- +20
	timerTurret3:Start(-delay) -- +20
	timerTurret4:Start(-delay) -- +20
end

function mod:SPELL_DAMAGE(_, _, _, _, destGUID, _, _, _, spellId)
	if (spellId == 64733 or spellId == 64704) and destGUID == UnitGUID("player") and self:AntiSpam() and not self:IsTrivial(100) then
		specWarnDevouringFlame:Show()
		specWarnDevouringFlame:Play("runaway")
	end
end
mod.SPELL_MISSED = mod.SPELL_DAMAGE

function mod:RAID_BOSS_EMOTE(emote)
	if emote == L.EmotePhase2 or emote:find(L.EmotePhase2) then
		-- phase2
		timerTurret1:Stop()
		timerTurret2:Stop()
		timerTurret3:Stop()
		timerTurret4:Stop()
		timerGrounded:Stop()
	end
end

function mod:CHAT_MSG_MONSTER_YELL(msg, mob)
	if (msg == L.YellAir or msg == L.YellAir2) and GetTime() - combattime > 30 then
		warnTurretsReadySoon:Schedule(93)
		warnTurretsReady:Schedule(113)
		timerTurret1:Start()
		timerTurret2:Start()
		timerTurret3:Start()
		timerTurret4:Start()
	elseif msg == L.YellGround then
		timerGrounded:Start()
	end
end

function mod:SPELL_CAST_START(args)
	if args:IsSpellID(63317, 64021) then	-- deep breath
		timerDeepBreathCast:Start()
		timerDeepBreathCooldown:Start()
	end
end
