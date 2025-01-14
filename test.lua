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
    Black = Color3.fromRGB(10, 10, 8) -- [#0A0A08] | K-Dev
  }
}

local UI_Theme = {
  dark = {
    Main = Color3.fromRGB(0, 0, 0),
    Border = Color3.fromRGB(52, 52, 52)
  },
  light = {
    Main = Color3.fromRGB(204, 204, 214),
    Secondary = Color3.fromRGB(240, 240, 240),
    Border = Color3.fromRGB(52, 52, 52)
  }
}

local NotificationTypes = {"Info", "Warning", "Alert", "Error"}
local NotificationColors = {
  Info = K_Stuff.K_Colors.Blue,
  Warning = K_Stuff.K_Colors.Yellow,
  Alert = K_Stuff.K_Colors.Orange,
  Error = K_Stuff.K_Colors.Red
}

-- Function to create a notification
local function createNotification(title, description, notifType)
  local color = NotificationColors[notifType] or K_Stuff.K_Colors.Black
  local notif = Instance.new("ScreenGui")
  notif.Name = "KNotification"
  notif.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

  local frame = Instance.new("Frame")
  frame.Size = UDim2.new(0, 300, 0, 100)
  frame.Position = UDim2.new(1, -320, 1, -120)
  frame.BackgroundColor3 = color
  frame.BorderSizePixel = 2
  frame.BorderColor3 = UI_Theme.dark.Border
  frame.Parent = notif

  local titleLabel = Instance.new("TextLabel")
  titleLabel.Text = title
  titleLabel.Size = UDim2.new(1, 0, 0.3, 0)
  titleLabel.Position = UDim2.new(0, 0, 0, 0)
  titleLabel.BackgroundTransparency = 1
  titleLabel.TextScaled = true
  titleLabel.TextColor3 = K_Stuff.K_Colors.Black
  titleLabel.Font = Enum.Font.SourceSansBold
  titleLabel.Parent = frame

  local descriptionLabel = Instance.new("TextLabel")
  descriptionLabel.Text = description
  descriptionLabel.Size = UDim2.new(1, 0, 0.7, 0)
  descriptionLabel.Position = UDim2.new(0, 0, 0.3, 0)
  descriptionLabel.BackgroundTransparency = 1
  descriptionLabel.TextScaled = true
  descriptionLabel.TextColor3 = K_Stuff.K_Colors.Black
  descriptionLabel.Font = Enum.Font.SourceSans
  descriptionLabel.Parent = frame

  -- Auto-remove notification after 5 seconds
  task.delay(5, function()
    notif:Destroy()
  end)
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