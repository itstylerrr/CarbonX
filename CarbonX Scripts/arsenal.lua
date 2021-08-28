-- Scripting
getgenv().aimbot = false;

local camera = game.Workspace.CurrentCamera
local localplayer = game:GetService("Players").LocalPlayer
local settings = {
    keybind = Enum.UserInputType.MouseButton2
}

local UIS = game:GetService("UserInputService")
local aiming = false --- this toggle will make it so we lock on to the person when we press our keybind

UIS.InputBegan:Connect(function(inp)
    if inp.UserInputType == settings.keybind then
        aiming = true
    end
end)

UIS.InputEnded:Connect(function(inp)
    if inp.UserInputType == settings.keybind then ---- when we stop pressing the keybind it would unlock off the player
        aiming = false
    end
end)

game:GetService("RunService").RenderStepped:Connect(function()
    if aiming then
        camera.CFrame = CFrame.new(camera.CFrame.Position,closestplayer().Character.Head.Position) -- locks into the HEAD
    end
end)


function closestplayer()
    local dist = math.huge -- math.huge means a really large number, 1M+.
    local target = nil --- nil means no value
    for i,v in pairs (game:GetService("Players"):GetPlayers()) do
        if v ~= localplayer then
            if v.Character and v.Character:FindFirstChild("Head") and v.TeamColor ~= localplayer.TeamColor and getgenv().aimbot and v.Character.Humanoid.Health > 0 then --- creating the checks
                local magnitude = (v.Character.Head.Position - localplayer.Character.Head.Position).magnitude
                if magnitude < dist then
                    dist = magnitude
                    target = v
                end
                
            end
        end
    end
    return target
end


-- GUI
local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()

local w = library:CreateWindow("Carbon X || Aimbot") -- Creates the window

local b = w:CreateFolder("Guns/Aim") -- Creates the folder(U will put here your buttons,etc)

local c = w:CreateFolder("ESP")

local e = w:CreateFolder("Misc")

e:DestroyGui()

b:Toggle("Aimbot",function(bool)
    getgenv().autoTap = bool
    print("Aimbot is: ", bool);
    if bool then
        closestplayer()
    end
end)

-- local selectedRebirthAmt
-- b:Dropdown("Rebirth Ammount",{"1","10","100", "1000"},true,function(value)
--     selectedRebirthAmt = value;
--     print(value)
-- end)
-- b:Toggle("Auto Rebirth",function(bool)
--     getgenv().autoRebirth = bool
--     print("Auto rebirth is: ", bool);
--     if bool and selectedRebirthAmt then
--         doAutoRebirth(selectedRebirthAmt);
--     end
-- end)

-- c:Toggle("Auto Buy Egg",function(bool)
--     getgenv().autoBuyBasicEgg = bool
--     print("Auto Buy Egg is: ", bool);
--     if bool then
--         doAutoBuyBasicEgg('basic');
--     end
-- end)

-- local selectedWorld;
-- d:Dropdown("Worlds",{"Lava","Desert","Ocean", "Fire"},true,function(value)
--     selectedWorld = value;
--     print(value)
-- end)

-- d:Button("Teleport to selected world.",function()
--     if selectedWorld then 
--         teleportWorld(selectedWorld)
--     end
-- end)



-- b:Label("Pretty Useless NGL",{
--     TextSize = 25; -- Self Explaining
--     TextColor = Color3.fromRGB(255,255,255); -- Self Explaining
--     BgColor = Color3.fromRGB(69,69,69); -- Self Explaining
    
-- }) 

-- b:Button("Button",function()
--     print("Elym Winning")
-- end)



-- b:Slider("Slider",{
--     min = 10; -- min value of the slider
--     max = 50; -- max value of the slider
--     precise = true; -- max 2 decimals
-- },function(value)
--     print(value)
-- end)

-- b:Dropdown("Dropdown",{"A","B","C"},true,function(mob) --true/false, replaces the current title "Dropdown" with the option that t
--     print(mob)
-- end)

-- b:Bind("Bind",Enum.KeyCode.C,function() --Default bind
--     print("Yes")
-- end)

-- b:ColorPicker("ColorPicker",Color3.fromRGB(255,0,0),function(color) --Default color
--     print(color)
-- end)

-- b:Box("Box","number",function(value) -- "number" or "string"
--     print(value)
-- end)