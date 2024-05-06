-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local TextButton = Instance.new("TextButton")
local UICorner_2 = Instance.new("UICorner")
local TextLabel = Instance.new("TextLabel")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.32676056, 0, 0.398230106, 0)
Frame.Size = UDim2.new(0, 245, 0, 144)

UICorner.CornerRadius = UDim.new(0, 24)
UICorner.Parent = Frame

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(218, 218, 218)
TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0.0938775539, 0, 0.458333343, 0)
TextButton.Size = UDim2.new(0, 200, 0, 50)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "Start tween all"
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextSize = 14.000

UICorner_2.CornerRadius = UDim.new(0, 24)
UICorner_2.Parent = TextButton

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.BorderSizePixel = 0
TextLabel.Position = UDim2.new(0.0938775539, 0, 0.0694444478, 0)
TextLabel.Size = UDim2.new(0, 200, 0, 50)
TextLabel.Font = Enum.Font.Unknown
TextLabel.Text = "Tween All [Any Game]"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextSize = 14.000

-- Scripts:

local function HRBCJK_fake_script() -- TextButton.Script 
	local script = Instance.new('Script', TextButton)

	-- e 
	local Players = game:GetService("Players")
	local TweenService = game:GetService("TweenService")
	
	-- Get the GUI Button
	local teleportButton = script.Parent -- Assuming the script is a child of the button
	
	-- Function to find a random player
	local function getRandomPlayer()
		local playerList = Players:GetPlayers()
		if #playerList > 0 then
			local randomIndex = math.random(1, #playerList)
			return playerList[randomIndex]
		else
			return nil
		end
	end
	
	-- Function to teleport to a specific player
	local function teleportToPlayer(targetPlayer)
		if targetPlayer then
			local player = Players.LocalPlayer
			local character = player.Character or player.CharacterAdded:Wait()
			local targetCharacter = targetPlayer.Character
	
			if targetCharacter then
				local targetHumanoidRootPart = targetCharacter:FindFirstChild("HumanoidRootPart")
				local currentHumanoidRootPart = character:FindFirstChild("HumanoidRootPart")
	
				if targetHumanoidRootPart and currentHumanoidRootPart then
					currentHumanoidRootPart.CFrame = targetHumanoidRootPart.CFrame
				end
			end
		end
	end
	
	-- Function to handle player death and teleport to another player
	local function onPlayerDied(targetPlayer)
		local newTarget = getRandomPlayer()
		while newTarget and newTarget == targetPlayer do
			newTarget = getRandomPlayer()
		end
		teleportToPlayer(newTarget)
	end
	
	-- Connect the button click event
	teleportButton.MouseButton1Click:Connect(function()
		local targetPlayer = getRandomPlayer()
		if targetPlayer then
			teleportToPlayer(targetPlayer)
	
			-- Connect the player died event
			targetPlayer.CharacterRemoving:Connect(function()
				onPlayerDied(targetPlayer)
			end)
		end
	end)
	
end
coroutine.wrap(HRBCJK_fake_script)()
