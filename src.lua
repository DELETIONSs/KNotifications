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

local UI-Theme = {
  dark {
  Main: Color3.fromRGB(0,0,0),
  Border: Color3.fromRGB(52, 52, 52),
  }
  light {
  Main: Color3.fromRGB(204,204,214),
    Secondary: Color3.fromRGB(
  Border: #343434,
  }
}
local NotificationTypes = ["Info","Warning","Alert","Error"]
local NotificationColors = {
    Info = K_Stuff.K_Colors.Blue,
    Warning = K_Stuff.K_Colors.Yellow,
    Alert = K_Stuff.K_Colors.Orange,
    Error = K_Stuff.K_Colors.Red
  }
