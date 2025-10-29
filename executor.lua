rc7 = Instance.new("ScreenGui", game:GetService("CoreGui"));
rc7.Name = [[RC7]];
rc7.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
rc7.ResetOnSpawn = false

rc7Frame = Instance.new("Frame", rc7);
rc7Frame.BorderSizePixel = 0;
rc7Frame.BackgroundColor3 = Color3.fromRGB(20, 21, 24);
rc7Frame.Size = UDim2.new(0, 251, 0, 342);
rc7Frame.Position = UDim2.new(0.76799, 0, 0.30975, 0);
rc7Frame.BorderColor3 = Color3.fromRGB(0, 0, 0);
rc7Frame.Name = [[RC7]];

inputFrame = Instance.new("ScrollingFrame", rc7Frame);
inputFrame.Active = true;
inputFrame.BorderSizePixel = 0;
inputFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
inputFrame.Name = [[Input]];
inputFrame.Size = UDim2.new(0, 251, 0, 304);
inputFrame.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0);
inputFrame.BorderColor3 = Color3.fromRGB(0, 0, 0);
inputFrame.ScrollBarThickness = 0;
inputFrame.BackgroundTransparency = 1;

input = Instance.new("TextBox", inputFrame);
input.CursorPosition = -1;
input.Name = [[Input]];
input.TextXAlignment = Enum.TextXAlignment.Left;
input.BorderSizePixel = 0;
input.TextWrapped = true;
input.TextSize = 13;
input.TextColor3 = Color3.fromRGB(255, 255, 255);
input.TextYAlignment = Enum.TextYAlignment.Top;
input.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
input.FontFace = Font.new([[rbxasset://fonts/families/Arial.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
input.PlaceholderText = [[--type your scripts here]];
input.Size = UDim2.new(0, 251, 0, 685);
input.BorderColor3 = Color3.fromRGB(0, 0, 0);
input.Text = [[]];
input.BackgroundTransparency = 1;
input.ClearTextOnFocus = false

buttons = Instance.new("Frame", rc7Frame);
buttons.BorderSizePixel = 0;
buttons.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
buttons.Size = UDim2.new(0, 221, 0, 37);
buttons.Position = UDim2.new(0, 0, 0.893, 0);
buttons.BorderColor3 = Color3.fromRGB(0, 0, 0);
buttons.Name = [[Buttons]];
buttons.BackgroundTransparency = 1;

executeBtn = Instance.new("TextButton", buttons);
executeBtn.TextWrapped = true;
executeBtn.BorderSizePixel = 0;
executeBtn.TextColor3 = Color3.fromRGB(0, 0, 0);
executeBtn.TextSize = 14;
executeBtn.TextScaled = true;
executeBtn.BackgroundColor3 = Color3.fromRGB(61, 61, 61);
executeBtn.FontFace = Font.new([[rbxasset://fonts/families/Montserrat.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
executeBtn.Size = UDim2.new(0, 85, 0, 37);
executeBtn.Name = [[Execute]];
executeBtn.BorderColor3 = Color3.fromRGB(0, 0, 0);
executeBtn.Text = [[Execute]];

mainScript = Instance.new("LocalScript", rc7);
mainScript.Name = [[Main]];

Instance.new("UIDragDetector", rc7Frame);
Instance.new("UIStroke", inputFrame);
Instance.new("UIStroke", rc7Frame);

task.spawn(function()
	local script = mainScript;
	local RC7 = script.Parent

	local RC7Frame = RC7:FindFirstChild("RC7")
	local Buttons = RC7Frame:FindFirstChild("Buttons")
	local Input = RC7Frame:FindFirstChild("Input"):FindFirstChild("Input")
	local Execute = Buttons:FindFirstChild("Execute")

	Execute.MouseButton1Click:Connect(function()
		loadstring(Input.Text)()
	end)
end);

return rc7, require;
