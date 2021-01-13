if SERVER then return end

local roundMusic = nil

local function clearPreviousMusic()
  if (roundMusic) then roundMusic:Stop() end
  roundMusic = nil
end

net.Receive("WskyTTT_RoundVictory_PlaySound", function ()
  local postRoundSeconds = GetConVar("ttt_posttime_seconds"):GetFloat()
  local soundString = net.ReadString()

  local fadeTime = 3
  local timeToWaitBeforeFade = math.Clamp(postRoundSeconds - fadeTime, 0, postRoundSeconds)

  if (!soundString) then return end

  clearPreviousMusic()

  roundMusic = CreateSound(LocalPlayer(), soundString)
  roundMusic:Play()

  timer.Simple(timeToWaitBeforeFade, function ()
    if (roundMusic and roundMusic:IsPlaying()) then
      roundMusic:FadeOut(fadeTime)
    end
  end)
end)