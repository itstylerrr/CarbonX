getgenv().autoTap = false;
getgenv().autoRebirth = false;
getgenv().autoBuyBasicEgg = false;

local remotePath = game:GetService("ReplicatedStorage").Aero.AeroRemoteServices

function doAutoTap()
    spawn(function() 
        while autoTap == true do
            local args = {[1] = 1}
            remotePath.ClickService.Click:FireServer(unpack(args))
            wait()
        end
    end)
end

function doAutoRebirth(rebirthAmount)
    spawn(function() 
        while autoRebirth == true do
            local args = {[1] = rebirthAmount}
            remotePath.RebirthService.BuyRebirths:FireServer(unpack(args))
            wait();
        end
    end)
end


function doAutoBuyBasicEgg(eggType)
        spawn(function() 
        while autoBuyBasicEgg == true do
            remotePath.EggService.Purchase:FireServer(eggType)
            wait();
        end
    end)
end

function getCurrentPlayerPOS()
    local plyr = game.Players.LocalPlayer;
    if plyr.Character then
        return plyr.Character.HumainoidRootPart.Position;
    end
        return false;
end

function teleportTO(placeCFrame)
    local plyr = game.Players.LocalPlayer;
    if plyr.Character then
        plyr.Character.HumanoidRootPart.CFrame = placeCFrame;
    end
end

function teleportWorld(world)
    if game:GetService("Workspace").Worlds:FindFirstChild(world) then
        teleportTO(game:GetService("Workspace").Worlds[world].Teleport.CFrame)
    end
end

local library = loadstring(game:HttpGet(('https://raw.githubusercontent.com/AikaV3rm/UiLib/master/Lib.lua')))()

local w = library:CreateWindow("Carbon X") -- Creates the window

local b = w:CreateFolder("Farming") -- Creates the folder(U will put here your buttons,etc)

local c = w:CreateFolder("Pets")

local d = w:CreateFolder("Teleport")

local e = w:CreateFolder("Misc")

e:DestroyGui()

b:Toggle("Auto Tap",function(bool)
    getgenv().autoTap = bool
    print("Auto tap is: ", bool);
    if bool then
        doAutoTap(10);
    end
end)

local selectedRebirthAmt
b:Dropdown("Rebirth Ammount",{"1","10","100", "1000"},true,function(value)
    selectedRebirthAmt = value;
    print(value)
end)
b:Toggle("Auto Rebirth",function(bool)
    getgenv().autoRebirth = bool
    print("Auto rebirth is: ", bool);
    if bool and selectedRebirthAmt then
        doAutoRebirth(selectedRebirthAmt);
    end
end)

c:Toggle("Auto Buy Egg",function(bool)
    getgenv().autoBuyBasicEgg = bool
    print("Auto Buy Egg is: ", bool);
    if bool then
        doAutoBuyBasicEgg('basic');
    end
end)

local selectedWorld;
d:Dropdown("Worlds",{"Lava","Desert","Ocean", "Fire"},true,function(value)
    selectedWorld = value;
    print(value)
end)

d:Button("Teleport to selected world.",function()
    if selectedWorld then 
        teleportWorld(selectedWorld)
    end
end)



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