--[[
>=>   >=>          >====>                           
>=>  >=>           >=>   >=>                         
>=> >=>            >=>    >=>   >==>    >=>     >=>  
>>=>>       >====> >=>    >=> >>   >=>   >=>   >=>   
>=>  >=>           >=>    >=> >>===>>=>   >=> >=>    
>=>   >=>          >=>   >=>  >>           >=>=>     
>=>     >=>        >====>      >====>       >=>      

-- Owner: re_sistance (Kadan6407's Alt)
-- Scripting: re_sistance
-- Colors: re_sistance
-- Language: luau (Roblox Lua) 
-- Thank you <3
]]

local K_Stuff = {
  K_Colors = {
    Red = Color3.fromRGB(255, 84, 73), -- [#FF5449] | K-Dev
    Orange = Color3.fromRGB(255, 92, 0), -- [#ff5c00] | Neon-Orange *Figma 2025
    Yellow = Color3.fromRGB(255, 222, 33), -- [#ffde21] | Yellow *Figma 2025
    Green = Color3.fromRGB(137, 243, 54), -- [#89f336] | Lime-Green *Figma 2025
    Blue = Color3.fromRGB(35, 35, 255), -- [#2323ff] | Neon-Blue *Figma 2025
    Purple = Color3.fromRGB(98, 0, 238), -- [#6200EE] | K-Dev
    Black = Color3.fromRGB(10, 10, 8), -- [#0A0A08] | K-Dev
    White = Color3.fromRGB(255, 255, 255) -- White for light theme
  }
}

local UI_Theme = {
  Dark = {
    Main = Color3.fromRGB(0, 0, 0),
    Border = Color3.fromRGB(52, 52, 52),
    TextColor = K_Stuff.K_Colors.White
  },
  Light = {
    Main = Color3.fromRGB(204, 204, 214),
    Border = Color3.fromRGB(52, 52, 52),
    TextColor = K_Stuff.K_Colors.Black
  }
}

local NotificationColors = {
  Info = K_Stuff.K_Colors.Blue,
  Warning = K_Stuff.K_Colors.Yellow,
  Alert = K_Stuff.K_Colors.Orange,
  Error = K_Stuff.K_Colors.Red
}

local notificationStack = {} -- Keeps track of active notifications
local spacing = 110 -- Vertical spacing between notifications

-- Function to create gradient for progress bar
local function createGradient(color)
  local gradient = Instance.new("UIGradient")
  gradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, color),
    ColorSequenceKeypoint.new(1, Color3.new(1, 1, 1)) -- Fade to white
  }
  gradient.Rotation = 0 -- Horizontal gradient
  return gradient
end

-- Function to create a notification
local function createNotification(title, description, notifType)
  local color = NotificationColors[notifType] or K_Stuff.K_Colors.Black
  local theme = UI_Theme[_G.Theme] or UI_Theme.Dark
  local lifetime = 5 -- Duration in seconds

  local notif = Instance.new("ScreenGui")
  notif.Name = "KNotification"
  notif.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

  local frame = Instance.new("Frame")
  frame.Size = UDim2.new(0, 300, 0, 100)
  frame.Position = UDim2.new(1, -320, 1, -#notificationStack * spacing - 120)
  frame.BackgroundColor3 = theme.Main -- Background color based on theme
  frame.BorderSizePixel = 2
  frame.BorderColor3 = theme.Border
  frame.Parent = notif

  local titleLabel = Instance.new("TextLabel")
  titleLabel.Text = title
  titleLabel.Size = UDim2.new(1, 0, 0.3, 0)
  titleLabel.Position = UDim2.new(0, 0, 0, 0)
  titleLabel.BackgroundTransparency = 1
  titleLabel.TextScaled = true
  titleLabel.TextColor3 = color -- Title color based on notification type
  titleLabel.Font = Enum.Font.Roboto -- Set to Roboto font
  titleLabel.Parent = frame

  local descriptionLabel = Instance.new("TextLabel")
  descriptionLabel.Text = description
  descriptionLabel.Size = UDim2.new(1, 0, 0.7, 0)
  descriptionLabel.Position = UDim2.new(0, 0, 0.3, 0)
  descriptionLabel.BackgroundTransparency = 1
  descriptionLabel.TextScaled = true
  descriptionLabel.TextColor3 = theme.TextColor -- Description text color based on theme
  descriptionLabel.Font = Enum.Font.Roboto -- Set to Roboto font
  descriptionLabel.Parent = frame

  -- Create progress bar with gradient
  local progressBar = Instance.new("Frame")
  progressBar.Size = UDim2.new(1, 0, 0.05, 0)
  progressBar.Position = UDim2.new(0, 0, 0.95, 0)
  progressBar.BackgroundColor3 = color -- Base color (gradient will override this)
  progressBar.BorderSizePixel = 0
  progressBar.Parent = frame

  local gradient = createGradient(color)
  gradient.Parent = progressBar

  -- Animate progress bar
  local startTime = tick()
  local function updateProgress()
    local elapsedTime = tick() - startTime
    local progress = math.clamp(1 - (elapsedTime / lifetime), 0, 1)
    progressBar.Size = UDim2.new(progress, 0, 0.05, 0)

    if progress <= 0 then
      notif:Destroy()
      table.remove(notificationStack, table.find(notificationStack, frame))
      for i, notifFrame in ipairs(notificationStack) do
        notifFrame:TweenPosition(UDim2.new(1, -320, 1, -i * spacing - 120), "Out", "Quad", 0.5, true)
      end
    end
  end

  -- Hover behavior
  frame.MouseEnter:Connect(function()
    frame:TweenPosition(UDim2.new(1, -420, 1, -#notificationStack * spacing - 120), "Out", "Quad", 0.3, true)
  end)
  frame.MouseLeave:Connect(function()
    frame:TweenPosition(UDim2.new(1, -320, 1, -#notificationStack * spacing - 120), "Out", "Quad", 0.3, true)
  end)

  -- Run the update loop for the progress bar
  spawn(function()
    while notif.Parent do
      updateProgress()
      task.wait(0.1)
    end
  end)

  table.insert(notificationStack, frame)
end

-- Create KNotification table with methods
local KNotification = {}

function KNotification:SendInfo(title, description)
  createNotification(title, description, "Info")
end

function KNotification:SendWarning(title, description)
  createNotification(title, description, "Warning")
end

function KNotification:SendAlert(title, description)
  createNotification(title, description, "Alert")
end

function KNotification:SendError(title, description)
  createNotification(title, description, "Error")
end

return KNotification
