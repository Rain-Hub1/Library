local Lib = {}

function Lib:Window(Info)
    local Info = Info or {}

    local function new(ClassName, Props)
        local Instance = Instance.new(ClassName)
        for propertyName, Value in pairs(Props or {}) do
            Instance[propertyName] = Value
        end
        return Instance
    end

    if game:GetService("CoreGui"):FindFirstChild("Ember Lib") then
        game:GetService("CoreGui"):FindFirstChild("Ember Lib"):Destroy()
    end

    local CoreGui = game:GetService("CoreGui")
    local s = new("ScreenGui", {
        Name = "Ember Lib",
        Parent = CoreGui
    })

    local Win = new("Frame", {
        Name = "Window",
        Size = UDim2.new(0, Info.Size[1] or 410, 0, Info.Size[2] or 305),
        Position = UDim2.new(0, 260, 0, 49),
        BackgroundColor3 = Color3.fromHex("#f24115"),
        Parent = s
    })

    new("UICorner", { Parent = Win })

    local Tbar = new("Frame", {
        Name = "TitleBar",
        Size = UDim2.new(1, 0, 0, 30),
        BackgroundColor3 = Color3.fromHex("#d63912"),
        Parent = Win
    })

    new("UICorner", { Parent = Tbar })

    local Title = new("TextLabel", {
        Text = Info.Title or "Sem título",
        Size = UDim2.new(1, -40, 1, 0),
        Position = UDim2.new(0, 10, 0, 0),
        BackgroundTransparency = 1,
        TextColor3 = Color3.fromHex("#ffffff"),
        Font = Enum.Font.SourceSansBold,
        TextSize = 18,
        TextXAlignment = Enum.TextXAlignment.Left,
        Parent = Tbar
    })

    local CloseButton = new("TextButton", {
        Text = "X",
        Size = UDim2.new(0, 30, 1, 0),
        Position = UDim2.new(1, -30, 0, 0),
        BackgroundTransparency = 1,
        TextColor3 = Color3.fromHex("#ffffff"),
        Font = Enum.Font.SourceSansBold,
        TextSize = 18,
        Parent = Tbar
    })

    CloseButton.MouseButton1Click:Connect(function()
        s:Destroy()
    end)

    return Win
end

function Lib:Demo()
    local Win = Lib:Window({
        Title = "Demo title!",
        Size = {420, 340}
    })
end

Lib:Demo()

return Lib