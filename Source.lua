local Lib = {}

function Lib:Window(Info)
  local Info = Info or {}
local TweenService = game:GetService("TweenService")

function new(ClassName, Props)
    local obj = Instance.new(ClassName)
    for prop, value in pairs(Props or {}) do
        obj[prop] = value
    end
    return obj
end

function Tween(Parent, Config)
    local info = TweenInfo.new(
        Config.Time or 1,
        Config.Style or Enum.EasingStyle.Quad,
        Config.Direction or Enum.EasingDirection.Out
    )
    local tween = TweenService:Create(Parent, info, Config.Goal or {})
    tween:Play()
    return tween
end

if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("Ember Lib") then
    game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("Ember Lib"):Destroy()
end

local s = new("ScreenGui", {
    Name = "Ember Lib",
    Parent = game:GetService("Players").LocalPlayer.PlayerGui
})

local Win = new("Frame", {
    Size = UDim2.new(0, 410, 0, 305),
    Position = UDim2.new(0.5, 0, 0.5, 0),
    AnchorPoint = Vector2.new(0.5, 0.5),
    BackgroundColor3 = Color3.fromHex("#000000"),
    BackgroundTransparency = 0.2,
    Parent = s
})
new("UICorner", { Parent = Win })

local Tbar = new("Frame", {
    Size = UDim2.new(0, 410, 0, 40),
    Position = UDim2.new(0, 0, 0, 0),
    BackgroundColor3 = Color3.fromHex("#000000"),
    BackgroundTransparency = 0.2,
    Parent = Win
})
new("UICorner", { Parent = Tbar })

local Title = new("TextLabel", {
    BackgroundTransparency = 1,
    Size = UDim2.new(0, 200, 0, 20),
    Position = UDim2.new(0, 15, 0, 10),
    Text = "Hi",
    TextColor3 = Color3.fromHex("#ffffff"),
    Font = Enum.Font.GothamBold,
    TextSize = 18,
    TextXAlignment = Enum.TextXAlignment.Left,
    Parent = Tbar
})

local CloB = new("ImageButton", {
    Size = UDim2.new(0, 14, 0, 14),
    Position = UDim2.new(1, -10, 0.5, 0),
    AnchorPoint = Vector2.new(1, 0.5),
    BackgroundTransparency = 1,
    Image = "rbxassetid://10747384394",
    AutoButtonColor = false,
    Name = "Close",
    Parent = Tbar
})

local MinB = new("ImageButton", {
    Size = UDim2.new(0, 14, 0, 14),
    Position = UDim2.new(1, -35, 0.5, 0),
    AnchorPoint = Vector2.new(1, 0.5),
    BackgroundTransparency = 1,
    Image = "rbxassetid://10734896206",
    AutoButtonColor = false,
    Name = "Minimize",
    Parent = Tbar
})

local Content = new("Frame", {
    Size = UDim2.new(1, 0, 1, -40),
    Position = UDim2.new(0, 0, 0, 40),
    BackgroundTransparency = 1,
    Parent = Win
})

local ExampleLabel = new("TextLabel", {
    Text = "Hello",
    Size = UDim2.new(1, 0, 0, 30),
    BackgroundTransparency = 1,
    TextColor3 = Color3.fromRGB(255,255,255),
    Font = Enum.Font.Gotham,
    TextSize = 14,
    Parent = Content
})

CloB.MouseButton1Click:Connect(function()
    Win:Destroy()
end)

local IsMin = false
 MinB.MouseButton1Click:Connect(function()
    IsMin = not IsMin
    if IsMin then
      MinB.Image = "rbxassetid://10734924532"
       Tween(Win, {Time = 0.3, Goal = {Size = UDim2.new(0, 410, 0, 40)}})
       Tween(Win, {Time = 0.2, Goal = {Size = UDim2.new(0, 200, 0, 40)}})

       Tween(Tbar, {Time = 0.3, Goal = {Size = UDim2.new(0, 410, 0, 40)}})
       local t1 = Tween(Tbar, {Time = 0.2, Goal = {Size = UDim2.new(0, 200, 0, 40)}})
       t1.Completed:Wait()

       Tween(Win, {Time = 0.2, Goal = {Position = UDim2.new(0, 417, 0, 0)}})
       Tween(Win, {Time = 0.2, Goal = {AnchorPoint = Vector.new(0, 0)}})
    else
      MinB.Image = "rbxassetid://10734896206"
       Tween(Win, {Time = 0.3, Goal = {Size = UDim2.new(0, 410, 0, 40)}})
       Tween(Win, {Time = 0.2, Goal = {Size = UDim2.new(0, 410, 0, 305)}})

       Tween(Win, {Time = 0.2, Goal = {Position = UDim2.new(0.5, 0, 0.5, 0)}})
       Tween(Win, {Time = 0.2, Goal = {AnchorPoint = Vector2.new(0.5, 0.5)}})

       Tween(Tbar, {Time = 0.3, Goal = {Size = UDim2.new(0, 200, 0, 40)}})
       Tween(Tbar, {Time = 0.2, Goal = {Size = UDim2.new(0, 410, 0, 40)}})
    end
 end)
end

return Lib
