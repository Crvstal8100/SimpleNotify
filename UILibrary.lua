local SimpleNotification = {}

local function Tween(UI, Time, Goal)
	local TweenService = game:GetService("TweenService")
	
	local tweenInfo = TweenInfo.new(Time, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut, 0, false, 0)
	
	local Tween = TweenService:Create(UI, tweenInfo, Goal)
	Tween:Play()
end

function SimpleNotification:Create(name)
	name = name or "SimpleNotify"
	
	local SimpleNotify = Instance.new("ScreenGui")
	local Frame = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")

	SimpleNotify.Name = name
	SimpleNotify.Parent = game:GetService("CoreGui")
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

	local Rah = {}

	function Rah:Notify(text, duration)
		text = text or "Label"
		
		local TextLabel = Instance.new("TextLabel")

		TextLabel.Parent = Frame
		TextLabel.BackgroundColor3 = Color3.fromRGB(65, 65, 65)
		TextLabel.BackgroundTransparency = 1
		TextLabel.BorderColor3 = Color3.fromRGB(255, 255, 255)
		TextLabel.BorderSizePixel = 0
		TextLabel.Size = UDim2.new(0.999999881, 0, 0.0394944698, 0)
		TextLabel.Font = Enum.Font.Unknown
		TextLabel.Text = text
		TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
		TextLabel.TextTransparency = 1
		TextLabel.TextSize = 14.000
		
		Tween(TextLabel, 0.5, {TextTransparency = 0, TextColor3 = Color3.fromRGB(255, 255, 255)})
		
		task.delay(duration, function()
			Tween(TextLabel, 1, {TextTransparency = 1, TextColor3 = Color3.fromRGB(0, 0, 0)})
		end)
	end
	
	return Rah
end

return SimpleNotification
