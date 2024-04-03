local SimpleNotification = {}

local function Tween(UI, Time, Goal)
	local TweenService = game:GetService("TweenService")

	local tweenInfo = TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)

	local Tween = TweenService:Create(UI, tweenInfo, Goal)
	Tween:Play()
	
	return Tween.Completed
end

local function PlaySound(SoundID, Volume, Parent)
	local Sound = Instance.new("Sound")
	Sound.SoundId = SoundID
	Sound.Volume = Volume
	Sound.Parent = Parent
	Sound:Play()
	
	game:GetService("Debris"):AddItem(Sound, Sound.TimeLength + 1)
end

function SimpleNotification:Create(name)
	name = name or "SimpleNotify"

	local SimpleNotify = Instance.new("ScreenGui")
	local Frame = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")

	SimpleNotify.Name = name
	SimpleNotify.Parent = game.Players.LocalPlayer.PlayerGui
	SimpleNotify.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	Frame.Parent = SimpleNotify
	Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame.BackgroundTransparency = 1.000
	Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Frame.BorderSizePixel = 0
	Frame.Position = UDim2.new(0.336349159, 0, 0.019884536, 0)
	Frame.Size = UDim2.new(0.326712012, 0, 0.930882335, 0)

	UIListLayout.Parent = Frame
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Padding = UDim.new(0, 15)

	local Rah = {}

	function Rah:Notify(Text, Duration, Sound)
		Sound = Sound or nil
		Text = Text or "Label"
		Duration = Duration or 5

		local TextLabel = Instance.new("TextLabel")

		TextLabel.Parent = Frame
		TextLabel.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
		TextLabel.BackgroundTransparency = 1
		TextLabel.BorderColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BorderSizePixel = 0
		TextLabel.Size = UDim2.new(0.999999881, 0, 0.0394944698, 0)
		TextLabel.Font = Enum.Font.Unknown
		TextLabel.Text = Text
		TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
		TextLabel.TextTransparency = 1
		TextLabel.TextSize = 14.000
		TextLabel.RichText = true
		
		local function count(text, keyword)
			return select(2, text:gsub(keyword, ""))
		end
		
		local Found = count(TextLabel.Text, "\n")
		local Size = tonumber(Found * 0.0394944698)
		
		TextLabel.Size += UDim2.new(0, 0, Size, 0)
		
		if Sound and typeof(Sound) == "string" then
			PlaySound(Sound, 0.5, game:GetService("SoundService"))
		end
		
		Tween(TextLabel, 0.5, {TextTransparency = 0, TextColor3 = Color3.fromRGB(255, 255, 255)})

		task.delay(Duration, function()
			local Completed = Tween(TextLabel, 1, {TextTransparency = 1, TextColor3 = Color3.fromRGB(0, 0, 0)})
			Completed:Wait()
			TextLabel:Destroy()
		end)
	end

	return Rah
end

return SimpleNotification
