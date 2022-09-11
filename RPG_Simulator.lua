getgenv().Settings = {
	Mob = false,
	Sword = true,
	start = true,
	Drink = false,
	Anything = false,

	Mob = nil,
	Name = nil,
}

local filename = "RpgSimConfig.txt"

function loadSettings()
	local HttpService = game:GetService("HttpService")
	if (readfile and isfile(filename)) then
		getgenv().Settings = HttpService:JSONDecode(readfile(filename))
		for i,v in pairs(Settings) do 
			print("...")
		end
	end
end

function save() 
	local json;
	local HttpService = game:GetService("HttpService")
	if (writefile) then
		json = HttpService:JSONEncode(getgenv().Settings);
		writefile(filename, json);
	end
end 

local b = game.Players.LocalPlayer
local root = b.Character:WaitForChild("HumanoidRootPart")
local Box = Instance.new("BoxHandleAdornment")

--local Mob = nil ; local Name = nil; local size = nil; local Mag = nil;

local vs = game:GetService("VirtualUser")
local mouse = game.Players.LocalPlayer:GetMouse()

local args = {
	["SlashSw"] = game:GetService("ReplicatedStorage").Events.attack,
	["MonsterHandle"] = game:GetService("Workspace").Mobs,
}

--Check if patched 

function IsAlive(w)
	if w.Character.HumanoidRootPart and w.Character and w.Character.Humanoid.Health > 0 then
		return true
	end
	return false
end

if not {args} then 
	game:GetService("StarterGui"):SetCore("SendNotification", {
		["Title"] = "The script got patched, please wait for an update!",
		["Text"] = "Notification",
		["Duration"] = 4,
		["Callback"] = function()
			b:Kick("You leave the game!")
		end,
		["Button1"] = "Leave game"
	})
end

local AnticheatBypass = { -- Real!?!!
	Time = 0.1,
}

local mt = getrawmetatable(game)
setreadonly(mt, false)
local old_index = mt.__index


--[[local args = {
[1] = "Equip",
[2] = "51"
}

game:GetService("ReplicatedStorage").Events.inventory:FireServer(unpack(args))]]


