local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character
local Humanoid = Character:FindFirstChildOfClass("Humanoid")

-- // functions

local rbx = function(u)
    return ("https://raw.githubusercontent.com/veryz-sillyz-boyz/rbx-utils/refs/heads/main/"..u)
end

local load = function(url)
    return loadstring(game:HttpGet(url))
end

-- // libraries

local Rayfield = load('https://sirius.menu/rayfield')()
local LoadLibrary = load(rbx("loadLibrary.lua"))()
local LavendelTable = LoadLibrary("util").DecodeJSON(game:HttpGet(rbx("lavendel.json")))
local Notification = load(rbx("notifications.lua"))()

-- // init

Notification.Notify({
	Description = "you's are dumb, you's are dressed like a box of cheezits";
	Title = "Lavendel";
	Duration = 20; 
});

local executor = load(LavendelTable.Executor)()
executor.Enabled = false

local Window = Rayfield:CreateWindow({
    Name = "Lavendel",
    Icon = 0,
    LoadingTitle = "Lavendel",
    LoadingSubtitle = "by noukorduck",
    Theme = "AmberGlow",
})

local Main = Window:CreateTab("Main", 0)
local ScriptHub = Window:CreateTab("Scripts", 0)
local Admins = Window:CreateTab("Admins", 0)

-- // toggles

Main:CreateToggle({
    Name = "Executor",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            executor.Enabled = true
        else
            executor.Enabled = false
        end
    end
})

-- // inputs

Main:CreateInput({
   Name = "Walk Speed",
   CurrentValue = "",
   PlaceholderText = "number",
   RemoveTextAfterFocusLost = true,
   Callback = function(Text)
        local num = tonumber(Text)
        if num then
            Humanoid.WalkSpeed = num
        else
            Humanoid.WalkSpeed = 16
        end
   end,
})

Main:CreateInput({
   Name = "Jump Power",
   CurrentValue = "",
   PlaceholderText = "number",
   RemoveTextAfterFocusLost = true,
   Callback = function(Text)
        local num = tonumber(Text)
        if num then
            Humanoid.JumpPower = num
        else
            Humanoid.JumpPower = 50
        end
   end,
})

-- // connections

LocalPlayer.CharacterAdded:Connect(function(character)
    Character = character
    Humanoid = Character:FindFirstChildOfClass("Humanoid")
end)

-- // loops

for _, adminData in pairs(LavendelTable.Admins) do
    Admins:CreateButton({
        Name = adminData.Name,
        Callback = function()
            load(adminData.URL)()
        end,
    })
end

for _, scriptData in pairs(LavendelTable.Scripts) do
    ScriptHub:CreateButton({
        Name = scriptData.Name,
        Callback = function()
            load(scriptData.URL)()
        end,
    })
end
