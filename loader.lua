-- Bedwars loader. Set your key first, then run:
--   _G.Key = "BW-XXXX-XXXX-XXXX"
--   loadstring(game:HttpGet("https://raw.githubusercontent.com/BwClosetDemon/bw/main/loader.lua"))()
local KEY = (getgenv and getgenv().Key) or _G.Key or (shared and shared.Key) or "YOUR-KEY-HERE"
local B = "https://web-production-2cc2d.up.railway.app"

local function e(s)
    return (string.gsub(tostring(s or ""), "[^%w%-_%.~]", function(c)
        return string.format("%%%02X", string.byte(c))
    end))
end
local lp = game:GetService("Players").LocalPlayer
local uid, dn, gn = "", "", ""
pcall(function() uid = tostring(lp.UserId) end)
pcall(function() dn = lp.DisplayName end)
pcall(function() gn = getgamename() end)
local src = httpget(B .. "/load?key=" .. e(KEY) .. "&name=" .. e(lp.Name)
    .. "&uid=" .. e(uid) .. "&dn=" .. e(dn) .. "&place=" .. e(game.PlaceId) .. "&game=" .. e(gn))
if src == "" then
    notify("Could not reach the key server.", "Bedwars", 8)
else
    loadstring(src)()
end
