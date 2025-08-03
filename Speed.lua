-- Создание GUI
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextLabel = Instance.new("TextLabel")
local Slider = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")

-- Подключение GUI
ScreenGui.Parent = game:GetService("CoreGui")

-- Настройка рамки
Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Frame.Position = UDim2.new(0.05, 0, 0.2, 0)
Frame.Size = UDim2.new(0, 250, 0, 100)

UICorner.Parent = Frame

-- Заголовок
TextLabel.Parent = Frame
TextLabel.BackgroundTransparency = 1
TextLabel.Size = UDim2.new(1, 0, 0.4, 0)
TextLabel.Text = "Скорость: 16"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.Font = Enum.Font.SourceSansBold
TextLabel.TextSize = 20

-- Ползунок (кнопка для смены скорости)
Slider.Parent = Frame
Slider.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
Slider.Position = UDim2.new(0.05, 0, 0.55, 0)
Slider.Size = UDim2.new(0.9, 0, 0.3, 0)
Slider.Text = "Изменить скорость"
Slider.TextColor3 = Color3.fromRGB(255, 255, 255)
Slider.Font = Enum.Font.SourceSans
Slider.TextSize = 18

UICorner:Clone().Parent = Slider

-- Управление скоростью
local player = game.Players.LocalPlayer
local humanoid = player.Character:WaitForChild("Humanoid")
local currentSpeed = 16 -- стандартная скорость Roblox

Slider.MouseButton1Click:Connect(function()
    local newSpeed = tonumber(game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):SetCore("PromptInput", {
        Title = "Введите скорость (0–50):",
        PlaceholderText = "Например: 25"
    }))
    
    if newSpeed and newSpeed >= 0 and newSpeed <= 50 then
        humanoid.WalkSpeed = newSpeed
        TextLabel.Text = "Скорость: " .. newSpeed
    else
        TextLabel.Text = "Неверное значение!"
    end
end)
