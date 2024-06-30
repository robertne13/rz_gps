--      ██████   ██████   █████  ███    ███ ███████ ███████    ███    ██ ███████ ████████ 
--      ██   ██ ██       ██   ██ ████  ████ ██         ███     ████   ██ ██         ██    
--      ██████  ██   ███ ███████ ██ ████ ██ █████     ███      ██ ██  ██ █████      ██    
--      ██   ██ ██    ██ ██   ██ ██  ██  ██ ██       ███       ██  ██ ██ ██         ██    
--      ██   ██  ██████  ██   ██ ██      ██ ███████ ███████ ██ ██   ████ ███████    ██    

-- Discord: https://discord.gg/CCnee9sQkG
-- Created by Robeer
-- Website RGamez.net

Config = {}

Config.command          = "rzgps"                                   -- Command to open
Config.MessageCommand   = "GPS SHOW"                                -- Message when you try to change the key on control options
Config.keyDefault       = "CAPITAL"                                 -- Block mayusc Caps lock as default you can pick anyone you like

---Optimization part                        
-- DO NOT TOUCH IF YOU DONT KNOW
Config.OpenTime         = 10                                        -- Time in seconds
Config.updateRate       = 500                                       -- If you decrease de number Worst performace higher number best performance

--- Lang Translation:
Config.locationText     = "Location:"                               -- Change it to whatever you want

--- Visual Settings
Config.Color            = "rgba(255, 255, 255, 1)"                  -- BorderColor and main color RGBA
Config.fontColor        = "rgba(0, 0, 0, 1)"                        -- Font Color
Config.backgroundColor  = "rgba(0, 0, 0, 0.6)"                      -- Background color RGBA