function array(...)
	args = {...}
	dis = math.floor(0,55 / 0,1) + 1
	for i = 0, dis * 1 do
		task.wait(0.2)
		b.Character:MoveTo(Vector3.new(...))
	end
	if args[#args] == true then 
		root.CFrame = root.CFrame:lerp(CFrame.new(unpack(args, 1)))
	end
end

function HitBox(y)
	Box.Name = "Hitbox"
	Box.Size = Vector3.new(5,5,5);
	Box.Adornee = y
	Box.AlwaysOnTop = true
	Box.ZIndex = 10
	Box.Transparency = 0.69
	Box.Parent = y
	Box.Color3 = Color3.fromRGB(17, 83, 127)
end

--b.Character.HumanoidRootPart.CFrame *= CFrame.Angles(100, 0, math.pi) * CFrame.new(0, 0, 0)

function magnitude(x, y, z)
	if typeof(x) == "Instance" and z then
		x = x.HumanoidRootPart.Position
	end
	if typeof(y) == "Instance" and z then
		y = y.Character.HumanoidRootPart.Position
	end 
	if typeof(x) == "Instance" and not z then
		x = x.Position
	end
	if typeof(y) == "Instance" and not z then
		y = y.Position
	end
	if typeof(x) == "CFrame" then
		x = x.Position
	end
	if typeof(y) == "CFrame" then
		y = y.Position
	end
	return (x - y).magnitude
end


function UseSkill(...)
	local args3 = {
		[1] = "Skill",
		[2] = "Skill1",
		[3] = "Attack"
	}	
	game:GetService("ReplicatedStorage").Events.attack:FireServer(unpack(args3))	
	local args4 = {
		[1] = "Skill",
		[2] = "Skill2",
		[3] = ""
	}

	game:GetService("ReplicatedStorage").Events.attack:FireServer(unpack(args4))		
	local args5 = {
		[1] = "Skill",
		[2] = "Skill3",
		[3] = ""
	}
	game:GetService("ReplicatedStorage").Events.attack:FireServer(unpack(args5))	
end

function SwordHit(...)
	local SwordHandle = game:GetService("Workspace")[b.Name].Sword;
	if SwordHandle ~= nil and IsAlive(b) then
		local args = {
			[1] = "Slash"
		}  
		game:GetService("ReplicatedStorage").Events.attack:FireServer(unpack(args)) 
		local args1 = {
			[1] = "E"
		}	
		game:GetService("ReplicatedStorage").Events.attack:FireServer(unpack(args1))
		local args2 = {
			[1] = "T"
		}
	end
end

local Luxtl = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Luxware-UI-Library/main/Source.lua"))()
local Luxt = Luxtl.CreateWindow("RPG Simulator - 02 X", 9498006165)

local MobTab = Luxt:Tab("World", 6087485864) 
local RTab = Luxt:Tab("Raid", 6087485864) 
local PTab = Luxt:Tab("Misc", 6087485864)
local ff = MobTab:Section("Auto Farm")
local ff2 = RTab:Section("Auto Farm")
local ff1 = PTab:Section("Misc")

ff:Label("Made By 02#0300")

if game.PlaceId == 2990100290 then
	ff:DropDown("Choose Mob ~", {"Grass Monster", "Bear", "Giant Bear", "Skeleton", "Crystal Skeleton", "Sun Warrior", "Tribesmen", "Forest Spirit", "Stone Golem", "Surfer", "Fisherman", "Water Elemental", "Fishman", "Sea Titan Guard", "Sea Titan"; "Molten Golem", "Fire Knight", "Baby Dragon", "Dark Soul", "Whisperer", "Dark Lord", "Snowman", "Ice Monster", "Ice Queen", "Awoken Mummy", "Sol's Disciple", "Droid 3000", "Steelbot", "Failed Experiment", "Demon Lord", "Temple Golem"}, function(choose)
		getgenv().Settings.Name = choose
		save()
	end)
end

game.StarterGui:SetCore("SendNotification", {
	Title = "Anticheat";
	Text = "The Anticheat hasn't bypassed, don't wonder why you get killed randomly Attempted!: " .. getfenv(0).script:GetFullName();
	Duration = 1.4;
})

ff:Toggle("Auto Farm", function(isToggled)
	getgenv().Settings.Mob = isToggled ;getgenv().Settings.Sword = isToggled
	if isToggled and IsAlive(b) then 
		Farm();
	end
end)

ff:Toggle("Auto Drink Potions", function(isToggled)
	getgenv().Settings.Drink = isToggled
	if isToggled and IsAlive(b) then 
		AutoDrink();
	end
end)

ff2:Toggle("Kill Anything", function(isToggled)
	getgenv().Settings.Anything = isToggled
	if isToggled and IsAlive(b) then 
		AutoKillAnything();
	end
end)

local loop; 

mt.__index = function(i, v) -- Better Loot
	if tostring(i) == "hardCore" then
		if tostring(v) == "Value" then
			return true
		end
	end
	return old_index(i, v)
end 

local skillskey = {
	["q"] = 0x51,
	["e"] = 0x45,
	["r"] = 0x52,
}

function array1(w, p, ...)
	--game.Players.LocalPlayer.Character.Humanoid:ChangeState(11)
	if IsAlive(b) and w.Humanoid.Health > 0 then
		if w:FindFirstChild("HumanoidRootPart") then
			b.Character.HumanoidRootPart.CFrame = w.HumanoidRootPart.CFrame
				+ w.HumanoidRootPart.CFrame.LookVector * -0 - Vector3.new(-3, 7.1, 1.48)
			b.Character.HumanoidRootPart.CFrame *= CFrame.Angles(0, 0, math.rad(360)) * CFrame.Angles(165, 0, math.pi) * CFrame.new(0, -2, 0)			
		end
	end
end

function Farm()
	spawn(function()
		if getgenv().Settings.Mob == true then
			if not getgenv().Settings.Mob then return end;	
			loop = game:GetService("RunService").Heartbeat:Connect(function()
				for z, k in pairs(game:GetService("Workspace").Mobs:GetChildren()) do
					if k:IsA('Model') and k.Name == getgenv().Settings.Name then 
						getgenv().Settings.Mob = k.hitbox.Position; HitBox(k.hitbox);
						array1(k); save()
					else 
						if k ~= nil and k.Name == getgenv().Settings.Name then
							loop:Disconnect() -- Bosses
						end 
						if getgenv().Settings.Mob == false then 
							loop:Disconnect() -- Mobs
						end
					end
				end	
			end)
		end
	end)
	if getgenv().Settings.Mob == true then 
		Swing(); -- Swings
	else 
		getgenv().Settings.Sword = false
	end
end

ff1:Button("Rejoin", function()
	game:GetService('TeleportService'):Teleport(game.PlaceId, b)
end)

local vu = game:GetService("VirtualUser")

ff1:Button("Anti Afk", function()
	game:GetService("Players").LocalPlayer.Idled:connect(function()
		vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
		wait(1)
		vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
	end)
end)


if game.PlaceId == 2990100290 then
	ff:Button("Teleport To Spawn", function()
		array(-1584.104248046875, 39.295963287353516, 493.60101318359375)
	end)
end

function Swing()
	spawn(function()
		while getgenv().Settings.Sword == true do wait(0.45) 
			if not getgenv().Settings.Sword then return end;
			SwordHit(); UseSkill(); save();
		end
		if tick() - AnticheatBypass["Time"] > 0.56 then
			hookfunction(task, function() return nil end); hookfunction(time, function() return nil end)
			print('Too Fast!'); b.Character.Humanoid.Health = -100
		end
	end)
end

local l 

function AutoKillAnything()
	spawn(function()
		if getgenv().Settings.Anything == true then
			if not getgenv().Settings.Anything then return end;	
			l = game:GetService("RunService").Heartbeat:Connect(function()
				for z,k in next, game:GetService("Workspace").Mobs:GetChildren() do
					if k ~= b and k.Humanoid.Health > 0 and magnitude(k, b, math.huge) < math.huge then 
						if k:FindFirstChild('hitbox') and not k:FindFirstChild('Sword') and k.Parent.Name ~= '_' then
							getgenv().Settings.Anything = k.hitbox.Position; HitBox(k.hitbox);
							b.Character.HumanoidRootPart.CFrame = k.HumanoidRootPart.CFrame
								+ k.HumanoidRootPart.CFrame.LookVector * -3 - Vector3.new(-6.7,0, -0)
							b.Character.HumanoidRootPart.CFrame *= CFrame.Angles(0, 5, math.rad(0))		
						else 
							if k ~= nil and k:FindFirstChild('hitbox') then
								l:Disconnect() -- Bosses
								game:GetService("TeleportService"):Teleport(game.PlaceId, b)
							end 
							if getgenv().Settings.Anything == false then 
								l:Disconnect() -- Mobs
							end
						end
					end
				end	
			end)
		end
	end)
	if getgenv().Settings.Anything == true then 
		Swing(); -- Swings
	else 
		getgenv().Settings.Sword = false
	end
end

function AutoDrink()
	spawn(function()
		while getgenv().Settings.Drink == true do wait(0.45) 
			if not getgenv().Settings.Drink then return end;
			game:GetService("ReplicatedStorage").Events.drink:FireServer()
			save()
		end
		if tick() - AnticheatBypass["Time"] > 0.56 then
			hookfunction(task, function() return nil end); hookfunction(time, function() return nil end)
			print('Too Fast!'); b.Character.Humanoid.Health = -100
		end
	end)
end

loadSettings()

if Settings.start == true then 
	save()
end

--[[if AnticheatBypass["Time"] - tick() then
while getgenv().Sword == true do wait(0.65)
SwordHit()
end
end]]
