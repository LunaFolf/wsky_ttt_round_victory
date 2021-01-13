if CLIENT then return end

util.AddNetworkString("WskyTTT_RoundVictory_PlaySound")

CreateConVar("wsky_round_victory_rick_roll", 0, 0, "Never gonna give you up!", 0, 1)

local songs = {
  [WIN_TRAITOR or 2] = "wsky_traitor_victory",
  [WIN_INNOCENT or 3] = "wsky_innocent_victory",
  ["fallback"] = "wsky_fallback_victory"
}

local function getPlayers ()
  return player.GetAll() or {}
end

local function sendSound(players, sound)
  if (!players) then return end

  if type(players) == 'Player' then
    players = {
      [1] = players
    }
  end

  for k, ply in ipairs(players) do
    net.Start("WskyTTT_RoundVictory_PlaySound")
      net.WriteString(sound)
    net.Send(ply)
  end
end

hook.Add("TTTEndRound", "WskyTTT_Round_Victory", function (result)
  local players = {}
  players = getPlayers()

  if GetConVar("wsky_round_victory_rick_roll"):GetBool() then
    sendSound(players, "wsky_round_victory/never_gonna")
    return
  end

  local songToPlay = songs[result] or songs["fallback"]
  if songToPlay then sendSound(players, songToPlay) end
end)