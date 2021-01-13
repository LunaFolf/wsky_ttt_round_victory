if CLIENT then return end

local songs = {
  ["wsky_traitor_victory"] = "sound/wsky_round_victory/for_the_damaged.mp3",
  ["wsky_innocent_victory"] = "sound/wsky_round_victory/cant_touch_this.mp3",
  ["wsky_fallback_victory"] = "sound/wsky_round_victory/never_gonna.mp3"
}

for name, soundName in pairs(songs) do
  resource.AddSingleFile(soundName)
  sound.Add({
    name = name,
    sound = string.Replace(soundName, "sound/", "")
  })
end