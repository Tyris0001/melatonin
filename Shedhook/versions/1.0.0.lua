local Library = {
    Title = "Melatonin UI",
    Windows = {},
    CurrentWindow = nil,
    Settings = {
        Tween = true,
        Drag = { Enabled = true, Latency = 0.08, Speed = 0.15 },
        Animation = { Speed = 0.12, Easing = "quad" }
    },
    Assets = {},
    PlayerListElement = {},
    Flags = {},
    Theme = {
        Selected = "Default",
        List = {
            ["Default"] = {
                ["Accent"] = {100, 150, 255, 255},
                ["Warning"] = {255, 100, 100, 255}, 
                ["Error"] = {255, 200, 100, 255},
                ["Header"] = {200, 200, 200, 255}, 
                ["Text"] = {180, 180, 180, 255},
                ["Secondary"] = {120, 120, 120, 255},
                ["Outer"] = {60, 60, 60, 255},
                ["Light"] = {45, 45, 45, 255},
                ["Dark"] = {30, 30, 30, 255},
                ["High"] = {25, 25, 25, 255},
                ["Mid"] = {20, 20, 20, 255},
                ["Low"] = {15, 15, 15, 255},
                ["Stroke"] = {10, 10, 10, 255},
                ["AccentLight"] = {120, 170, 255, 255}, 
                ["MidLight"] = {30, 30, 30, 255}, 
            },
            ["Blue"] = {
                ["Accent"] = {100, 150, 255, 255},
                ["Warning"] = {255, 100, 100, 255}, 
                ["Error"] = {255, 200, 100, 255},
                ["Header"] = {150, 200, 255, 255}, 
                ["Text"] = {200, 220, 255, 255},
                ["Secondary"] = {120, 150, 200, 255},
                ["Outer"] = {60, 80, 120, 255},  
                ["Light"] = {30, 45, 80, 255},
                ["Dark"] = {20, 30, 60, 255},
                ["High"] = {15, 25, 50, 255},
                ["Mid"] = {10, 20, 40, 255},
                ["Low"] = {5, 15, 30, 255},
                ["Stroke"] = {0, 10, 20, 255},
                ["AccentLight"] = {120, 170, 255, 255}, 
                ["MidLight"] = {30, 30, 30, 255},
            },
            ["Abyss"] = {
                ["Accent"] = {140, 135, 180, 255},
                ["Warning"] = {255, 80, 80, 255},
                ["Error"] = {255, 180, 80, 255},
                ["Header"] = {170, 165, 200, 255},
                ["Text"] = {200, 200, 220, 255},
                ["Secondary"] = {110, 105, 140, 255},
                ["Outer"] = {40, 40, 60, 255},  
                ["Light"] = {30, 30, 45, 255},
                ["Dark"] = {20, 20, 30, 255},
                ["High"] = {15, 15, 25, 255},
                ["Mid"] = {10, 10, 20, 255},
                ["Low"] = {5, 5, 15, 255},
                ["Stroke"] = {0, 0, 10, 255},
                ["AccentLight"] = {120, 170, 255, 255}, 
                ["MidLight"] = {30, 30, 30, 255},
            },
            ["Fatality"] = {
                ["Accent"] = {240, 15, 80, 255},
                ["Warning"] = {255, 50, 50, 255},
                ["Error"] = {255, 180, 50, 255},
                ["Header"] = {240, 100, 130, 255},
                ["Text"] = {240, 200, 200, 255},
                ["Secondary"] = {180, 10, 60, 255},
                ["Outer"] = {50, 30, 40, 255},  
                ["Light"] = {50, 15, 30, 255},
                ["Dark"] = {40, 10, 25, 255},
                ["High"] = {35, 10, 22, 255},
                ["Mid"] = {30, 8, 20, 255},
                ["Low"] = {25, 5, 15, 255},
                ["Stroke"] = {15, 2, 10, 255},
                ["AccentLight"] = {120, 170, 255, 255}, 
                ["MidLight"] = {30, 30, 30, 255},
            },
            ["Neverlose"] = {
                ["Accent"] = {0, 180, 240, 255},
                ["Warning"] = {255, 100, 100, 255},
                ["Error"] = {255, 200, 100, 255},
                ["Header"] = {150, 220, 255, 255},
                ["Text"] = {200, 230, 255, 255},
                ["Secondary"] = {0, 140, 190, 255},
                ["Outer"] = {30, 50, 70, 255},  
                ["Light"] = {0, 40, 70, 255},
                ["Dark"] = {0, 30, 50, 255},
                ["High"] = {0, 25, 45, 255},
                ["Mid"] = {0, 20, 40, 255},
                ["Low"] = {0, 15, 30, 255},
                ["Stroke"] = {0, 10, 20, 255},
                ["AccentLight"] = {120, 170, 255, 255}, 
                ["MidLight"] = {30, 30, 30, 255},
            },
            ["Aimware"] = {
                ["Accent"] = {200, 40, 40, 255},
                ["Warning"] = {255, 80, 80, 255},
                ["Error"] = {255, 180, 80, 255},
                ["Header"] = {220, 100, 100, 255},
                ["Text"] = {230, 230, 230, 255},
                ["Secondary"] = {160, 30, 30, 255},
                ["Outer"] = {40, 40, 40, 255},  
                ["Light"] = {40, 40, 40, 255},
                ["Dark"] = {25, 25, 25, 255},
                ["High"] = {20, 20, 20, 255},
                ["Mid"] = {15, 15, 15, 255},
                ["Low"] = {10, 10, 10, 255},
                ["Stroke"] = {5, 5, 5, 255},
                ["AccentLight"] = {120, 170, 255, 255}, 
                ["MidLight"] = {30, 30, 30, 255},
            },
            ["Youtube"] = {
                ["Accent"] = {255, 0, 0, 255},
                ["Warning"] = {255, 80, 80, 255},
                ["Error"] = {255, 180, 80, 255},
                ["Header"] = {240, 100, 100, 255},
                ["Text"] = {240, 240, 240, 255},
                ["Secondary"] = {180, 40, 40, 255},
                ["Outer"] = {40, 40, 40, 255},  
                ["Light"] = {35, 35, 35, 255},
                ["Dark"] = {25, 25, 25, 255},
                ["High"] = {20, 20, 20, 255},
                ["Mid"] = {15, 15, 15, 255},
                ["Low"] = {10, 10, 10, 255},
                ["Stroke"] = {5, 5, 5, 255},
                ["AccentLight"] = {120, 170, 255, 255}, 
                ["MidLight"] = {30, 30, 30, 255},
            },
            ["Gamesense"] = {
                ["Accent"] = {167, 217, 77, 255},
                ["Warning"] = {255, 80, 80, 255},
                ["Error"] = {255, 180, 80, 255},
                ["Header"] = {200, 230, 150, 255},
                ["Text"] = {220, 240, 200, 255},
                ["Secondary"] = {130, 180, 60, 255},
                ["Outer"] = {40, 50, 30, 255},  
                ["Light"] = {40, 50, 20, 255},
                ["Dark"] = {30, 40, 15, 255},
                ["High"] = {25, 35, 12, 255},
                ["Mid"] = {20, 30, 10, 255},
                ["Low"] = {15, 25, 8, 255},
                ["Stroke"] = {10, 20, 5, 255},
                ["AccentLight"] = {120, 170, 255, 255}, 
                ["MidLight"] = {30, 30, 30, 255},
            },
            ["Onetap"] = {
                ["Accent"] = {221, 168, 93, 255},
                ["Warning"] = {255, 80, 80, 255},
                ["Error"] = {255, 180, 80, 255},
                ["Header"] = {230, 200, 150, 255},
                ["Text"] = {214, 217, 224, 255},
                ["Secondary"] = {180, 140, 80, 255},
                ["Outer"] = {50, 50, 60, 255},  
                ["Light"] = {50, 50, 60, 255},
                ["Dark"] = {40, 40, 50, 255},
                ["High"] = {35, 35, 45, 255},
                ["Mid"] = {30, 30, 40, 255},
                ["Low"] = {25, 25, 35, 255},
                ["Stroke"] = {15, 15, 25, 255},
                ["AccentLight"] = {120, 170, 255, 255}, 
                ["MidLight"] = {30, 30, 30, 255},
            },
            ["Entropy"] = {
                ["Accent"] = {129, 187, 233, 255},
                ["Warning"] = {255, 80, 80, 255},
                ["Error"] = {255, 180, 80, 255},
                ["Header"] = {180, 220, 240, 255},
                ["Text"] = {220, 220, 220, 255},
                ["Secondary"] = {100, 160, 200, 255},
                ["Outer"] = {60, 60, 70, 255},  
                ["Light"] = {60, 60, 70, 255},
                ["Dark"] = {45, 45, 55, 255},
                ["High"] = {40, 40, 50, 255},
                ["Mid"] = {35, 35, 45, 255},
                ["Low"] = {30, 30, 40, 255},
                ["Stroke"] = {20, 20, 30, 255},
                ["AccentLight"] = {120, 170, 255, 255}, 
                ["MidLight"] = {30, 30, 30, 255},
            },
            ["Interwebz"] = {
                ["Accent"] = {201, 101, 75, 255},
                ["Warning"] = {255, 80, 80, 255},
                ["Error"] = {255, 180, 80, 255},
                ["Header"] = {230, 170, 150, 255},
                ["Text"] = {250, 250, 250, 255},
                ["Secondary"] = {170, 80, 60, 255},
                ["Outer"] = {50, 40, 60, 255},  
                ["Light"] = {50, 30, 60, 255},
                ["Dark"] = {40, 20, 50, 255},
                ["High"] = {35, 15, 45, 255},
                ["Mid"] = {30, 10, 40, 255},
                ["Low"] = {25, 5, 35, 255},
                ["Stroke"] = {15, 0, 25, 255},
                ["AccentLight"] = {120, 170, 255, 255}, 
                ["MidLight"] = {30, 30, 30, 255},
            },
            ["Dracula"] = {
                ["Accent"] = {154, 129, 179, 255},
                ["Warning"] = {255, 80, 80, 255},
                ["Error"] = {255, 180, 80, 255},
                ["Header"] = {180, 165, 200, 255},
                ["Text"] = {180, 180, 184, 255},
                ["Secondary"] = {130, 110, 150, 255},
                ["Outer"] = {52, 53, 76, 255},  
                ["Light"] = {42, 44, 70, 255},
                ["Dark"] = {37, 39, 64, 255},
                ["High"] = {32, 34, 56, 255},
                ["Mid"] = {27, 29, 49, 255},
                ["Low"] = {22, 24, 44, 255},
                ["Stroke"] = {17, 19, 39, 255},
                ["AccentLight"] = {120, 170, 255, 255}, 
                ["MidLight"] = {30, 30, 30, 255},
            },
            ["Spotify"] = {
                ["Accent"] = {30, 215, 96, 255},
                ["Warning"] = {255, 80, 80, 255},
                ["Error"] = {255, 180, 80, 255},
                ["Header"] = {100, 230, 150, 255},
                ["Text"] = {200, 240, 200, 255},
                ["Secondary"] = {20, 180, 70, 255},
                ["Outer"] = {30, 40, 35, 255},  
                ["Light"] = {20, 40, 25, 255},
                ["Dark"] = {15, 30, 20, 255},
                ["High"] = {12, 25, 17, 255},
                ["Mid"] = {10, 20, 15, 255},
                ["Low"] = {8, 15, 10, 255},
                ["Stroke"] = {5, 10, 7, 255},
                ["AccentLight"] = {120, 170, 255, 255}, 
                ["MidLight"] = {30, 30, 30, 255},
            },
            ["Sublime"] = {
                ["Accent"] = {255, 152, 0, 255},
                ["Warning"] = {255, 80, 80, 255},
                ["Error"] = {255, 180, 80, 255},
                ["Header"] = {255, 200, 100, 255},
                ["Text"] = {230, 255, 255, 255},
                ["Secondary"] = {200, 130, 0, 255},
                ["Outer"] = {70, 70, 65, 255},  
                ["Light"] = {70, 70, 60, 255},
                ["Dark"] = {60, 60, 50, 255},
                ["High"] = {55, 55, 45, 255},
                ["Mid"] = {50, 50, 40, 255},
                ["Low"] = {45, 45, 35, 255},
                ["Stroke"] = {35, 35, 25, 255},
                ["AccentLight"] = {120, 170, 255, 255}, 
                ["MidLight"] = {30, 30, 30, 255},
            },
            ["Vape"] = {
                ["Accent"] = {38, 134, 106, 255},
                ["Warning"] = {255, 80, 80, 255},
                ["Error"] = {255, 180, 80, 255},
                ["Header"] = {120, 200, 160, 255},
                ["Text"] = {220, 220, 220, 255},
                ["Secondary"] = {30, 110, 85, 255},
                ["Outer"] = {40, 40, 40, 255},  
                ["Light"] = {35, 35, 35, 255},
                ["Dark"] = {25, 25, 25, 255},
                ["High"] = {20, 20, 20, 255},
                ["Mid"] = {15, 15, 15, 255},
                ["Low"] = {10, 10, 10, 255},
                ["Stroke"] = {5, 5, 5, 255},
                ["AccentLight"] = {120, 170, 255, 255}, 
                ["MidLight"] = {30, 30, 30, 255},
            },
            ["Neko"] = {
                ["Accent"] = {210, 31, 106, 255},
                ["Warning"] = {255, 80, 80, 255},
                ["Error"] = {255, 180, 80, 255},
                ["Header"] = {230, 100, 150, 255},
                ["Text"] = {255, 255, 255, 255},
                ["Secondary"] = {180, 20, 80, 255},
                ["Outer"] = {40, 40, 40, 255},  
                ["Light"] = {35, 35, 35, 255},
                ["Dark"] = {25, 25, 25, 255},
                ["High"] = {20, 20, 20, 255},
                ["Mid"] = {15, 15, 15, 255},
                ["Low"] = {10, 10, 10, 255},
                ["Stroke"] = {5, 5, 5, 255},
                ["AccentLight"] = {120, 170, 255, 255}, 
                ["MidLight"] = {30, 30, 30, 255},
            },
            ["Corn"] = {
                ["Accent"] = {255, 144, 0, 255},
                ["Warning"] = {255, 80, 80, 255},
                ["Error"] = {255, 180, 80, 255},
                ["Header"] = {255, 200, 100, 255},
                ["Text"] = {220, 220, 220, 255},
                ["Secondary"] = {220, 120, 0, 255},
                ["Outer"] = {50, 50, 50, 255},  
                ["Light"] = {50, 50, 50, 255},
                ["Dark"] = {40, 40, 40, 255},
                ["High"] = {35, 35, 35, 255},
                ["Mid"] = {30, 30, 30, 255},
                ["Low"] = {25, 25, 25, 255},
                ["Stroke"] = {15, 15, 15, 255},
                ["AccentLight"] = {120, 170, 255, 255}, 
                ["MidLight"] = {30, 30, 30, 255},
            },
            ["Minecraft"] = {
                ["Accent"] = {39, 206, 64, 255},
                ["Warning"] = {255, 80, 80, 255},
                ["Error"] = {255, 180, 80, 255},
                ["Header"] = {100, 220, 120, 255},
                ["Text"] = {255, 255, 255, 255},
                ["Secondary"] = {30, 180, 50, 255},
                ["Outer"] = {70, 70, 70, 255},  
                ["Light"] = {70, 70, 70, 255},
                ["Dark"] = {60, 60, 60, 255},
                ["High"] = {55, 55, 55, 255},
                ["Mid"] = {50, 50, 50, 255},
                ["Low"] = {45, 45, 45, 255},
                ["Stroke"] = {35, 35, 35, 255},
                ["AccentLight"] = {120, 170, 255, 255}, 
                ["MidLight"] = {30, 30, 30, 255},
            }
        }
    },
    OpenDropdown = nil,
    OpenColorPicker = nil,
    OpenKeybindMenu = nil,
    ActivePopups = {},
    PopupBlocking = false,
    SortedElements = {},
    Players = {},
    KeyStates = {},
    ESPPreview = {
        Enabled = true,
        Components = {
            Box = true,
            HealthBar = true,
            Name = true,
            Distance = true,
            Weapon = true,
            Skeleton = false,
            Flags = true
        },
        Colors = {
            Box = {255, 255, 255, 255},
            HealthHigh = {0, 255, 0, 255},
            HealthLow = {255, 0, 0, 255},
            Name = {255, 255, 255, 255},
            Distance = {255, 255, 255, 255},
            Weapon = {255, 255, 255, 255},
            Skeleton = {255, 255, 255, 255},
            Flags = {255, 255, 0, 255}
        },
        HealthValue = 75,
        AnimationSpeed = 0.001
    },
    AllKeybinds = {},
    
    -- ESP System Integration
    ESP = {
        Enabled = false,
        OnlyEnemies = false,
        MaxDistance = 1000,
        CacheCooldown = 30,
        
        -- Component Settings
        ShowName = true,
        ShowDistance = true,
        ShowHealth = true,
        Show2DBox = true,
        ShowWeapon = true,
        ShowSkeleton = false,
        ShowTeam = true,
        ShowFlags = true,
        ShowTags = false, -- NEW: Separate toggle for [Enemy]/[Friend] tags
        
        -- Colors
        Colors = {
            Enemy = {255, 50, 50, 255},
            Friendly = {50, 255, 50, 255},
            Local = {50, 150, 255, 255},
            Whitelisted = {255, 255, 0, 255},
            HealthHigh = {0, 255, 0, 255},
            HealthMed = {255, 255, 0, 255},
            HealthLow = {255, 0, 0, 255},
            Box = {255, 255, 255, 255},
            Name = {255, 255, 255, 255},
            Distance = {255, 255, 255, 255},
            Weapon = {255, 255, 255, 255},
            Skeleton = {255, 255, 255, 255},
            Flags = {255, 255, 0, 255}
        },
        
        -- Internal
        CachedPlayers = {},
        LastUpdateTime = 0,
        Flags = {},
        
        -- Settings
        Font = 2,
        HealthBarWidth = 4,
        HealthBarOffset = 10,
        FlagOffset = 40,
        PredictionEnabled = true,
        PredictionStrength = 1.0
    },
    
    ConfigSystem = {
        Configs = {},
        CurrentConfig = "",
        ConfigIndex = "melatonin_configs.json"
    },

    Notifications = {
        List = {},
        MaxVisible = 5,
        Position = "top-left",
        Duration = 3000,
        FadeDuration = 500,
        Spacing = 10,
        Width = 300,
        Height = 50,
        AnimSpeed = 0.05
    },

    Watermark = nil,
    TargetHUD = nil,
    SharedData = {
        fps = 0,
        ping = "Unknown",
        playerName = "Unknown"
    }
}


local mods_names = { "neddleduck", "georgey1", "ChickenBagelz", "AsianAbrex", "Warm_Vibes", "YTGonzo", "tomsons57", "cleandrawls", "Rikumah", "harrib_allsack54321",
"dittrich11_yt", "HMH_Hazzz", "gofinek", "cinnphony", "Edvarddz", "kerub131", "kregixd", "GuyOne311", "baconman11538", "LUKASAJs", "Devlzy", "Lost_Test", "MiniatureSigy",
"KittenBagelz", "DoHbaccep_666", "Here4Money2", "ShadowsPetSnail"
}

-- bruh 

local function contains(table, value)
    for _, v in ipairs(table) do
        if v == value then
            return true
        end
    end
    return false
end

local function split(pString, pPattern)
   local Table = {} 
   local fpat = "(.-)" .. pPattern
   local last_end = 1
   local s, e, cap = pString:find(fpat, 1)
   while s do
      if s ~= 1 or cap ~= "" then
     table.insert(Table,cap)
      end
      last_end = e+1
      s, e, cap = pString:find(fpat, last_end)
   end
   if last_end <= #pString then
      cap = pString:sub(last_end)
      table.insert(Table, cap)
   end
   return Table
end



-- flags
Library.ESP.DefaultFlags = {
    LowHealth = {
        name = "Low HP",
        color = Library.ESP.Colors.HealthLow,
        condition = function(player)
            return player:get_health() <= 30
        end,
        priority = 10
    },
    Visible = {
        name = "Visible",
        color = Library.ESP.Colors.HealthHigh,
        condition = function(player)
            return player:is_visible()
        end,
        priority = 5
    },
    NotVisible = {
        name = "Hidden",
        color = {255, 0, 0, 255},
        condition = function(player)
            return not player:is_visible()
        end,
        priority = 4
    },
    Whitelisted = {
        name = "Friend",
        color = Library.ESP.Colors.Whitelisted,
        condition = function(player)
            return player:is_whitelisted()
        end,
        priority = 2
    },
    Whitelisted = {
        name = "Moderator",
        color = {250, 143, 12, 255},
        condition = function(player)
            return contains(mods_names, player:get_name())
        end,
        priority = 1
    }
}


local Element = {}
Element.__index = Element

local Tab = {}
Tab.__index = Tab
setmetatable(Tab, Element)

local Window = {}
Window.__index = Window
setmetatable(Window, Element)

local Section = {}
Section.__index = Section
setmetatable(Section, Element)

local MultiSection = {}
MultiSection.__index = MultiSection
setmetatable(MultiSection, Section)

local Button = {}
Button.__index = Button
setmetatable(Button, Element)

local Toggle = {}
Toggle.__index = Toggle
setmetatable(Toggle, Element)

local Slider = {}
Slider.__index = Slider
setmetatable(Slider, Element)

local Dropdown = {}
Dropdown.__index = Dropdown
setmetatable(Dropdown, Element)

local MultiSelectDropdown = {}
MultiSelectDropdown.__index = MultiSelectDropdown
setmetatable(MultiSelectDropdown, Element)

local ColorPicker = {}
ColorPicker.__index = ColorPicker
setmetatable(ColorPicker, Element)

-- New Attached ColorPicker for Toggle elements
local AttachedColorPicker = {}
AttachedColorPicker.__index = AttachedColorPicker
setmetatable(AttachedColorPicker, Element)

local PlayerList = {}
PlayerList.__index = PlayerList
setmetatable(PlayerList, Element)

local Keybind = {}
Keybind.__index = Keybind
setmetatable(Keybind, Element)

local ESPPreview = {}
ESPPreview.__index = ESPPreview
setmetatable(ESPPreview, Element)

local KeybindsList = {}
KeybindsList.__index = KeybindsList
setmetatable(KeybindsList, Element)

local TargetHUD = {}
TargetHUD.__index = TargetHUD
setmetatable(TargetHUD, Element)

local List = {}
List.__index = List
setmetatable(List, Element)

local Input = {}
Input.__index = Input
setmetatable(Input, Element)

local Label = {}
Label.__index = Label
setmetatable(Label, Element)


local Notification = {}
Notification.__index = Notification

local ZIndexCounter = 1000
local ActiveElements = {}

-- init assets --
do
    http.get("https://raw.githubusercontent.com/Tyris0001/melatonin/refs/heads/main/assets/Joeyy.png", {}, function(imageData)
        if imageData and #imageData > 0 then
            local textureId = utility.load_image(imageData)
            if textureId then
                Library.Assets.Joeyy = textureId
            end
        end
    end)
end

-- Helper function to rotate a point around origin
function Library.ESP:RotatePoint(x, z, angle)
    local cos_angle = math.cos(angle)
    local sin_angle = math.sin(angle)
    local rotatedX = x * cos_angle - z * sin_angle
    local rotatedZ = x * sin_angle + z * cos_angle
    return rotatedX, rotatedZ
end

function Library.ESP:DrawLine(x1, y1, x2, y2, color, thickness)
    local r, g, b, a = color[1], color[2], color[3], color[4]
    render.line(x1, y1, x2, y2, r, g, b, a, thickness or 1)
end

function Library.ESP:DrawRect(x, y, width, height, color, filled, rounding)
    local r, g, b, a = color[1], color[2], color[3], color[4]
    if filled then
        render.rect(x, y, width, height, r, g, b, a, rounding or 0)
    else
        render.rect_outline(x, y, width, height, r, g, b, a, rounding or 0)
    end
end

function Library.ESP:DrawText(x, y, text, font, color, centered, scale_factor)
    local r, g, b, a = color[1], color[2], color[3], color[4]
    scale_factor = scale_factor or 1.0
    
    -- Apply scaling to font size and position adjustments
    local scaled_font = math.max(1, math.floor((font or 2) * scale_factor))
    
    if centered then
        local textWidth, textHeight = render.measure_text(scaled_font, true, text)
        x = x - textWidth / 2
        y = y - textHeight / 2
    end
    render.text(x, y, r, g, b, a, scaled_font, true, text)
    return render.measure_text(scaled_font, true, text)
end

-- Get entity color based on status
function Library.ESP:GetEntityColor(entity_obj)
    local localPlayer = entity.get_local_player()
    if entity_obj:is_whitelisted() then
        return self.Colors.Whitelisted
    elseif entity_obj == localPlayer then
        return self.Colors.Local
    elseif entity_obj:is_enemy() then
        return self.Colors.Enemy
    else
        return self.Colors.Friendly
    end
end

-- FIXED: Get player bounding box with proper scaling
function Library.ESP:GetPlayerBounds(player)
    local x, y, width, height = player:get_bbox()
    
    return x, y, width, height, 1.0
end

-- FIXED: Draw 2D box with proper bounds and scaling
function Library.ESP:Draw2DBox(player, color)
    local x, y, width, height, scale_factor = self:GetPlayerBounds(player)
    
    -- Draw box outline with scaling
    local thickness = math.max(1, math.floor(1 * scale_factor))
    self:DrawRect(x, y, width, height, color, false, 0)
    
    -- Draw black outline for better visibility
    self:DrawRect(x - 1, y - 1, width + 2, height + 2, {0, 0, 0, 180}, false, 0)
    
    return x, y, width, height, scale_factor
end

-- FIXED: Draw health bar with proper positioning and scaling
function Library.ESP:DrawHealthBar(x, y, width, height, percentage, boxX, scale_factor)
    scale_factor = 1.0
    
    -- Position health bar to the left of the box, scaled
    local barWidth = math.max(2, math.floor(self.HealthBarWidth * scale_factor))
    local barOffset = math.floor(self.HealthBarOffset * scale_factor)
    local barX = boxX - barWidth - barOffset
    local barY = y
    local barHeight = height
    
    -- Background
    self:DrawRect(barX, barY, barWidth, barHeight, {0, 0, 0, 200}, true, 0)
    self:DrawRect(barX, barY, barWidth, barHeight, {255, 255, 255, 255}, false, 0)
    
    -- Calculate color based on health percentage
    local r, g, b
    if percentage > 75 then
        r, g, b = self.Colors.HealthHigh[1], self.Colors.HealthHigh[2], self.Colors.HealthHigh[3]
    elseif percentage > 30 then
        r, g, b = self.Colors.HealthMed[1], self.Colors.HealthMed[2], self.Colors.HealthMed[3]
    else
        r, g, b = self.Colors.HealthLow[1], self.Colors.HealthLow[2], self.Colors.HealthLow[3]
    end
    
    -- Fill health bar from bottom to top
    local fillHeight = math.floor(barHeight * (percentage / 100))
    if fillHeight > 0 then
        self:DrawRect(barX + 1, barY + (barHeight - fillHeight) - 1, barWidth - 2, fillHeight, {r, g, b, 200}, true, 0)
    end
    
    -- Health text next to bar, scaled
    local healthText = tostring(math.floor(percentage))
    local textOffset = math.floor(25 * scale_factor)
    self:DrawText(barX-10, barY + barHeight/2, healthText, 1, {255, 255, 255, 255}, true, scale_factor)
end


function Library.ESP:GetPlayerPartPosition(plr, bone) 

    local characters = game.get_workspace()
    local plr_char = characters:find_first_child(plr:get_name())
    if plr_char == nil then return vector(0,0,0) end

    local player_bone = plr_char:find_first_child(bone)
    if player_bone == nil then return vector(0,0,0) end

    local position = vector(player_bone:get_position())
    if not plr_char or not position then
        return vector(0,0,0)
    end
  
    return position
end

-- Fixed skeleton ESP
function Library.ESP:DrawSkeleton(player, color)
    
    -- R6 bones (more reliable)
    local R6_bones = {
        {"Head", "Torso"},
        {"Torso", "Right Arm"},
        {"Torso", "Left Arm"},
        {"Torso", "Right Leg"},
        {"Torso", "Left Leg"}
    }
    
    -- R15 bones (fallback)
    local R15_bones = {
        {"Head", "UpperTorso"},
        {"UpperTorso", "LowerTorso"},
        {"UpperTorso", "LeftUpperArm"},
        {"UpperTorso", "RightUpperArm"},
        {"LeftUpperArm", "LeftLowerArm"},
        {"RightUpperArm", "RightLowerArm"},
        {"LeftLowerArm", "LeftHand"},
        {"RightLowerArm", "RightHand"},
        {"LowerTorso", "LeftUpperLeg"},
        {"LowerTorso", "RightUpperLeg"},
        {"LeftUpperLeg", "LeftLowerLeg"},
        {"RightUpperLeg", "RightLowerLeg"},
        {"LeftLowerLeg", "LeftFoot"},
        {"RightLowerLeg", "RightFoot"}
    }
    
    -- Try R15 first, fallback to R6
    local bones = R15_bones
    local testBone = self:GetPlayerPartPosition(player, "UpperTorso")
    if testBone.x == 0 then
        bones = R6_bones
    end

    
    local validConnections = 0
    for _, connection in ipairs(bones) do
        local bone1Pos = vector(player:bone_position(connection[1]))
        local bone2Pos = vector(player:bone_position(connection[2]))
        
        if #bones == #R15_bones then
            bone1Pos = self:GetPlayerPartPosition(player, connection[1])
            bone2Pos = self:GetPlayerPartPosition(player, connection[2])
        end

        if bone1Pos and bone2Pos then

            local screen1X, screen1Y = utility.world_to_screen(bone1Pos.x, bone1Pos.y, bone1Pos.z)
            local screen2X, screen2Y = utility.world_to_screen(bone2Pos.x, bone2Pos.y, bone2Pos.z)
            
            if screen1X > 0 and screen1Y > 0 and screen2X > 0 and screen2Y > 0 then
                self:DrawLine(screen1X, screen1Y, screen2X, screen2Y, color, 1)
                validConnections = validConnections + 1
            end
        end
    end
    
    return validConnections > 0
end

-- Cache players for ESP
function Library.ESP:CachePlayers()
    local newCache = {}
    local players = entity.get_players(false)
    
    if players and #players > 0 then
        local localPlayer = entity.get_local_player()
        if not localPlayer then return end
        
        local cameraPosition = vector(game.get_camera_pos())
        local currentTime = utility.get_tickcount()
        
        for _, player in pairs(players) do
            if player:is_alive() then
                local position = vector(player:get_position())
                local distance = cameraPosition:dist_to(position) / 3

                if distance <= self.MaxDistance then
                    local name = player:get_name() or "Unknown"
                    
                    -- Skip non-enemies if only showing enemies
                    if not (self.OnlyEnemies and not player:is_enemy()) then
                        -- Calculate flags
                        local flags = {}
                        
                        for flagName, flag in pairs(self.DefaultFlags) do
                            if flag.condition(player) then
                                table.insert(flags, {
                                    name = flag.name,
                                    color = flag.color,
                                    priority = flag.priority
                                })
                            end
                        end
                        
                        -- Sort flags by priority
                        table.sort(flags, function(a, b)
                            return a.priority > b.priority
                        end)
                        
                        table.insert(newCache, {
                            player = player,
                            name = name,
                            position = position,
                            distance = distance,
                            health = player:get_health(),
                            maxHealth = player:get_max_health() or 100,
                            team = player:get_team(),
                            weapon = player:get_weapon(),
                            flags = flags,
                            is_enemy = player:is_enemy()
                        })
                    end
                end
            end
        end
    end
    
    self.CachedPlayers = newCache
end

-- FIXED: Render players with proper scaling for all elements
function Library.ESP:RenderPlayers()
    if not self.Enabled then return end
    
    for _, playerData in pairs(self.CachedPlayers) do
        local player = playerData.player
        
        if not player or not player:is_alive() then
            goto continue
        end
        
        -- Skip non-enemies if only showing enemies
        if self.OnlyEnemies and not playerData.is_enemy then
            goto continue
        end
        
        local color = self:GetEntityColor(player)
        local healthPercentage = (playerData.health / playerData.maxHealth) * 100
        
        local boxX, boxY, boxWidth, boxHeight, scale_factor = self:GetPlayerBounds(player)
        
        -- 2D Box - Now returns scale factor
        if self.Show2DBox then
            boxX, boxY, boxWidth, boxHeight, scale_factor = self:Draw2DBox(player, self.Colors.Box)
        else
            -- Get scale factor even if not drawing box
            local _, _, _, _, sf = self:GetPlayerBounds(player)
            scale_factor = sf
        end
        
        -- Name - positioned just above the box OR player center if no box, with scaling
        if self.ShowName then
            local nameY = boxY - math.floor(8 * scale_factor)
            if boxHeight <= 0 then
                -- Fallback to player position if no box
                local currentPosition = vector(player:get_position())
                local screenX, screenY = utility.world_to_screen(currentPosition.x, currentPosition.y + 2, currentPosition.z)
                if screenX > 0 and screenY > 0 then
                    boxX = screenX
                    nameY = screenY - math.floor(20 * scale_factor)
                end
            end
            
            local displayName = playerData.name
            
            -- FIXED: Only show tags if ShowTags is enabled
            if self.ShowTags then
                if self.ShowTeam and playerData.team then
                    displayName = displayName .. " [" .. playerData.team .. "]"
                end
                
                -- Add enemy/friend tags
                if playerData.is_enemy then
                    displayName = displayName .. " [Enemy]"
                else
                    displayName = displayName .. " [Friend]"
                end
            end
            
            if boxX > 0 then
                self:DrawText(boxX + boxWidth/2, nameY, displayName, self.Font, self.Colors.Name, true, scale_factor)
            end
        end
        
        -- Health Bar - positioned relative to box OR player center, with scaling
        if self.ShowHealth then
            if boxHeight > 0 then
                -- Use box coordinates
                self:DrawHealthBar(boxX, boxY, boxWidth, boxHeight, healthPercentage, boxX, scale_factor)
            else
                -- Fallback to player position
                local currentPosition = vector(player:get_position())
                local screenX, screenY = utility.world_to_screen(currentPosition.x, currentPosition.y, currentPosition.z)
                if screenX > 0 and screenY > 0 then
                    -- Draw health bar to the left of player center, scaled
                    local barWidth = math.max(2, math.floor(self.HealthBarWidth * scale_factor))
                    local barOffset = math.floor(self.HealthBarOffset * scale_factor)
                    local barX = screenX - barWidth - barOffset
                    local barY = screenY - math.floor(30 * scale_factor)
                    local barHeight = math.floor(60 * scale_factor)
                    
                    self:DrawRect(barX, barY, barWidth, barHeight, {0, 0, 0, 200}, true, 0)
                    self:DrawRect(barX, barY, barWidth, barHeight, {255, 255, 255, 255}, false, 0)
                    
                    local r, g, b
                    if healthPercentage > 75 then
                        r, g, b = self.Colors.HealthHigh[1], self.Colors.HealthHigh[2], self.Colors.HealthHigh[3]
                    elseif healthPercentage > 30 then
                        r, g, b = self.Colors.HealthMed[1], self.Colors.HealthMed[2], self.Colors.HealthMed[3]
                    else
                        r, g, b = self.Colors.HealthLow[1], self.Colors.HealthLow[2], self.Colors.HealthLow[3]
                    end
                    
                    local fillHeight = math.floor(barHeight * (healthPercentage / 100))
                    if fillHeight > 0 then
                        self:DrawRect(barX + 1, barY + (barHeight - fillHeight) - 1, barWidth - 2, fillHeight, {r, g, b, 200}, true, 0)
                    end
                    
                    local healthText = tostring(math.floor(healthPercentage))
                    local textOffset = math.floor(25 * scale_factor)
                    self:DrawText(barX - textOffset, barY + barHeight/2, healthText, 1, {255, 255, 255, 255}, true, scale_factor)
                end
            end
        end
        
        -- Distance - below the box OR player center, with scaling
        if self.ShowDistance then
            local distanceY = boxY + boxHeight + math.floor(5 * scale_factor)
            local distanceX = boxX + boxWidth/2
            
            if boxHeight <= 0 then
                -- Fallback to player position
                local currentPosition = vector(player:get_position())
                local screenX, screenY = utility.world_to_screen(currentPosition.x, currentPosition.y, currentPosition.z)
                if screenX > 0 and screenY > 0 then
                    distanceX = screenX
                    distanceY = screenY + math.floor(25 * scale_factor)
                end
            end
            
            if distanceX > 0 then
                local distanceText = string.format("%.0fm", playerData.distance)
                self:DrawText(distanceX, distanceY, distanceText, self.Font, self.Colors.Distance, true, scale_factor)
            end
        end
        
        -- Weapon - below distance, with scaling
        if self.ShowWeapon and playerData.weapon then
            local weaponY = boxY + boxHeight + math.floor(20 * scale_factor)
            local weaponX = boxX + boxWidth/2
            
            if boxHeight <= 0 then
                -- Fallback to player position
                local currentPosition = vector(player:get_position())
                local screenX, screenY = utility.world_to_screen(currentPosition.x, currentPosition.y, currentPosition.z)
                if screenX > 0 and screenY > 0 then
                    weaponX = screenX
                    weaponY = screenY + math.floor(40 * scale_factor)
                end
            end
            
            if weaponX > 0 then
                self:DrawText(weaponX, weaponY, playerData.weapon, self.Font, self.Colors.Weapon, true, scale_factor)
            end
        end
        
        -- Skeleton - independent of box, with scaling and optimization
        if self.ShowSkeleton then

            pcall(function() self:DrawSkeleton(player, self.Colors.Skeleton, scale_factor) end)
        end
        
        -- Flags - positioned to the right of the box OR player center, with scaling
        if self.ShowFlags and #playerData.flags > 0 then
            local flagOffset = math.floor(self.FlagOffset * scale_factor)
            local flagX = boxX + boxWidth + math.floor(5 * scale_factor)
            local flagY = boxY
            
            if boxHeight <= 0 then
                -- Fallback to player position
                local currentPosition = vector(player:get_position())
                local screenX, screenY = utility.world_to_screen(currentPosition.x, currentPosition.y, currentPosition.z)
                if screenX > 0 and screenY > 0 then
                    flagX = screenX + flagOffset
                    flagY = screenY - math.floor(30 * scale_factor)
                end
            end
            
            if flagX > 0 then
                local flagSpacing = math.floor(12 * scale_factor)
                for i, flag in ipairs(playerData.flags) do
                    if i <= 5 then -- Limit flags
                        self:DrawText(flagX, flagY, flag.name, 1, flag.color, false, scale_factor)
                        flagY = flagY + flagSpacing
                    end
                end
            end
        end
        
        ::continue::
    end
end

-- Update ESP system
function Library.ESP:Update()
    local currentTime = utility.get_tickcount()
    if currentTime - self.LastUpdateTime >= self.CacheCooldown then
        self:CachePlayers()
        self.LastUpdateTime = currentTime
    end
end

local function fileExists(path)
    local success, _ = pcall(file.read, path)
    return success
end

local function BringToFront(element)
    ZIndexCounter = ZIndexCounter + 1
    element.zIndex = ZIndexCounter
    ActiveElements[element] = true
end

local function RegisterPopup(element)
    Library.ActivePopups[element] = true
    Library.PopupBlocking = true
    BringToFront(element)
end

local function UnregisterPopup(element)
    Library.ActivePopups[element] = nil
    Library.PopupBlocking = false
    for popup, _ in pairs(Library.ActivePopups) do
        Library.PopupBlocking = true
        break
    end
end

local function IsPopupActive()
    return Library.PopupBlocking
end

local function IsElementBehindPopup(element)
    if not IsPopupActive() then return false end
    if Library.ActivePopups[element] then return false end
    return true
end

local function ColorUnpack(color)
    return color[1], color[2], color[3], color[4]
end

local function IsMouseInBounds(x, y, width, height)
    local mouseX, mouseY = input.cursor_position()
    return mouseX >= x and mouseX <= x + width and mouseY >= y and mouseY <= y + height
end

local KeyCodeNames = {
    [0x01] = "LMB", [0x02] = "RMB", [0x04] = "MMB",
    [0x08] = "BACKSPACE", [0x09] = "TAB", [0x0D] = "ENTER",
    [0x10] = "SHIFT", [0x11] = "CTRL", [0x12] = "ALT",
    [0x20] = "SPACE", [0x25] = "LEFT", [0x26] = "UP",
    [0x27] = "RIGHT", [0x28] = "DOWN", [0x2E] = "DELETE",
    [0x30] = "0", [0x31] = "1", [0x32] = "2", [0x33] = "3",
    [0x34] = "4", [0x35] = "5", [0x36] = "6", [0x37] = "7",
    [0x38] = "8", [0x39] = "9", [0x41] = "A", [0x42] = "B",
    [0x43] = "C", [0x44] = "D", [0x45] = "E", [0x46] = "F",
    [0x47] = "G", [0x48] = "H", [0x49] = "I", [0x4A] = "J",
    [0x4B] = "K", [0x4C] = "L", [0x4D] = "M", [0x4E] = "N",
    [0x4F] = "O", [0x50] = "P", [0x51] = "Q", [0x52] = "R",
    [0x53] = "S", [0x54] = "T", [0x55] = "U", [0x56] = "V",
    [0x57] = "W", [0x58] = "X", [0x59] = "Y", [0x5A] = "Z",
    [0x70] = "F1", [0x71] = "F2", [0x72] = "F3", [0x73] = "F4",
    [0x74] = "F5", [0x75] = "F6", [0x76] = "F7", [0x77] = "F8",
    [0x78] = "F9", [0x79] = "F10", [0x7A] = "F11", [0x7B] = "F12"
}

local function GetKeyName(keyCode)
    return KeyCodeNames[keyCode] or "KEY" .. keyCode
end

local Tween = {}
local AnimatedValues = {}

function Tween.lerp(start, goal, alpha)
    return start + (goal - start) * alpha
end

function Tween.easeOut(t)
    return 1 - math.pow(1 - t, 3)
end

function Tween.animateValue(id, currentValue, targetValue, speed)
    speed = speed or Library.Settings.Animation.Speed
    
    if not AnimatedValues[id] then
        AnimatedValues[id] = {
            current = currentValue,
            target = targetValue
        }
    end
    
    local anim = AnimatedValues[id]
    anim.target = targetValue
    
    if math.abs(anim.current - anim.target) < 0.5 then
        anim.current = anim.target
        return anim.current
    end
    
    local deltaTime = utility.get_delta_time()
    local alpha = math.min(speed * deltaTime * 60, 1)

    if math.abs(anim.current - anim.target) < 0.01 then
        anim.current = anim.target
        -- Remove completed animation after delay
        if not anim.cleanupTime then
            anim.cleanupTime = utility.get_tickcount() + 5000 -- 5 second delay
        elseif utility.get_tickcount() > anim.cleanupTime then
            AnimatedValues[id] = nil
        end
    end
    
    anim.current = Tween.lerp(anim.current, anim.target, Tween.easeOut(alpha))
    return anim.current
end

local InputState = {
    mousePressed = false,
    lastMousePressed = false,
    mouseClicked = false,
    rightMousePressed = false,
    lastRightMousePressed = false,
    rightMouseClicked = false
}

local function UpdateInputState()
    InputState.lastMousePressed = InputState.mousePressed
    InputState.mousePressed = utility.key_state(1)
    InputState.mouseClicked = InputState.mousePressed and not InputState.lastMousePressed
    
    InputState.lastRightMousePressed = InputState.rightMousePressed
    InputState.rightMousePressed = utility.key_state(2)
    InputState.rightMouseClicked = InputState.rightMousePressed and not InputState.lastRightMousePressed
    
    for keyCode, _ in pairs(Library.KeyStates) do
        Library.KeyStates[keyCode] = utility.key_state(keyCode)
    end
    
    local elements = {}
    for element in pairs(ActiveElements) do
        table.insert(elements, element)
    end
    
    table.sort(elements, function(a, b)
        return (a.zIndex or 0) < (b.zIndex or 0)
    end)
    
    Library.SortedElements = elements
end

function Label:new(text, fontSize, color, centered)
    local label = Element.new(self, 0, 0, 100, 20)
    label.text = text or "Label"
    label.fontSize = fontSize or 2
    label.color = color or nil -- nil means use theme color
    label.centered = centered or false
    label.enabled = false -- Labels don't need interaction
    return label
end

function Label:GetTheme()
    local current = self
    while current and current.parent do
        current = current.parent
        if current and current.theme then
            return current.theme
        end
    end
    return Library.Theme.List[Library.Theme.Selected]
end

function Label:Set(text)
    self.text = tostring(text)
end

function Label:SetColor(color)
    self.color = color
end

function Label:SetFontSize(fontSize)
    self.fontSize = fontSize
end

function Label:SetCentered(centered)
    self.centered = centered
end

function Label:Render()
    if not self.visible then return end
    
    local x, y = self:GetAbsolutePos()
    local theme = self:GetTheme()
    
    -- Use custom color or default the fucking theme text color
    local textColor = self.color or theme.Text
    
    local textX = x
    if self.centered then
        local textWidth, textHeight = render.measure_text(self.fontSize, true, self.text)
        textX = x + (self.width - textWidth) / 2
        -- Fix 2: Claude is retarded
        self.height = math.max(self.height, textHeight + 4)
    end
    
    Drawing:Text(textX, y, self.text, self.fontSize, true, textColor)
end

function Label:HandleInput()
    -- we need the method for consistency
end

local Drawing = {}

function Drawing:Rect(x, y, width, height, color, filled, rounding)
    local r, g, b, a = ColorUnpack(color)
    if filled then
        render.rect(x, y, width, height, r, g, b, a, rounding or 0)
    else
        render.rect_outline(x, y, width, height, r, g, b, a, rounding or 0)
    end
end

function Drawing:Text(x, y, text, font, scale, color)
    local r, g, b, a = ColorUnpack(color)
    render.text(x, y, r, g, b, a, font or 2, scale or true, text)
end

function Drawing:Line(x1, y1, x2, y2, color, thickness)
    local r, g, b, a = ColorUnpack(color)
    render.line(x1, y1, x2, y2, r, g, b, a, thickness or 1)
end

function Drawing:Gradient(x, y, width, height, color1, color2, vertical)
    local r1, g1, b1, a1 = ColorUnpack(color2) 
    local r2, g2, b2, a2 = ColorUnpack(color1)

    if vertical then
        for i = 0, height do
            local ratio = i / height
            local r = r1 + (r2 - r1) * ratio
            local g = g1 + (g2 - g1) * ratio
            local b = b1 + (b2 - b1) * ratio
            render.rect(x, y + i, width, 1, r, g, b, a1)
        end
    else
        render.gradient(x, y, width, height, r1, g1, b1, a1, r2, g2, b2, a2, false)
    end
end

function Library.ConfigSystem:Initialize()
    local success, fileData = pcall(file.read, self.ConfigIndex)
    if success and fileData then
        local success, configList = pcall(json.parse, fileData)
        if success and type(configList) == "table" then
            self.Configs = configList
        else
            self.Configs = {}
        end
    else
        self.Configs = {}
    end
end
Library.ConfigSystem:Initialize()

function Library.ConfigSystem:SaveConfigIndex()
    local success, jsonData = pcall(json.stringify, self.Configs)
    if success then
        file.write(self.ConfigIndex, jsonData)
    end
end

function Library.ConfigSystem:AddConfigToIndex(name)
    for _, configName in ipairs(self.Configs) do
        if configName == name then
            return
        end
    end
    table.insert(self.Configs, name)
    self:SaveConfigIndex()
end

function Library.ConfigSystem:RemoveConfigFromIndex(name)
    for i, configName in ipairs(self.Configs) do
        if configName == name then
            table.remove(self.Configs, i)
            self:SaveConfigIndex()
            return
        end
    end
end

function Library.ConfigSystem:SaveConfig(name)
    if not name or name == "" then
        return false
    end
    
    self:AddConfigToIndex(name)
    
    local configData = {
        flags = {},
        keybinds = {}, 
        theme = Library.Theme.Selected,
        settings = Library.Settings,
        timestamp = utility.get_tickcount()
    }
    
    for flag, element in pairs(Library.Flags) do
        if element then
            if element.value ~= nil then
                configData.flags[flag] = element.value
            elseif element.color then
                configData.flags[flag] = element.color
            elseif element.selectedOptions then
                configData.flags[flag] = element.selectedOptions
            end
            
            if element.keybind then
                configData.keybinds[flag] = {
                    key = element.keybind.keyCode,
                    mode = element.keybind.mode
                }
            end
        end
    end
    
    local fileName = name .. ".json"
    local success, jsonData = pcall(json.stringify, configData)
    
    if not success then
        return false
    end
    
    local success = pcall(file.write, fileName, jsonData)
    if success then
        return true
    else
        return false
    end
end

function Library.ConfigSystem:LoadConfig(name)
    if not name or name == "" then
        return false
    end
    
    local fileName = name .. ".json"
    tostring(fileName)
    local success, fileData = pcall(file.read, fileName)
    
    if not success or not fileData then
        return false
    end
    
    local success, configData = pcall(json.parse, fileData)
    if not success or not configData then
        return false
    end
    
    if configData.theme and Library.Theme.List[configData.theme] then
        Library.Theme.Selected = configData.theme
        for _, window in ipairs(Library.Windows) do
            window.theme = Library.Theme.List[Library.Theme.Selected]
        end
    end
    
    if configData.settings then
        for key, value in pairs(configData.settings) do
            if Library.Settings[key] ~= nil then
                Library.Settings[key] = value
            end
        end
    end
    
    if configData.flags then
        for flag, value in pairs(configData.flags) do
            local element = Library.Flags[flag]
            if element then
                if element.selectedOptions then
                    element.selectedOptions = value
                elseif element.Set then
                    element:Set(value)
                elseif element.value ~= nil then
                    element.value = value
                    if element.callback then
                        element.callback(value)
                    end
                elseif element.color then
                    element.color = value
                    if element.callback then
                        element.callback(value)
                    end
                end
            end
        end
    end
    
    if configData.keybinds then
        for flag, keybindData in pairs(configData.keybinds) do
            local element = Library.Flags[flag]
            if element and element.keybind then
                element.keybind.keyCode = keybindData.key
                element.keybind.mode = keybindData.mode
                Library.KeyStates[keybindData.key] = false
            end
        end
    end
    
    Library.ConfigSystem.CurrentConfig = name
    return true
end

function Library.ConfigSystem:DeleteConfig(name)
    if not name or name == "" then
        return false
    end
    
    self:RemoveConfigFromIndex(name)
    
    local fileName = name .. ".json"
    local success = pcall(file.write, fileName, "")
    
    if success then
        return true
    else
        return false
    end
end

function Library.ConfigSystem:GetConfigs()
    local success, fileData = pcall(file.read, self.ConfigIndex)
    if success and fileData then
        local success, configList = pcall(json.parse, fileData)
        if success and type(configList) == "table" then
            self.Configs = configList
        else
            self.Configs = {}
        end
    else
        self.Configs = {}
    end
    return self.Configs
end

Library.ConfigSystem.Configs = {}
Library.ConfigSystem:Initialize()  

function TargetHUD:new()
    local hud = Element.new(self, 200, 300, 340, 120)
    hud.visible = true
    hud.currentTarget = nil
    hud.title = "[ Target ]"
    hud.dragging = false
    hud.dragOffset = {0, 0}
    hud.avatarCache = {}
    hud.lastTargetUpdate = 0
    hud.targetUpdateInterval = 100 -- ms
    return hud
end

function TargetHUD:GetTheme()
    return Library.Theme.List[Library.Theme.Selected]
end

function TargetHUD:SetTarget(target)
    if target and target.entity then
        self.currentTarget = {
            name = target.entity:get_name() or "Unknown",
            health = target.entity:get_health() or 100,
            maxHealth = target.entity:get_max_health() or 100,
            userId = target.entity:get_user_id() or nil,
            entity = target.entity
        }
        
        -- Load avatar if not cached
        if self.currentTarget.userId and not self.avatarCache[self.currentTarget.userId] then
            self:LoadAvatar(self.currentTarget.userId)
        end
    else
        self.currentTarget = nil
    end
end

function TargetHUD:LoadAvatar(userId)
    if not userId then return end
    
    local thumbnailUrl = string.format(
        "https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds=%s&size=352x352&format=Png&isCircular=false",
        tostring(userId)
    )
    pcall(function()
        http.get(thumbnailUrl, {}, function(body)
            if body and #body > 0 then
                local success, thumbnailData = pcall(function()
                    return json.parse(body)
                end)
                
                if success and thumbnailData and thumbnailData.data and thumbnailData.data[1] then
                    local userData = thumbnailData.data[1]
                    if userData.imageUrl and userData.state == "Completed" then
                        pcall(function()
                            http.get(userData.imageUrl, {}, function(imageData)
                                if imageData and #imageData > 0 then
                                    local textureId = utility.load_image(imageData)
                                    if textureId then
                                        self.avatarCache[userId] = textureId
                                    end
                                end
                            end)
                        end)
                    end
                end
            end
        end)
    end)
end

function TargetHUD:Update()
    local currentTime = utility.get_tickcount()
    
    -- Update target health if we have a current target
    if self.currentTarget and self.currentTarget.entity and 
       currentTime - self.lastTargetUpdate >= self.targetUpdateInterval then
        
        if self.currentTarget.entity:is_alive() then
            self.currentTarget.health = self.currentTarget.entity:get_health() or 0
        else
            self.currentTarget = nil
        end
        
        self.lastTargetUpdate = currentTime
    end
end

function TargetHUD:Render()
    if not self.visible then return end
    
    local x, y = self:GetAbsolutePos()
    local theme = self:GetTheme()
    
    -- Main background
    Drawing:Rect(x, y, self.width, self.height, theme.Dark, true, 4)
    Drawing:Rect(x, y, self.width, self.height, theme.Accent, false, 4)
    
    -- Header bar
    Drawing:Rect(x + 1, y + 1, self.width - 2, 20, theme.Light, true, 0)
    Drawing:Gradient(x + 1, y + 1, self.width - 2, 20, theme.Light, theme.Mid, true)
    
    -- Title
    local titleWidth, titleHeight = render.measure_text(2, true, self.title)
    local titleX = x + (self.width - titleWidth) / 2
    Drawing:Text(titleX, y + 3, self.title, 2, true, theme.Header)
    
    -- Content area
    local contentY = y + 22
    local contentHeight = self.height - 22
    
    if self.currentTarget then
        -- Avatar area (left side)
        local avatarSize = contentHeight - 4
        local avatarX = x + 2
        local avatarY = contentY + 2
        
        Drawing:Rect(avatarX, avatarY, avatarSize, avatarSize, theme.High, true, 2)
        Drawing:Rect(avatarX, avatarY, avatarSize, avatarSize, theme.Outer, false, 2)
        
        -- Draw avatar if available
        if self.currentTarget.userId and self.avatarCache[self.currentTarget.userId] then
            render.image(self.avatarCache[self.currentTarget.userId], 
                        avatarX + 2, avatarY + 2, avatarSize - 4, avatarSize - 4, 
                        255, 255, 255, 255)
        else
            -- Placeholder
            Drawing:Text(avatarX + avatarSize/2, avatarY + avatarSize/2, "?", 2, true, theme.Text)
        end
        
        -- Info area (right side)
        local infoX = avatarX + avatarSize + 5
        local infoWidth = self.width - avatarSize - 10
        
        -- Player name
        local nameY = contentY + 5
        Drawing:Text(infoX, nameY, self.currentTarget.name, 2, true, theme.Text)
        
        -- Health bar
        local healthBarY = nameY + 20
        local healthBarWidth = infoWidth - 5
        local healthBarHeight = 8
        
        -- Health bar background
        Drawing:Rect(infoX, healthBarY, healthBarWidth, healthBarHeight, {0, 0, 0, 200}, true, 2)
        Drawing:Rect(infoX, healthBarY, healthBarWidth, healthBarHeight, theme.Outer, false, 2)
        
        -- Health percentage
        local healthPercentage = (self.currentTarget.health / self.currentTarget.maxHealth) * 100
        local healthFillWidth = (healthBarWidth - 2) * (healthPercentage / 100)
        
        -- Health color
        local healthColor = theme.Accent
        if healthPercentage > 75 then
            healthColor = {0, 255, 0, 255}
        elseif healthPercentage > 30 then
            healthColor = {255, 255, 0, 255}
        else
            healthColor = {255, 0, 0, 255}
        end
        
        if healthFillWidth > 0 then
            Drawing:Rect(infoX + 1, healthBarY + 1, healthFillWidth, healthBarHeight - 2, healthColor, true, 1)
        end
        
        -- Health text
        local healthText = string.format("%d / %d", math.floor(self.currentTarget.health), self.currentTarget.maxHealth)
        local healthTextWidth, healthTextHeight = render.measure_text(1, true, healthText)
        local healthTextX = infoX + (healthBarWidth - healthTextWidth) / 2
        local healthTextY = healthBarY + healthBarHeight + 2
        Drawing:Text(healthTextX, healthTextY, healthText, 1, true, theme.Text)
        
    else
        -- No target message
        local noTargetText = "No Target"
        local textWidth, textHeight = render.measure_text(2, true, noTargetText)
        local textX = x + (self.width - textWidth) / 2
        local textY = contentY + (contentHeight - textHeight) / 2
        Drawing:Text(textX, textY, noTargetText, 2, true, theme.Secondary)
    end
end

function TargetHUD:HandleInput()
    if not self.visible or not self.enabled then return end
    
    Element.HandleInput(self)
    
    local mouseX, mouseY = input.cursor_position()
    local headerArea = IsMouseInBounds(self.x, self.y, self.width, 22)
    
    if headerArea and InputState.mousePressed and not self.dragging and not IsPopupActive() then
        self.dragging = true
        self.dragOffset[1] = mouseX - self.x
        self.dragOffset[2] = mouseY - self.y
        BringToFront(self)
    elseif not InputState.mousePressed then
        self.dragging = false
    end
    
    if self.dragging then
        self.x = mouseX - self.dragOffset[1]
        self.y = mouseY - self.dragOffset[2]
        
        -- Keep on screen
        local screenWidth, screenHeight = cheat.get_window_size()
        self.x = math.max(0, math.min(screenWidth - self.width, self.x))
        self.y = math.max(0, math.min(screenHeight - self.height, self.y))
    end
end

function TargetHUD:UpdatePosition()
    local screenX, screenY = cheat.get_window_size()
    -- Default position if not set
    if self.x == 0 and self.y == 0 then
        self.x = screenX - self.width - 20
        self.y = (screenY * 0.3) - (self.height / 2)
    end
end

function Input:new(text, callback, defaultValue, flag)
    local input = Element.new(self, 0, 0, 100, 25)
    input.text = text or "Input"
    input.callback = callback or function() end
    input.value = defaultValue or ""
    input.placeholder = defaultValue or ""
    input.focused = false
    input.cursorPos = #input.value
    input.lastKeyStates = {}
    input.flag = flag
    
    if flag and not Library.Flags[flag] then
        Library.Flags[flag] = input
    end
    
    return input
end

function Input:GetTheme()
    local current = self
    while current and current.parent do
        current = current.parent
        if current and current.theme then
            return current.theme
        end
    end
    return Library.Theme.List[Library.Theme.Selected]
end

function Input:Set(value)
    self.value = tostring(value)
    self.cursorPos = #self.value
    if self.callback then
        self.callback(self.value)
    end
end

function Input:Render()
    if not self.visible then return end
    
    local x, y = self:GetAbsolutePos()
    local theme = self:GetTheme()
    
    local bgColor = self.focused and theme.Light or theme.Mid
    Drawing:Rect(x, y, self.width, self.height, bgColor, true, 2)
    Drawing:Rect(x, y, self.width, self.height, self.focused and theme.Accent or theme.Outer, false, 2)
    
    local displayText = self.value
    if displayText == "" and not self.focused then
        displayText = self.placeholder
    end
    
    if self.focused then
        local textBeforeCursor = string.sub(self.value, 1, self.cursorPos)
        local textWidth = render.measure_text(2, true, textBeforeCursor)
        local cursorX = x + 5 + textWidth
        
        if math.floor(utility.get_tickcount() / 500) % 2 == 0 then
            Drawing:Line(cursorX, y + 3, cursorX, y + self.height - 3, theme.Text, 1)
        end
    end
    
    Drawing:Text(x + 5, y + 5, displayText, 2, true, 
                 (displayText == self.placeholder and not self.focused) and theme.Secondary or theme.Text)
end

function Input:HandleInput()
    if not self.visible or not self.enabled then return end
    if IsElementBehindPopup(self) then return end
    if not self:IsInActiveTab() then return end
    if not self:CanInteract() then return end  -- Cooldown check
    
    Element.HandleInput(self)
    
    if self.clicked then
        self.focused = true
        BringToFront(self)
        self:RegisterInteraction()  -- Register interaction
    end
    
    if self.focused then
        for keyCode = 8, 255 do
            local currentState = utility.key_state(keyCode)
            local lastState = self.lastKeyStates[keyCode] or false
            
            if currentState and not lastState then 
                if keyCode == 0x08 then 
                    if self.cursorPos > 0 then
                        self.value = string.sub(self.value, 1, self.cursorPos - 1) .. string.sub(self.value, self.cursorPos + 1)
                        self.cursorPos = self.cursorPos - 1
                        if self.callback then
                            self.callback(self.value)
                        end
                    end
                elseif keyCode == 0x2E then 
                    if self.cursorPos < #self.value then
                        self.value = string.sub(self.value, 1, self.cursorPos) .. string.sub(self.value, self.cursorPos + 2)
                        if self.callback then
                            self.callback(self.value)
                        end
                    end
                elseif keyCode == 0x25 then 
                    self.cursorPos = math.max(0, self.cursorPos - 1)
                elseif keyCode == 0x27 then 
                    self.cursorPos = math.min(#self.value, self.cursorPos + 1)
                elseif keyCode == 0x24 then 
                    self.cursorPos = 0
                elseif keyCode == 0x23 then 
                    self.cursorPos = #self.value
                elseif keyCode == 0x0D then 
                    self.focused = false
                elseif keyCode == 0x1B then 
                    self.focused = false
                else
                    local char = self:KeyCodeToChar(keyCode)
                    if char then
                        self.value = string.sub(self.value, 1, self.cursorPos) .. char .. string.sub(self.value, self.cursorPos + 1)
                        self.cursorPos = self.cursorPos + 1
                        if self.callback then
                            self.callback(self.value)
                        end
                    end
                end
            end
            
            self.lastKeyStates[keyCode] = currentState
        end
    end
    
    if InputState.mouseClicked and not self:IsMouseOver() then
        self.focused = false
    end
end

function Input:KeyCodeToChar(keyCode)
    local shift = utility.key_state(0x10)
    
    if keyCode >= 0x30 and keyCode <= 0x39 then
        if shift then
            local shiftNumbers = ")!@#$%^&*("
            return string.sub(shiftNumbers, keyCode - 0x2F, keyCode - 0x2F)
        else
            return string.char(keyCode)
        end
    end
    
    if keyCode >= 0x41 and keyCode <= 0x5A then
        local char = string.char(keyCode)
        return shift and char or string.lower(char)
    end
    
    local specialKeys = {
        [0x20] = " ", 
        [0xBA] = shift and ":" or ";",
        [0xBB] = shift and "+" or "=",
        [0xBC] = shift and "<" or ",",
        [0xBD] = shift and "_" or "-",
        [0xBE] = shift and ">" or ".",
        [0xBF] = shift and "?" or "/",
        [0xC0] = shift and "~" or "`",
        [0xDB] = shift and "{" or "[",
        [0xDC] = shift and "|" or "\\",
        [0xDD] = shift and "}" or "]",
        [0xDE] = shift and "\"" or "'",
    }
    
    return specialKeys[keyCode]
end

function List:new(text, options, callback, defaultSelected, max, flag)
    local rowHeight = 20
    local headerHeight = 25
    local maxVisible = max or 8
    local totalHeight = headerHeight + (maxVisible * rowHeight)  
    
    local list = Element.new(self, 0, 0, 100, totalHeight)  
    list.text = text or "List"
    list.options = options or {}
    list.callback = callback or function() end
    list.selected = defaultSelected or (options and options[1]) or nil
    list.maxVisible = maxVisible
    list.scrollOffset = 0
    list.hoveredIndex = nil
    list.rowHeight = rowHeight
    list.headerHeight = headerHeight
    list.flag = flag
    
    if flag and not Library.Flags[flag] then
        Library.Flags[flag] = list
    end
    
    return list
end

function List:GetTheme()
    local current = self
    while current and current.parent do
        current = current.parent
        if current and current.theme then
            return current.theme
        end
    end
    return Library.Theme.List[Library.Theme.Selected]
end

function List:Set(value)
    if type(value) == "string" then
        for i, option in ipairs(self.options) do
            if option == value then
                self.selected = value
                if self.callback then
                    self.callback(value)
                end
                return
            end
        end
    elseif type(value) == "number" and self.options[value] then
        self.selected = self.options[value]
        if self.callback then
            self.callback(self.selected)
        end
    end
end

function List:Refresh()
    
end

function List:Render()
    if not self.visible then return end
    
    local x, y = self:GetAbsolutePos()
    local theme = self:GetTheme()
    
    Drawing:Text(x, y, self.text, 2, true, theme.Header)
    
    local listY = y + self.headerHeight
    local listHeight = self.maxVisible * self.rowHeight
    
    Drawing:Rect(x, listY, self.width, listHeight, theme.Dark, true, 2)
    Drawing:Rect(x, listY, self.width, listHeight, theme.Outer, false, 2)
    
    if #self.options == 0 then
        Drawing:Text(x + 5, listY + 10, "No items available", 2, true, theme.Secondary)
    else
        for i = 1, self.maxVisible do
            local optionIndex = i + self.scrollOffset
            local option = self.options[optionIndex]
            
            if option then
                local itemY = listY + (i - 1) * self.rowHeight
                local isSelected = option == self.selected
                local isHovered = optionIndex == self.hoveredIndex
                
                local bgColor = isSelected and theme.Accent or (isHovered and theme.Mid or theme.Dark)
                Drawing:Rect(x + 2, itemY, self.width - 4, self.rowHeight, bgColor, true, 0)
                
                local textColor = theme.Text
                if option == "No configs found" then
                    textColor = theme.Secondary
                end
                
                Drawing:Text(x + 5, itemY + 5, option, 2, true, textColor)
            end
        end
    end
    
    if #self.options > self.maxVisible then
        local scrollbarX = x + self.width - 8
        local scrollbarHeight = listHeight
        
        Drawing:Rect(scrollbarX, listY, 6, scrollbarHeight, theme.Mid, true, 0)
        
        local thumbHeight = math.max(20, scrollbarHeight * (self.maxVisible / #self.options))
        local thumbY = listY + (scrollbarHeight - thumbHeight) * (self.scrollOffset / (#self.options - self.maxVisible))
        
        Drawing:Rect(scrollbarX, thumbY, 6, thumbHeight, theme.Accent, true, 0)
    end
end

function List:NeedsScrollbar()
    return #self.options > self.maxVisible
end

function List:HandleInput()
    if not self.visible or not self.enabled then return end
    if IsElementBehindPopup(self) then return end
    if not self:IsInActiveTab() then return end
    if not self:CanInteract() then return end  -- Cooldown check
    
    Element.HandleInput(self)
    
    local x, y = self:GetAbsolutePos()
    local listY = y + self.headerHeight
    local listHeight = self.maxVisible * self.rowHeight
    
    self.hoveredIndex = nil
    
    if IsMouseInBounds(x, listY, self.width, listHeight) then
        if utility.key_state(0x26) then 
            self.scrollOffset = math.max(0, self.scrollOffset - 1)
        elseif utility.key_state(0x28) then 
            self.scrollOffset = math.min(math.max(0, #self.options - self.maxVisible), self.scrollOffset + 1)
        end
        
        if InputState.mouseClicked then
            local mouseX, mouseY = input.cursor_position()
            local relativeY = mouseY - listY
            local itemIndex = math.floor(relativeY / self.rowHeight) + 1 + self.scrollOffset
            
            if itemIndex <= #self.options then
                local option = self.options[itemIndex]
                
                if option ~= "No configs found" then
                    self.selected = option
                    if self.callback then
                        self.callback(option)
                    end
                    self:RegisterInteraction()  -- Register interaction
                end
            end
        end
    end
    
    if IsMouseInBounds(x, listY, self.width, listHeight) then
        local mouseX, mouseY = input.cursor_position()
        local relativeY = mouseY - listY
        self.hoveredIndex = math.floor(relativeY / self.rowHeight) + 1 + self.scrollOffset
    end
end

function Element:new(x, y, width, height)
    local element = {
        x = x or 0,
        y = y or 0,
        width = width or 100,
        height = height or 20,
        visible = true,
        enabled = true,
        hovered = false,
        pressed = false,
        clicked = false,
        rightClicked = false,
        parent = nil,
        children = {},
        callbacks = {},
        zIndex = 0,
        lastInteractionTime = 0,  -- Add cooldown tracking
        interactionCooldown = 100  -- 100ms cooldown
    }
    setmetatable(element, self)
    return element
end

-- Add cooldown methods to Element base class
function Element:CanInteract()
    local currentTime = utility.get_tickcount()
    return (currentTime - self.lastInteractionTime) >= self.interactionCooldown
end

function Element:RegisterInteraction()
    self.lastInteractionTime = utility.get_tickcount()
end

function Element:GetAbsolutePos()
    local visitedElements = {}
    local current = self
    local totalX, totalY = 0, 0
    
    while current do
        if visitedElements[current] then
            break -- Break out of circular reference
        end
        visitedElements[current] = true
        
        totalX = totalX + current.x
        totalY = totalY + current.y
        current = current.parent
    end
    
    return totalX, totalY
end

function Element:IsMouseOver()
    local ax, ay = self:GetAbsolutePos()
    return IsMouseInBounds(ax, ay, self.width, self.height)
end

function Element:IsInActiveTab()
    local current = self
    while current and current.parent do
        current = current.parent
        
        -- Check for window tabs
        if current and current.currentTab then
            local elementTab = self
            while elementTab and elementTab.parent do
                elementTab = elementTab.parent
                if elementTab == current.currentTab then
                    break
                end
                if elementTab == current then
                    return false
                end
            end
        end
        
        -- Check for MultiSection pages
        if current and current.pages and current.currentPage and self.pageIndex then
            return self.pageIndex == current.currentPage
        end
    end
    return true 
end

function Element:HandleInput()
    if not self:IsEffectivelyVisible() or not self.enabled then return end
    if IsElementBehindPopup(self) then return end
    if not self:IsInActiveTab() then return end 
    
    if self:IsMouseOver() and (InputState.mouseClicked or InputState.rightMouseClicked) then
        BringToFront(self)
    end
    
    local wasHovered = self.hovered
    self.hovered = self:IsMouseOver()
    
    if self.hovered and not wasHovered then
        self:OnMouseEnter()
    elseif not self.hovered and wasHovered then
        self:OnMouseLeave()
    end
    
    self.clicked = false
    self.rightClicked = false
    
    if self.hovered then
        if InputState.mouseClicked then
            self.clicked = true
            self:OnClick()
        end
        if InputState.rightMouseClicked then
            self.rightClicked = true
            self:OnRightClick()
        end
        if InputState.mousePressed then
            if not self.pressed then
                self.pressed = true
                self:OnMouseDown()
            end
        else
            if self.pressed then
                self.pressed = false
                self:OnMouseUp()
            end
        end
    else
        self.pressed = false
    end
end

function Element:OnMouseEnter() end
function Element:OnMouseLeave() end
function Element:OnMouseDown() end
function Element:OnMouseUp() end
function Element:OnClick() end
function Element:OnRightClick() end
function Element:Render() end

function Element:IsEffectivelyVisible()
    if not self.visible then return false end
    
    local current = self.parent
    while current do
        if not current.visible then
            return false
        end
        current = current.parent
    end
    return true
end

function Element:AddChild(child)
    child.parent = self
    table.insert(self.children, child)
end

function Keybind:new(text, keyCode, mode, callback)
    local keybind = Element.new(self, 0, 0, 60, 20)
    keybind.text = text or "Keybind"
    keybind.keyCode = keyCode or 0x4B
    keybind.mode = mode or "Toggle"
    keybind.callback = callback or function() end
    keybind.binding = false
    keybind.clickdebounce = 0
    keybind.lastState = false
    keybind.currentState = false
    keybind.menuOpen = false
    keybind.attachedToggle = nil
    keybind.optionBounds = {}
    
    Library.KeyStates[keybind.keyCode] = false
    table.insert(Library.AllKeybinds, keybind)
    
    return keybind
end

function Keybind:IsActive()
    return self.currentState
end

function Keybind:GetTheme()
    local current = self
    while current and current.parent do
        current = current.parent
        if current and current.theme then
            return current.theme
        end
    end
    return Library.Theme.List[Library.Theme.Selected]
end

function Keybind:Render()
    if not self.visible then return end
    
    local x, y = self:GetAbsolutePos()
    local theme = self:GetTheme()
    
    local bgColor = theme.Mid
    if self.binding then
        bgColor = theme.Accent
    elseif self.hovered then
        bgColor = theme.Light
    end
    
    Drawing:Rect(x, y, self.width, self.height, bgColor, true, 2)
    Drawing:Rect(x, y, self.width, self.height, theme.Outer, false, 2)
    
    local displayText = self.binding and "..." or GetKeyName(self.keyCode)
    local textWidth, textHeight = render.measure_text(2, true, displayText)
    local textX = x + (self.width - textWidth) / 2
    local textY = y + (self.height - textHeight) / 2
    Drawing:Text(textX, textY, displayText, 2, true, theme.Text)
end

function Keybind:RenderPopup()
    if not self.menuOpen then return end
    
    local x, y = self:GetAbsolutePos()
    local theme = self:GetTheme()
    
    local menuWidth = 80
    local menuHeight = 60
    local menuX = x
    local menuY = y + self.height + 2
    
    Drawing:Rect(menuX, menuY, menuWidth, menuHeight, theme.Dark, true, 2)
    Drawing:Rect(menuX, menuY, menuWidth, menuHeight, theme.Outer, false, 2)
    
    local options = {"Hold", "Toggle", "Always"}
    for i, option in ipairs(options) do
        local optionY = menuY + (i - 1) * 20
        local isSelected = option == self.mode
        local optionColor = theme.Text
        local optionBg = theme.Dark
        
        if IsMouseInBounds(menuX, optionY, menuWidth, 20) then
            optionBg = theme.Mid
            optionColor = theme.Accent
        elseif isSelected then
            optionBg = theme.High
        end
        
        Drawing:Rect(menuX, optionY, menuWidth, 20, optionBg, true, 0)
        Drawing:Text(menuX + 5, optionY + 3, option, 2, true, optionColor)
        
        self.optionBounds[i] = {x = menuX, y = optionY, width = menuWidth, height = 20, mode = option}
    end
end

function Keybind:HandleInput()
    local isInActiveTab = self:IsInActiveTab()
    
    if not self.visible or not self.enabled then
        return
    end

    if self.menuOpen and InputState.mouseClicked and isInActiveTab and self:CanInteract() then
        local x, y = self:GetAbsolutePos()
        local menuWidth = 80
        local menuHeight = 60
        local menuX = x
        local menuY = y + self.height + 2

        local options = {"Hold", "Toggle", "Always"}
        for i, option in ipairs(options) do
            local optionY = menuY + (i - 1) * 20
            if IsMouseInBounds(menuX, optionY, menuWidth, 20) then
                self.mode = option
                self.menuOpen = false
                Library.OpenKeybindMenu = nil
                UnregisterPopup(self)
                self:RegisterInteraction()  -- Register interaction
                return
            end
        end
    end

    if self.clickdebounce > 0 then
        self.clickdebounce = self.clickdebounce - 1
    end

    if self.binding and isInActiveTab and self.clickdebounce <= 0 then
        self.clickdebounce = 0
        for keyCode = 1, 255 do
            if utility.key_state(keyCode) then
                self.keyCode = keyCode
                Library.KeyStates[keyCode] = false
                self.binding = false
                self:RegisterInteraction()  -- Register interaction
                return
            end
        end
    end

    if isInActiveTab and not (IsElementBehindPopup(self) and not self.menuOpen) and self:CanInteract() then
        Element.HandleInput(self)
        
        if self.rightClicked then
            self.menuOpen = not self.menuOpen
            if self.menuOpen then
                Library.OpenKeybindMenu = self
                RegisterPopup(self)
            else
                Library.OpenKeybindMenu = nil
                UnregisterPopup(self)
            end
            self:RegisterInteraction()  -- Register interaction
        end

        if self.clicked then
            self.binding = true
            self.clickdebounce = 100
            self:RegisterInteraction()  -- Register interaction
        end
    end
end

function Keybind:UpdateState()
    local keyPressed = Library.KeyStates[self.keyCode] or false
    local wasActive = self.currentState
    
    if self.mode == "Hold" then
        self.currentState = keyPressed
    elseif self.mode == "Toggle" then
        if keyPressed and not self.lastState then
            self.currentState = not self.currentState
        end
    elseif self.mode == "Always" then
        self.currentState = true
    end
    
    self.lastState = keyPressed
    
    if Library.KeybindsList then
        if self.currentState and not wasActive then
            Library.KeybindsList:AddKeybind(self.text, GetKeyName(self.keyCode), self.mode)
        elseif not self.currentState and wasActive then
            Library.KeybindsList:RemoveKeybind(self.text)
        end
    end
    
    if self.callback then
        self.callback(self.currentState)
    end
end

function KeybindsList:new()
    local list = Element.new(self, 10, 200, 180, 22)
    list.visible = true
    list.keybinds = {}
    list.title = "[ Keybinds ]"
    return list
end

function KeybindsList:Render()
    if not self.visible then return end
    
    local x, y = self:GetAbsolutePos()
    local theme = Library.Theme.List[Library.Theme.Selected]
    
    local totalHeight = 22 + (#self.keybinds * 18)
    self.height = totalHeight
    
    Drawing:Rect(x, y, self.width, self.height, theme.Outer, true, 2)
    Drawing:Rect(x + 1, y + 1, self.width - 2, self.height - 2, theme.Mid, true, 2)
    Drawing:Rect(x + 2, y + 2, self.width - 4, self.height - 4, theme.Dark, true, 1)
    Drawing:Rect(x + 2, y + 2, self.width - 4, 1, theme.Accent, true, 0)
    
    local titleWidth, titleHeight = render.measure_text(2, true, self.title)
    local titleX = x + (self.width - titleWidth) / 2
    Drawing:Text(titleX, y + 5, self.title, 2, true, theme.Header)
    
    local yOffset = 22
    for i, keybind in ipairs(self.keybinds) do
        local entryY = y + yOffset
        
        if i % 2 == 0 then
            Drawing:Rect(x + 2, entryY, self.width - 4, 18, theme.High, true, 0)
        end
        
        Drawing:Rect(x + 2, entryY, self.width - 4, 18, theme.Outer, false, 0)
        Drawing:Rect(x + 3, entryY + 1, self.width - 6, 16, theme.Mid, true, 0)
        
        Drawing:Text(x + 6, entryY + 3, keybind.name, 2, true, theme.Text)
        
        local valueText = "[" .. keybind.key .. "]"
        local valueWidth = render.measure_text(2, true, valueText)
        Drawing:Text(x + self.width - 6 - valueWidth, entryY + 3, valueText, 2, true, theme.Text)
        
        yOffset = yOffset + 18
    end
end

function KeybindsList:HandleInput() end

function KeybindsList:AddKeybind(name, key, mode)
    for i, keybind in ipairs(self.keybinds) do
        if keybind.name == name then
            keybind.key = key
            keybind.mode = mode
            return
        end
    end
    
    table.insert(self.keybinds, {
        name = name,
        key = key,
        mode = mode
    })
end

function KeybindsList:RemoveKeybind(name)
    for i, keybind in ipairs(self.keybinds) do
        if keybind.name == name then
            table.remove(self.keybinds, i)
            break
        end
    end
end

function KeybindsList:UpdatePosition()
    local screenX, screenY = cheat.get_window_size()
    self.x = 10
    self.y = (screenY * 0.4) - 100
end

-- OPTIMIZED WATERMARK IMPLEMENTATION
local Watermark = {}
Watermark.__index = Watermark

function Watermark:new(info)
    local watermark = {
        info = info or {},
        visible = true,
        title = info.title or info.Title or info.name or info.Name or "Melatonin",
        template = info.template or "$TITLE | $PLAYER | FPS: $FPS | Ping: $PING",
        position = info.position or "top-right",
        x = 0,
        y = 0,
        width = 200,
        height = 30,
        lastUpdate = 0,
        updateInterval = 500, -- Increased from 150ms to 500ms
        animatedWidth = 0,
        
        -- Cache for performance
        cachedText = "",
        lastFps = 0,
        lastPlayerName = "",
        needsRedraw = true,
        fpsUpdateThreshold = 10 -- Only update if FPS changes by more than this
    }
    setmetatable(watermark, self)
    
    -- Initialize with safe defaults
    watermark:SafeInitialize()
    
    return watermark
end

function Watermark:SafeInitialize()
    -- Safely calculate initial size
    pcall(function()
        self:UpdateSize()
        self:UpdatePosition()
    end)
end

function Watermark:GetTheme()
    return Library.Theme.List[Library.Theme.Selected]
end

function Watermark:UpdateSize()
    if not self.needsRedraw then return end
    
    -- Only recalculate if text changed
    local processedText = self:ProcessTemplate()
    if processedText == self.cachedText then
        return
    end
    
    self.cachedText = processedText
    
    pcall(function()
        local textWidth, textHeight = render.measure_text(2, true, processedText)
        
        -- Add padding
        self.width = textWidth + 32 -- Simplified padding calculation
        self.height = 30
        
        -- Simple animation or direct assignment
        if Library.Settings.Tween then
            self.animatedWidth = Tween.animateValue("watermark_width", self.animatedWidth, self.width, 0.1)
        else
            self.animatedWidth = self.width
        end
    end)
    
    self.needsRedraw = false
end

function Watermark:UpdatePosition()
    pcall(function()
        local screenWidth, screenHeight = cheat.get_window_size()
        
        if self.position == "top-right" then
            self.x = screenWidth - self.width - 20
            self.y = 20
        elseif self.position == "top-left" then
            self.x = 20
            self.y = 20
        elseif self.position == "bottom-right" then
            self.x = screenWidth - self.width - 20
            self.y = screenHeight - self.height - 20
        elseif self.position == "bottom-left" then
            self.x = 20
            self.y = screenHeight - self.height - 20
        end
    end)
end

function Watermark:ProcessTemplate()
    local text = self.template
    text = text:gsub("$TITLE", self.title)
    text = text:gsub("$PLAYER", Library.SharedData.playerName)
    text = text:gsub("$FPS", tostring(Library.SharedData.fps))
    text = text:gsub("$PING", tostring(Library.SharedData.ping))
    return text
end

function Watermark:Update()
    local currentTime = utility.get_tickcount()
    
    -- Only update at specified intervals
    if currentTime - self.lastUpdate < self.updateInterval then
        return
    end
    
    self.lastUpdate = currentTime
    local needsUpdate = false
    
    -- Update FPS (with threshold to reduce updates)
    local deltaTime = utility.get_delta_time()
    if deltaTime > 0 then
        local newFps = math.floor(1 / deltaTime)
        if math.abs(newFps - self.lastFps) >= self.fpsUpdateThreshold then
            Library.SharedData.fps = newFps
            self.lastFps = newFps
            needsUpdate = true
        end
    end

    
    -- Update player name (only if changed)
    local localPlayer = entity.get_local_player()
    if localPlayer then
        local newName = localPlayer:get_name() or "Unknown"
        if newName ~= self.lastPlayerName then
            Library.SharedData.playerName = newName
            self.lastPlayerName = newName
            needsUpdate = true
        end
    end
 
    
    -- Only recalculate if something actually changed
    if needsUpdate then
        self.needsRedraw = true
        self:UpdateSize()
        self:UpdatePosition()
    end
end

function Watermark:Render()
    if not self.visible then return end
    
    -- Wrap rendering in pcall for safety
    pcall(function()
        local theme = self:GetTheme()
        local x, y = self.x, self.y
        local width = self.width
        local height = self.height
        
        -- Outer outline
        Drawing:Rect(x, y, width, height, theme.Outer, true, 2)
        Drawing:Rect(x, y, width, height, theme.Stroke, false, 2)
        
        -- Inner inline
        local inlineX = x + 1
        local inlineY = y + 1
        local inlineWidth = width - 2
        local inlineHeight = height - 2
        
        Drawing:Rect(inlineX, inlineY, inlineWidth, inlineHeight, theme.Mid, true, 1)
        Drawing:Rect(inlineX, inlineY, inlineWidth, inlineHeight, theme.Dark, false, 1)
        
        -- Content frame
        local frameX = inlineX + 1
        local frameY = inlineY + 1
        local frameWidth = inlineWidth - 2
        local frameHeight = inlineHeight - 2
        
        Drawing:Rect(frameX, frameY, frameWidth, frameHeight, theme.Light, true, 0)
        
        -- Accent bar (top)
        Drawing:Rect(frameX, frameY, frameWidth, 2, theme.Accent, true, 0)
        
        -- Gradient bar (subtle)
        Drawing:Gradient(frameX + 2, frameY + 3, frameWidth - 4, 1, theme.Accent, theme.Light, true)
        
        -- Background for text
        local textBgY = frameY + 5
        local textBgHeight = frameHeight - 10
        Drawing:Rect(frameX + 2, textBgY, frameWidth - 4, textBgHeight, theme.Dark, true, 0)
        
        -- Text content (use cached text if possible)
        local processedText = self.cachedText
        if processedText == "" then
            processedText = self:ProcessTemplate()
        end
        
        local textX = frameX + 8
        local textY = frameY + 8
        
        Drawing:Text(textX, textY, processedText, 2, true, theme.Text)
    end)
end

function Watermark:SetVisible(visible)
    self.visible = visible
end

function Watermark:SetPosition(position)
    self.position = position
    self.needsRedraw = true
    self:UpdatePosition()
end

function Watermark:SetTemplate(template)
    self.template = template
    self.needsRedraw = true
    self:UpdateSize()
end

-- NEW ATTACHED COLOR PICKER FOR TOGGLE ELEMENTS
function AttachedColorPicker:new(text, callback, defaultColor, flag)
    local picker = Element.new(self, 0, 0, 20, 15)
    picker.text = text or "Color"
    picker.callback = callback or function() end
    picker.color = defaultColor or {255, 255, 255, 255}
    picker.open = false
    picker.pickerWidth = 200
    picker.pickerHeight = 180
    picker.hue = 0
    picker.saturation = 1
    picker.value = 1
    picker.flag = flag
    picker.attachedToggle = nil
    
    if flag and not Library.Flags[flag] then
        Library.Flags[flag] = picker
    end
    
    return picker
end

function AttachedColorPicker:Set(color)
    if type(color) == "table" and #color >= 3 then
        self.color = {
            color[1] or 255,
            color[2] or 255,
            color[3] or 255,
            color[4] or 255
        }
        
        -- Convert RGB to HSV
        local r, g, b = self.color[1] / 255, self.color[2] / 255, self.color[3] / 255
        local max, min = math.max(r, g, b), math.min(r, g, b)
        local delta = max - min
        
        if delta == 0 then
            self.hue = 0
        elseif max == r then
            self.hue = ((g - b) / delta) % 6
        elseif max == g then
            self.hue = (b - r) / delta + 2
        else
            self.hue = (r - g) / delta + 4
        end
        self.hue = self.hue * 60
        
        self.saturation = max == 0 and 0 or delta / max
        self.value = max
        
        if self.callback then
            self.callback(self.color)
        end
    end
end

function AttachedColorPicker:HSVtoRGB(h, s, v)
    local c = v * s
    local x = c * (1 - math.abs((h / 60) % 2 - 1))
    local m = v - c
    
    local r, g, b
    if h < 60 then
        r, g, b = c, x, 0
    elseif h < 120 then
        r, g, b = x, c, 0
    elseif h < 180 then
        r, g, b = 0, c, x
    elseif h < 240 then
        r, g, b = 0, x, c
    elseif h < 300 then
        r, g, b = x, 0, c
    else
        r, g, b = c, 0, x
    end
    
    return (r + m) * 255, (g + m) * 255, (b + m) * 255
end

function AttachedColorPicker:GetTheme()
    local current = self
    while current and current.parent do
        current = current.parent
        if current and current.theme then
            return current.theme
        end
    end
    return Library.Theme.List[Library.Theme.Selected]
end

function AttachedColorPicker:Render()
    if not self.visible then return end
    
    local x, y = self:GetAbsolutePos()
    local theme = self:GetTheme()
    
    -- Draw small color preview box
    Drawing:Rect(x, y, self.width, self.height, self.color, true, 2)
    Drawing:Rect(x, y, self.width, self.height, theme.Outer, false, 2)
end

function AttachedColorPicker:RenderPopup()
    if not self.open then return end
    
    local x, y = self:GetAbsolutePos()
    local theme = self:GetTheme()
    
    local pickerX = x - self.pickerWidth + self.width
    local pickerY = y + self.height + 5
    
    -- Ensure picker stays on screen
    local screenWidth, screenHeight = cheat.get_window_size()
    if pickerX < 10 then pickerX = x + self.width + 5 end
    if pickerY + self.pickerHeight > screenHeight - 10 then
        pickerY = y - self.pickerHeight - 5
    end
    
    Drawing:Rect(pickerX, pickerY, self.pickerWidth, self.pickerHeight, theme.Dark, true, 2)
    Drawing:Rect(pickerX, pickerY, self.pickerWidth, self.pickerHeight, theme.Outer, false, 2)
    
    -- Hue bar
    local hueBarX = pickerX + 5
    local hueBarY = pickerY + 5
    local hueBarWidth = 20
    local hueBarHeight = 120
    
    for i = 0, hueBarHeight do
        local hue = (i / hueBarHeight) * 360
        local r, g, b = self:HSVtoRGB(hue, 1, 1)
        render.rect(hueBarX, hueBarY + i, hueBarWidth, 1, r, g, b, 255)
    end
    
    -- Hue slider
    local hueY = hueBarY + (self.hue / 360) * hueBarHeight
    Drawing:Rect(hueBarX - 2, hueY - 2, hueBarWidth + 4, 4, theme.Text, false, 0)
    
    -- Saturation/Value area
    local svAreaX = hueBarX + hueBarWidth + 10
    local svAreaY = hueBarY
    local svAreaWidth = 120
    local svAreaHeight = 120
    
    for i = 0, svAreaWidth do
        for j = 0, svAreaHeight do
            local s = i / svAreaWidth
            local v = 1 - (j / svAreaHeight)
            local r, g, b = self:HSVtoRGB(self.hue, s, v)
            render.rect(svAreaX + i, svAreaY + j, 1, 1, r, g, b, 255)
        end
    end
    
    -- S/V cursor
    local svX = svAreaX + self.saturation * svAreaWidth
    local svY = svAreaY + (1 - self.value) * svAreaHeight
    Drawing:Rect(svX - 3, svY - 3, 6, 6, theme.Text, false, 0)
    Drawing:Rect(svX - 2, svY - 2, 4, 4, {0, 0, 0, 255}, false, 0)
    
    -- Alpha bar
    local alphaX = pickerX + 5
    local alphaY = pickerY + 135
    local alphaWidth = self.pickerWidth - 10
    local alphaHeight = 15
    
    -- Checkerboard background
    for i = 0, alphaWidth, 8 do
        for j = 0, alphaHeight, 8 do
            local color = ((i / 8) + (j / 8)) % 2 == 0 and 200 or 100
            render.rect(alphaX + i, alphaY + j, math.min(8, alphaWidth - i), math.min(8, alphaHeight - j), color, color, color, 255)
        end
    end
    
    -- Alpha gradient
    for i = 0, alphaWidth do
        local alpha = i / alphaWidth
        render.rect(alphaX + i, alphaY, 1, alphaHeight, self.color[1], self.color[2], self.color[3], alpha * 255)
    end
    
    Drawing:Rect(alphaX, alphaY, alphaWidth, alphaHeight, theme.Outer, false, 0)
    
    -- Alpha handle
    local alphaHandleX = alphaX + (self.color[4] / 255) * alphaWidth
    Drawing:Rect(alphaHandleX - 2, alphaY - 2, 4, alphaHeight + 4, theme.Text, false, 0)
    
    -- Preview
    local previewX = pickerX + 5
    local previewY = pickerY + 155
    Drawing:Rect(previewX, previewY, 40, 20, self.color, true, 0)
    Drawing:Rect(previewX, previewY, 40, 20, theme.Outer, false, 0)
end

function AttachedColorPicker:HandleInput()
    if not self.visible or not self.enabled then return end
    if IsElementBehindPopup(self) and not self.open then return end
    if not self:CanInteract() then return end
    
    Element.HandleInput(self)
    local x, y = self:GetAbsolutePos()
    
    if self.clicked then
        self.open = not self.open
        if self.open then
            Library.OpenColorPicker = self
            RegisterPopup(self)
        else
            Library.OpenColorPicker = nil
            UnregisterPopup(self)
        end
        BringToFront(self)
        self:RegisterInteraction()
    end
    
    if self.open and InputState.mousePressed then
        local pickerX = x - self.pickerWidth + self.width
        local pickerY = y + self.height + 5
        
        -- Ensure picker stays on screen
        local screenWidth, screenHeight = cheat.get_window_size()
        if pickerX < 10 then pickerX = x + self.width + 5 end
        if pickerY + self.pickerHeight > screenHeight - 10 then
            pickerY = y - self.pickerHeight - 5
        end
        
        local hueBarX = pickerX + 5
        local hueBarY = pickerY + 5
        local hueBarWidth = 20
        local hueBarHeight = 120
        
        local svAreaX = hueBarX + hueBarWidth + 10
        local svAreaY = hueBarY
        local svAreaWidth = 120
        local svAreaHeight = 120
        
        local alphaX = pickerX + 5
        local alphaY = pickerY + 135
        local alphaWidth = self.pickerWidth - 10
        
        local mouseX, mouseY = input.cursor_position()
        
        -- Hue bar interaction
        if IsMouseInBounds(hueBarX, hueBarY, hueBarWidth, hueBarHeight) then
            local relY = math.max(0, math.min(1, (mouseY - hueBarY) / hueBarHeight))
            self.hue = relY * 360
            
            local r, g, b = self:HSVtoRGB(self.hue, self.saturation, self.value)
            self.color[1] = r
            self.color[2] = g
            self.color[3] = b
            
            if self.callback then
                self.callback(self.color)
            end
            self:RegisterInteraction()
        end
        
        -- S/V area interaction
        if IsMouseInBounds(svAreaX, svAreaY, svAreaWidth, svAreaHeight) then
            local relX = math.max(0, math.min(1, (mouseX - svAreaX) / svAreaWidth))
            local relY = math.max(0, math.min(1, (mouseY - svAreaY) / svAreaHeight))
            
            self.saturation = relX
            self.value = 1 - relY
            
            local r, g, b = self:HSVtoRGB(self.hue, self.saturation, self.value)
            self.color[1] = r
            self.color[2] = g
            self.color[3] = b
            
            if self.callback then
                self.callback(self.color)
            end
            self:RegisterInteraction()
        end
        
        -- Alpha bar interaction
        if IsMouseInBounds(alphaX, alphaY, alphaWidth, 15) then
            local relX = math.max(0, math.min(1, (mouseX - alphaX) / alphaWidth))
            self.color[4] = relX * 255
            
            if self.callback then
                self.callback(self.color)
            end
            self:RegisterInteraction()
        end
    end
end

function Toggle:new(text, callback, defaultValue, flag)
    local toggle = Element.new(self, 0, 0, 100, 20)
    toggle.text = text or "Toggle"
    toggle.callback = callback or function() end
    toggle.value = defaultValue or false
    toggle.keybind = nil
    toggle.colorPicker = nil  -- New attached color picker
    toggle.flag = flag
    
    if flag and not Library.Flags[flag] then
        Library.Flags[flag] = toggle
    end
    
    return toggle
end

function Toggle:GetTheme()
    local current = self
    while current and current.parent do
        current = current.parent
        if current and current.theme then
            return current.theme
        end
    end
    return Library.Theme.List[Library.Theme.Selected]
end

function Toggle:Set(value)
    self.value = value
    if self.callback then
        self.callback(value)
    end
end

function Toggle:AddColorPicker(text, callback, defaultColor, flag)
    local colorPicker = AttachedColorPicker:new(text, callback, defaultColor, flag)
    colorPicker.parent = self
    colorPicker.attachedToggle = self
    self.colorPicker = colorPicker
    return colorPicker
end

function Toggle:Render()
    if not self.visible then return end
    
    local x, y = self:GetAbsolutePos()
    local theme = self:GetTheme()
    
    local boxSize = 14
    local boxY = y + (self.height - boxSize) / 2
    
    Drawing:Rect(x, boxY, boxSize, boxSize, theme.Outer, false, 2)
    Drawing:Rect(x + 1, boxY + 1, boxSize - 2, boxSize - 2, theme.Mid, true, 1)
    
    if self.value then
        Drawing:Rect(x + 3, boxY + 3, boxSize - 6, boxSize - 6, theme.Accent, true, 0)
    end
    
    -- Calculate available space for text and elements
    local rightElementsWidth = 0
    local elementSpacing = 5
    
    -- Account for color picker
    if self.colorPicker then
        rightElementsWidth = rightElementsWidth + self.colorPicker.width + elementSpacing
    end
    
    -- Account for keybind
    if self.keybind then
        rightElementsWidth = rightElementsWidth + 60 + elementSpacing
    end
    
    local textEndX = x + self.width - rightElementsWidth
    
    -- Position color picker on the right
    if self.colorPicker then
        self.colorPicker.x = self.width - self.colorPicker.width - (self.keybind and 65 or 0)
        self.colorPicker.y = (self.height - self.colorPicker.height) / 2
        self.colorPicker:Render()
    end
    
    -- Position keybind
    if self.keybind then
        local keybindWidth = 60
        self.keybind.x = self.width - keybindWidth
        self.keybind.y = 0
        self.keybind.width = keybindWidth
        self.keybind:Render()
    end
    
    -- Draw text with proper clipping
    local availableTextWidth = textEndX - (x + boxSize + 5)
    local fullText = self.text
    local textWidth = render.measure_text(2, true, fullText)
    
    local displayText = fullText
    if textWidth > availableTextWidth and availableTextWidth > 20 then
        local charWidth = textWidth / #fullText
        local maxChars = math.floor(availableTextWidth / charWidth) - 3
        if maxChars > 0 then
            displayText = string.sub(fullText, 1, maxChars) .. "..."
        end
    end
    
    Drawing:Text(x + boxSize + 5, y + 2, displayText, 2, true, theme.Text)
end

function Toggle:HandleInput()
    if not self.visible or not self.enabled then return end
    if IsElementBehindPopup(self) then return end
    if not self:IsInActiveTab() then return end 
    if not self:CanInteract() then return end
    
    Element.HandleInput(self)
    
    -- Only toggle if clicked on the checkbox area or text, not on attached elements
    local x, y = self:GetAbsolutePos()
    local mouseX, mouseY = input.cursor_position()
    
    if self.clicked then
        -- Check if click was not on attached elements
        local clickedOnAttachment = false
        
        if self.colorPicker then
            local cpX = x + self.colorPicker.x
            local cpY = y + self.colorPicker.y
            if IsMouseInBounds(cpX, cpY, self.colorPicker.width, self.colorPicker.height) then
                clickedOnAttachment = true
            end
        end
        
        if self.keybind then
            local kbX = x + self.keybind.x
            local kbY = y + self.keybind.y
            if IsMouseInBounds(kbX, kbY, self.keybind.width, self.keybind.height) then
                clickedOnAttachment = true
            end
        end
        
        if not clickedOnAttachment then
            self.value = not self.value
            if self.callback then
                self.callback(self.value)
            end
            self:RegisterInteraction()
        end
    end
    
    if self.keybind then
        self.keybind:HandleInput()
    end
    
    if self.colorPicker then
        self.colorPicker:HandleInput()
    end
end

function Toggle:AddKeybind(keyCode, mode)
    local keybind = Keybind:new(self.text .. " Key", keyCode, mode, function(state)
        -- Empty callback for now
    end)
    keybind.parent = self
    self.keybind = keybind
    return keybind
end

function ESPPreview:new(name, parent, x, y, width, height)
    local preview = Element.new(self, x or 10, y or 60, width or 250, height or 350)
    preview.name = name
    preview.parent = parent
    preview.healthAnimation = 0
    preview.healthDirection = 1
    return preview
end

function ESPPreview:GetTheme()
    local current = self
    while current and current.parent do
        current = current.parent
        if current and current.theme then
            return current.theme
        end
    end
    return Library.Theme.List[Library.Theme.Selected]
end

function ESPPreview:Render()
    if not self.visible or not Library.ESPPreview.Enabled then return end
    
    local x, y = self:GetAbsolutePos()
    local theme = self:GetTheme()
    
    Drawing:Rect(x, y, self.width, self.height, theme.Mid, true, 2)
    Drawing:Rect(x, y, self.width, self.height, theme.Outer, false, 2)
    
    Drawing:Rect(x + 1, y + 1, self.width - 2, 20, theme.Light, true, 0)
    Drawing:Text(x + 5, y + 4, "ESP Preview", 2, true, theme.Header)
    
    local previewX = x + 10
    local previewY = y + 30
    local previewWidth = self.width - 20
    local previewHeight = self.height - 40
    
    Drawing:Rect(previewX, previewY, previewWidth, previewHeight, theme.Dark, true, 2)
    Drawing:Rect(previewX, previewY, previewWidth, previewHeight, theme.Outer, false, 2)
    
    local playerX = previewX + previewWidth / 2 - 55
    local playerY = previewY + 20
    local playerWidth = 115
    local playerHeight = 250
    
    self.healthAnimation = self.healthAnimation + (Library.ESPPreview.AnimationSpeed * self.healthDirection)
    if self.healthAnimation >= 1 then
        self.healthAnimation = 1
        self.healthDirection = -1
    elseif self.healthAnimation <= 0 then
        self.healthAnimation = 0
        self.healthDirection = 1
    end
    
    local currentHealth = 20 + (self.healthAnimation * 80)

    render.image(Library.Assets.Joeyy, playerX, playerY, playerWidth, playerHeight, 255, 255, 255, 255)

    
    if Library.ESPPreview.Components.Box then
        local boxColor = Library.ESPPreview.Colors.Box
        Drawing:Rect(playerX, playerY, playerWidth, playerHeight, {0, 0, 0, 255}, false, 0)
        Drawing:Rect(playerX + 1, playerY + 1, playerWidth - 2, playerHeight - 2, boxColor, false, 0)
    end
    
    if Library.ESPPreview.Components.HealthBar then
        local healthBarX = playerX - 8
        local healthBarY = playerY
        local healthBarWidth = 4
        local healthBarHeight = playerHeight
        
        Drawing:Rect(healthBarX, healthBarY, healthBarWidth, healthBarHeight, {0, 0, 0, 255}, true, 0)
        
        local healthFillHeight = (healthBarHeight - 2) * (currentHealth / 100)
        local healthPercent = currentHealth / 100
        local healthColor = {
            math.floor((1 - healthPercent) * 255),
            math.floor(healthPercent * 255),
            0,
            255
        }
        
        Drawing:Rect(healthBarX + 1, healthBarY + healthBarHeight - healthFillHeight - 1, 
                    healthBarWidth - 2, healthFillHeight, healthColor, true, 0)
        
        local healthText = tostring(math.floor(currentHealth))
        Drawing:Text(healthBarX - 15, healthBarY + healthBarHeight / 2, healthText, 1, true, healthColor)
    end
    
    if Library.ESPPreview.Components.Name then
        local nameColor = Library.ESPPreview.Colors.Name
        Drawing:Text(playerX + playerWidth / 2, playerY - 15, "Joeyy", 2, true, nameColor)
    end
    
    if Library.ESPPreview.Components.Distance then
        local distanceColor = Library.ESPPreview.Colors.Distance
        Drawing:Text(playerX + playerWidth / 2, playerY + playerHeight + 5, "25m", 2, true, distanceColor)
    end
    
    if Library.ESPPreview.Components.Weapon then
        local weaponColor = Library.ESPPreview.Colors.Weapon
        Drawing:Text(playerX + playerWidth / 2, playerY + playerHeight + 20, "Fent", 2, true, weaponColor)
    end
    
    if Library.ESPPreview.Components.Flags then
        local flagColor = Library.ESPPreview.Colors.Flags
        Drawing:Text(playerX + playerWidth + 5, playerY + 5, "ESP", 1, true, flagColor)
        Drawing:Text(playerX + playerWidth + 5, playerY + 20, "VIS", 1, true, flagColor)
    end
    
    if Library.ESPPreview.Components.Skeleton then
        local skeletonColor = Library.ESPPreview.Colors.Skeleton
        local centerX = playerX + playerWidth / 2
        local headY = playerY + 35
        local shoulderY = playerY + 50
        local waistY = playerY + 90
        local pelvisY = playerY + 120
        local feetY = playerY + playerHeight - 20

        -- Head to shoulders
        Drawing:Line(centerX, headY, centerX, shoulderY, skeletonColor, 2)
        -- Shoulders (wider apart)
        Drawing:Line(centerX - 20, shoulderY, centerX + 20, shoulderY, skeletonColor, 2)
        -- Spine from shoulders to pelvis
        Drawing:Line(centerX, shoulderY, centerX, pelvisY, skeletonColor, 2)
        -- Pelvis horizontal line
        Drawing:Line(centerX - 8, pelvisY, centerX + 8, pelvisY, skeletonColor, 2)

        -- Arms
        -- Left arm (upper arm + forearm)
        Drawing:Line(centerX - 20, shoulderY, centerX - 25, shoulderY + 25, skeletonColor, 2)  -- Left upper arm
        Drawing:Line(centerX - 25, shoulderY + 25, centerX - 30, shoulderY + 45, skeletonColor, 2)  -- Left forearm

        -- Right arm (upper arm + forearm)
        Drawing:Line(centerX + 20, shoulderY, centerX + 25, shoulderY + 25, skeletonColor, 2)  -- Right upper arm
        Drawing:Line(centerX + 25, shoulderY + 25, centerX + 30, shoulderY + 45, skeletonColor, 2)  -- Right forearm

        -- Legs from pelvis
        Drawing:Line(centerX - 4, pelvisY, centerX - 15, feetY, skeletonColor, 2)
        Drawing:Line(centerX + 4, pelvisY, centerX + 15, feetY, skeletonColor, 2)
    end
    
    if Library.ESPPreview.Components.Chams then
        local chamsColor = Library.ESPPreview.Colors.Chams
        chamsColor[4] = 100
        Drawing:Rect(playerX + 5, playerY + 5, playerWidth - 10, playerHeight - 10, chamsColor, true, 0)
    end
end

function ESPPreview:HandleInput()
    if not self.visible or not self.enabled then return end
    if IsElementBehindPopup(self) then return end
    if not self:IsInActiveTab() then return end 
    Element.HandleInput(self)
end

function PlayerList:new(name, parent, x, y, width, height)
    local playerList = Element.new(self, x or 10, y or 60, width or 400, height or 300)
    playerList.name = name
    playerList.parent = parent
    playerList.players = {}
    playerList.selectedPlayerName = nil
    playerList.manualStatusChanges = {}
    playerList.scrollOffset = 0
    playerList.maxVisiblePlayers = 10
    playerList.rowHeight = 22
    playerList.sessionFlags = {}
    playerList.avatarCache = {}
    playerList.statusDropdown = nil
    playerList.addFlagButton = nil
    playerList.removeFlagButton = nil
    playerList.scrollbarDragging = false
    playerList.scrollbarDragOffset = 0
    playerList.playersDataCache = {}
    playerList.avatarsInitialized = false
    playerList.failedImages = {} -- NEW: Track failed images for retry

    Library.PlayerListElement = playerList
    return playerList
end

function PlayerList:GetTheme()
    local current = self
    while current.parent do
        current = current.parent
        if current.theme then
            return current.theme
        end
    end
    return Library.Theme.List[Library.Theme.Selected]
end

function PlayerList:GetSelectedPlayer()
    if not self.selectedPlayerName then return nil end
    
    for _, player in ipairs(self.players) do
        if player.name == self.selectedPlayerName then
            return player
        end
    end
    return nil
end

-- FIXED: Extract clan name from NameTag
function PlayerList:GetPlayerClan(playerName)
    local workspace = game.get_workspace()
    if not workspace then return "None" end
    
    local playerInstance = workspace:find_first_child(playerName)
    if not playerInstance then return "None" end
    
    local nameTag = playerInstance:find_first_child("NameTag")
    if not nameTag then return "None" end
    
    local label = nameTag:find_first_child("Label")
    if not label then return "None" end
    
    local text = label:get_textlabel_value()
    if not text then return "None" end
    
    -- Extract clan from [CLAN] format
    local clan = text:match("%[([^%]]+)%]")
    return clan or "None"
end

function PlayerList:Render()
    if not self.visible then return end
    
    local x, y = self:GetAbsolutePos()
    local theme = self:GetTheme()
    
    Drawing:Rect(x, y, self.width, self.height, theme.Mid, true, 2)
    Drawing:Rect(x, y, self.width, self.height, theme.Outer, false, 2)
    
    Drawing:Rect(x + 1, y + 1, self.width - 2, 20, theme.Light, true, 0)
    Drawing:Text(x + 5, y + 4, self.name .. " - " .. #self.players .. " Players", 2, true, theme.Header)
    
    local listX = x + 4
    local listY = y + 24
    local listWidth = self.width - 8
    local listHeight = self.maxVisiblePlayers * self.rowHeight
    
    Drawing:Rect(listX, listY, listWidth, listHeight, theme.Dark, true, 0)
    Drawing:Rect(listX, listY, listWidth, listHeight, theme.Outer, false, 0)
    
    local colWidth = listWidth / 3
    Drawing:Text(listX + 4, listY + 2, "Username", 1, true, theme.Text)
    Drawing:Text(listX + colWidth + 4, listY + 2, "Clan", 1, true, theme.Text) -- CHANGED: Team -> Clan
    Drawing:Text(listX + colWidth * 2 + 4, listY + 2, "Status", 1, true, theme.Text)
    
    Drawing:Line(listX + colWidth, listY, listX + colWidth, listY + listHeight, theme.Outer, 1)
    Drawing:Line(listX + colWidth * 2, listY, listX + colWidth * 2, listY + listHeight, theme.Outer, 1)
    
    for i = 1, self.maxVisiblePlayers do
        local playerIndex = i + self.scrollOffset
        local player = self.players[playerIndex]
        
        if player then
            local rowY = listY + (i - 1) * self.rowHeight + 18
            local isSelected = player.name == self.selectedPlayerName
            
            player.clickY = rowY

            if isSelected then
                Drawing:Rect(listX + 1, rowY, listWidth - 2, self.rowHeight, theme.Accent, true, 0)
            elseif i % 2 == 0 then
                Drawing:Rect(listX + 1, rowY, listWidth - 2, self.rowHeight, theme.High, true, 0)
            end
            
            if i < self.maxVisiblePlayers then
                Drawing:Line(listX + 3, rowY + self.rowHeight, listX + listWidth - 3, rowY + self.rowHeight, theme.Outer, 1)
            end
            
            local textColor = isSelected and {255, 255, 255, 255} or theme.Text
            local displayName = player.name
            
            if self.sessionFlags[player.name] then
                displayName = displayName .. " [" .. self.sessionFlags[player.name] .. "]"
            end
            
            Drawing:Text(listX + 4, rowY + 4, displayName, 2, true, textColor)
            Drawing:Text(listX + colWidth + 4, rowY + 4, player.clan, 2, true, textColor) -- CHANGED: team -> clan
            
            local statusColor = textColor
            if player.status == "Enemy" then
                statusColor = {255, 55, 55, 255}
            elseif player.status == "Friend" then
                statusColor = {55, 255, 55, 255}
            elseif player.status == "Local Player" then
                statusColor = {200, 55, 200, 255}
            elseif player.status == "Priority" then
                statusColor = {255, 165, 0, 255}
            elseif player.status == "Moderator" then
                statusColor = {250, 143, 12, 255}
            end
            
            Drawing:Text(listX + colWidth * 2 + 4, rowY + 4, player.status, 2, true, statusColor)
        end
    end
    
    if #self.players > self.maxVisiblePlayers then
        local scrollbarX = x + self.width - 12
        local scrollbarY = listY + 18
        local scrollbarHeight = listHeight - 18
        
        Drawing:Rect(scrollbarX, scrollbarY, 8, scrollbarHeight, theme.Dark, true, 0)
        
        local thumbHeight = math.max(20, scrollbarHeight * (self.maxVisiblePlayers / #self.players))
        local thumbY = scrollbarY + (scrollbarHeight - thumbHeight) * (self.scrollOffset / (#self.players - self.maxVisiblePlayers))
        
        Drawing:Rect(scrollbarX + 1, thumbY, 6, thumbHeight, theme.Accent, true, 0)
        
        self.scrollbarBounds = {
            x = scrollbarX,
            y = scrollbarY,
            width = 8,
            height = scrollbarHeight,
            thumbY = thumbY,
            thumbHeight = thumbHeight
        }
    else
        self.scrollbarBounds = nil
    end
    
    local selectedPlayer = self:GetSelectedPlayer()
    if selectedPlayer then
        local infoY = listY + listHeight + 20
        local infoHeight = 120
        
        Drawing:Rect(listX, infoY, listWidth, infoHeight, theme.Dark, true, 0)
        Drawing:Rect(listX, infoY, listWidth, infoHeight, theme.Outer, false, 0)
        
        local avatarSize = 60
        local avatarX = listX + 10
        local avatarY = infoY + 10
        
        Drawing:Rect(avatarX, avatarY, avatarSize, avatarSize, theme.High, true, 0)
        Drawing:Rect(avatarX, avatarY, avatarSize, avatarSize, theme.Outer, false, 0)
        
        local playerId = selectedPlayer.userId or selectedPlayer.name
        if self.avatarCache[playerId] then
            render.image(self.avatarCache[playerId], avatarX + 2, avatarY + 2, avatarSize - 4, avatarSize - 4, 255, 255, 255, 255)
        else
            -- FIXED: Try to reload failed images
            if selectedPlayer.userId and self.failedImages[playerId] then
                local currentTime = utility.get_tickcount()
                if currentTime - self.failedImages[playerId] > 5000 then -- Retry after 5 seconds
                    self.failedImages[playerId] = nil
                    self:LoadAvatarsForUserIds({tostring(selectedPlayer.userId)})
                end
            end
            Drawing:Text(avatarX + avatarSize/2, avatarY + avatarSize/2, "...", 2, true, theme.Text)
        end
        
        local infoText = string.format("Selected: %s\nClan: %s\nStatus: %s\nUser ID: %s",
            selectedPlayer.name,
            selectedPlayer.clan, -- CHANGED: team -> clan
            selectedPlayer.status,
            selectedPlayer.userId or "N/A")
        
        Drawing:Text(avatarX + avatarSize + 10, infoY + 10, infoText, 2, true, theme.Text)
        
        local buttonY = infoY + 75
        local buttonWidth = 80
        local buttonHeight = 20
        local buttonSpacing = 5
        local buttonsStartX = avatarX + avatarSize + 10
        
        if not self.statusDropdown then
            self.statusDropdown = Dropdown:new("Change Status",
                {"None", "Friend", "Enemy", "Priority"},
                function(selected)
                    local currentSelectedPlayer = self:GetSelectedPlayer()
                    if currentSelectedPlayer then
                        self:SetPlayerStatus(currentSelectedPlayer.name, selected)
                    end
                end, "None")
            self.statusDropdown.parent = self
            self.statusDropdown.width = buttonWidth
            self.statusDropdown.height = buttonHeight
        end
        
        self.statusDropdown.x = buttonsStartX - x
        self.statusDropdown.y = buttonY - y
        
        if not self.addFlagButton then
            self.addFlagButton = Button:new("Add Flag", function()
                local currentSelectedPlayer = self:GetSelectedPlayer()
                if currentSelectedPlayer then
                    local flags = {"VIP", "Streamer", "Cheater", "Suspect", "Verified", "Target", "Ignore"}
                    local currentFlag = self.sessionFlags[currentSelectedPlayer.name] or ""
                    local nextIndex = 1
                    
                    for i, flag in ipairs(flags) do
                        if flag == currentFlag then
                            nextIndex = (i % #flags) + 1
                            break
                        end
                    end
                    
                    self.sessionFlags[currentSelectedPlayer.name] = flags[nextIndex]
                end
            end)
            self.addFlagButton.parent = self
            self.addFlagButton.width = buttonWidth
            self.addFlagButton.height = buttonHeight
        end
        
        self.addFlagButton.x = (buttonsStartX + buttonWidth + buttonSpacing) - x
        self.addFlagButton.y = buttonY - y
        
        if not self.removeFlagButton then
            self.removeFlagButton = Button:new("Remove Flag", function()
                local currentSelectedPlayer = self:GetSelectedPlayer()
                if currentSelectedPlayer and self.sessionFlags[currentSelectedPlayer.name] then
                    self.sessionFlags[currentSelectedPlayer.name] = nil
                end
            end)
            self.removeFlagButton.parent = self
            self.removeFlagButton.width = buttonWidth
            self.removeFlagButton.height = buttonHeight
        end
        
        self.removeFlagButton.x = (buttonsStartX + (buttonWidth + buttonSpacing) * 2) - x
        self.removeFlagButton.y = buttonY - y
        
        if self.statusDropdown then self.statusDropdown:Render() end
        if self.addFlagButton then self.addFlagButton:Render() end
        if self.removeFlagButton then self.removeFlagButton:Render() end
    end
end

function PlayerList:HandleInput()
    if not self.visible or not self.enabled then return end
    if IsElementBehindPopup(self) then return end
    if not self:IsInActiveTab() then return end
    
    Element.HandleInput(self)
    
    local x, y = self:GetAbsolutePos()
    local listX = x + 4
    local listY = y + 24
    local listHeight = self.maxVisiblePlayers * self.rowHeight
    
    if self.scrollbarBounds and #self.players > self.maxVisiblePlayers then
        local mouseX, mouseY = input.cursor_position()
        
        if InputState.mouseClicked then
            if IsMouseInBounds(self.scrollbarBounds.x, self.scrollbarBounds.thumbY,
                             self.scrollbarBounds.width, self.scrollbarBounds.thumbHeight) then
                self.scrollbarDragging = true
                self.scrollbarDragOffset = mouseY - self.scrollbarBounds.thumbY
            end
        end
        
        if self.scrollbarDragging then
            if InputState.mousePressed then
                local newThumbY = mouseY - self.scrollbarDragOffset
                local minThumbY = self.scrollbarBounds.y
                local maxThumbY = self.scrollbarBounds.y + self.scrollbarBounds.height - self.scrollbarBounds.thumbHeight
                
                newThumbY = math.max(minThumbY, math.min(maxThumbY, newThumbY))
                
                local thumbProgress = (newThumbY - minThumbY) / (maxThumbY - minThumbY)
                self.scrollOffset = math.floor(thumbProgress * (#self.players - self.maxVisiblePlayers))
                self.scrollOffset = math.max(0, math.min(#self.players - self.maxVisiblePlayers, self.scrollOffset))
            else
                self.scrollbarDragging = false
            end
        end
    end
    
    if not self.scrollbarDragging then
        local mouseX, mouseY = input.cursor_position()
        if IsMouseInBounds(listX, listY + 18, self.width - 20, listHeight - 18) then
            if utility.key_state(0x26) then
                if self.scrollOffset > 0 then
                    self.scrollOffset = self.scrollOffset - 1
                end
            elseif utility.key_state(0x28) then
                if self.scrollOffset < (#self.players - self.maxVisiblePlayers) then
                    self.scrollOffset = self.scrollOffset + 1
                end
            end
        end
    end
    
    if InputState.mouseClicked and not self.scrollbarDragging then
        for i = 1, self.maxVisiblePlayers do
            local playerIndex = i + self.scrollOffset
            local player = self.players[playerIndex]
            
            if player and player.clickY then
                if IsMouseInBounds(listX, player.clickY, self.width - 20, self.rowHeight) then
                    self.selectedPlayerName = player.name
                    break
                end
            end
        end
    end
    
    local selectedPlayer = self:GetSelectedPlayer()
    if selectedPlayer then
        if self.statusDropdown then self.statusDropdown:HandleInput() end
        if self.addFlagButton then self.addFlagButton:HandleInput() end
        if self.removeFlagButton then self.removeFlagButton:HandleInput() end
    end
end

function PlayerList:AddPlayer(name, clan, status, userId) -- CHANGED: team -> clan
    local player = {
        name = name or "Unknown",
        clan = clan or "None", -- CHANGED: team -> clan
        status = status or "None",
        userId = userId or nil
    }
    
    table.insert(self.players, player)
    return player
end

function PlayerList:SetPlayerStatus(playerName, status)
    self.manualStatusChanges[playerName] = status
    
    for _, player in ipairs(self.players) do
        if player.name == playerName then
            player.status = status
            break
        end
    end
end

-- FIXED: Handle failed image loading with retry
function PlayerList:LoadAvatarsForUserIds(userIds)
    if #userIds == 0 then return end
    
    local userIdsString = table.concat(userIds, ",")
    local thumbnailUrl = string.format(
        "https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds=%s&size=352x352&format=Png&isCircular=false",
        userIdsString
    )
        
    http.get(thumbnailUrl, {}, function(body)
        if body and #body > 0 then
            local success, thumbnailData = pcall(function()
                return json.parse(body)
            end)
            
            if success and thumbnailData and thumbnailData.data then
                for _, userData in ipairs(thumbnailData.data) do
                    if userData.targetId and userData.imageUrl and userData.state == "Completed" then
                        http.get(userData.imageUrl, {}, function(imageData)
                            if imageData and #imageData > 0 then
                                local textureId = utility.load_image(imageData)
                                if textureId then
                                    self.avatarCache[userData.targetId] = textureId
                                    -- Remove from failed images if it was there
                                    self.failedImages[userData.targetId] = nil
                                else
                                    -- Mark as failed
                                    self.failedImages[userData.targetId] = utility.get_tickcount()
                                end
                            else
                                -- Mark as failed
                                self.failedImages[userData.targetId] = utility.get_tickcount()
                            end
                        end)
                    else
                        -- Mark as failed
                        if userData.targetId then
                            self.failedImages[userData.targetId] = utility.get_tickcount()
                        end
                    end
                end
            end
        end
    end)
end

function PlayerList:InitializeAllPlayerAvatars()
    if self.avatarsInitialized then return end
        
    local userIdsToLoad = {}
    
    local players = entity.get_players(false)
    if players then
        for _, player in pairs(players) do
            if player:is_alive() then
                local userId = nil
                 userId = player:get_user_id() 
                
                if not userId then
                    local playersService = game.get_players()
                    if playersService then
                        local gamePlayer = playersService:find_first_child(player:get_name())
                        if gamePlayer then
                             userId = gamePlayer:get_user_id() 
                        end
                    end
                end
                
                if userId and not self.avatarCache[userId] then
                    table.insert(userIdsToLoad, tostring(userId))
                    self.playersDataCache[player:get_name()] = {
                        name = player:get_name(),
                        userId = userId,
                        present = true
                    }
                end
            end
        end
    end
    
    local localPlayer = entity.get_local_player()
    if localPlayer then
        local userId = nil
        local gameLocalPlayer = game.get_local_player()
        if gameLocalPlayer then
            userId = gameLocalPlayer:get_user_id()
        end
        
        if userId and not self.avatarCache[userId] then
            table.insert(userIdsToLoad, tostring(userId))
            self.playersDataCache[localPlayer:get_name()] = {
                name = localPlayer:get_name(),
                userId = userId,
                present = true
            }
        end
    end
    
    if #userIdsToLoad > 0 then
        self:LoadAvatarsForUserIds(userIdsToLoad)
    end
    
    self.avatarsInitialized = true
end

function PlayerList:HandlePlayerJoined(playerName, userId)
    if not userId then return end
    if self.avatarCache[userId] then return end
        
    self.playersDataCache[playerName] = {
        name = playerName,
        userId = userId,
        present = true
    }
    
    self:LoadAvatarsForUserIds({tostring(userId)})
end

function PlayerList:HandlePlayerLeft(playerName)
    if self.playersDataCache[playerName] then
        local playerData = self.playersDataCache[playerName]       
        
        if playerData.userId and self.avatarCache[playerData.userId] then
            self.avatarCache[playerData.userId] = nil
        end
        
        if self.sessionFlags[playerName] then
            self.sessionFlags[playerName] = nil
        end
        
        if self.manualStatusChanges[playerName] then
            self.manualStatusChanges[playerName] = nil
        end
        
        if self.selectedPlayerName == playerName then
            self.selectedPlayerName = nil
        end
        
        self.playersDataCache[playerName] = nil
    end
end

function PlayerList:CheckForPlayerChanges()
    local currentPlayers = {}
    
    local players = entity.get_players(false)
    if players then
        for _, player in pairs(players) do
            if player:is_alive() then
                local userId = nil
                 userId = player:get_user_id() 
                
                if not userId then
                    local playersService = game.get_players()
                    if playersService then
                        local gamePlayer = playersService:find_first_child(player:get_name())
                        if gamePlayer then
                             userId = gamePlayer:get_user_id() 
                        end
                    end
                end
                
                currentPlayers[player:get_name()] = {
                    name = player:get_name(),
                    userId = userId,
                    present = true
                }
            end
        end
    end
    
    local localPlayer = entity.get_local_player()
    if localPlayer then
        local userId = nil
        local gameLocalPlayer = game.get_local_player()
        if gameLocalPlayer then
            userId = gameLocalPlayer:get_user_id()
        end
        
        currentPlayers[localPlayer:get_name()] = {
            name = localPlayer:get_name(),
            userId = userId,
            present = true
        }
    end
    
    for playerName, playerData in pairs(currentPlayers) do
        if not self.playersDataCache[playerName] then
            self:HandlePlayerJoined(playerName, playerData.userId)
        end
    end
    
    for playerName, playerData in pairs(self.playersDataCache) do
        if not currentPlayers[playerName] then
            self:HandlePlayerLeft(playerName)
        end
    end
end

-- FIXED: Update players with clan extraction
function PlayerList:UpdatePlayers()
    if not self.avatarsInitialized then
        self:InitializeAllPlayerAvatars()
    end
    
    self:CheckForPlayerChanges()
    
    local previousSelection = self.selectedPlayerName
    local previousManualChanges = {}
    for name, status in pairs(self.manualStatusChanges) do
        previousManualChanges[name] = status
    end
    
    self.players = {}
    local localPlayerAdded = nil
    
    local localPlayer = entity.get_local_player()
    if localPlayer then
        local userId = nil
        local gameLocalPlayer = game.get_local_player()
        if gameLocalPlayer then
            userId = gameLocalPlayer:get_user_id()
        end
        
        local clan = self:GetPlayerClan(localPlayer:get_name()) -- CHANGED: Get clan instead of team
        local localPlayerData = self:AddPlayer(localPlayer:get_name(), clan, "Local Player", userId)
        localPlayerAdded = localPlayerData
    end
    
    local players = entity.get_players(false)
    if players then
        for _, player in pairs(players) do
            if player:is_alive() then
                local playerName = player:get_name()
                local status = "None"
                
                if previousManualChanges[playerName] then
                    status = previousManualChanges[playerName]
                    self.manualStatusChanges[playerName] = status
                else
                    if player:is_whitelisted() then
                        status = "Friend"
                    elseif contains(mods_names, player:get_name()) then
                        status = "Moderator"
                        Library.Notify("ALERT", "Moderator "..player:get_name().." has joined your server", "error", 5000)
                    else
                        status = "Enemy"
                    end
                end
                
                local userId = nil
                 userId = player:get_user_id() 
                
                if not userId then
                    local playersService = game.get_players()
                    if playersService then
                        local gamePlayer = playersService:find_first_child(player:get_name())
                        if gamePlayer then
                             userId = gamePlayer:get_user_id() 
                        end
                    end
                end
                
                local clan = self:GetPlayerClan(playerName) -- CHANGED: Get clan instead of team
                self:AddPlayer(playerName, clan, status, userId)
            end
        end
    end
    
    if previousSelection then
        for _, player in ipairs(self.players) do
            if player.name == previousSelection then
                self.selectedPlayerName = previousSelection
                break
            end
        end
    end
    
    if not self.selectedPlayerName and localPlayerAdded then
        self.selectedPlayerName = localPlayerAdded.name
    end
end

function Button:new(text, callback)
    local button = Element.new(self, 0, 0, 100, 25)
    button.text = text or "Button"
    button.callback = callback or function() end
    return button
end

function Button:GetTheme()
    local current = self
    while current and current.parent do
        current = current.parent
        if current and current.theme then
            return current.theme
        end
    end
    return Library.Theme.List[Library.Theme.Selected]
end

function Button:Render()
    if not self.visible then return end
    
    local x, y = self:GetAbsolutePos()
    local theme = self:GetTheme()
    
    local bgColor = theme.Mid
    if self.pressed then
        bgColor = theme.Dark
    elseif self.hovered then
        bgColor = theme.Light
    end
    
    Drawing:Rect(x, y, self.width, self.height, bgColor, true, 2)
    Drawing:Rect(x, y, self.width, self.height, theme.Outer, false, 2)
    
    local textWidth, textHeight = render.measure_text(2, true, self.text)
    local textX = x + (self.width - textWidth) / 2
    local textY = y + (self.height - textHeight) / 2
    Drawing:Text(textX, textY, self.text, 2, true, theme.Text)
end

function Button:OnClick()
    if self.callback then
        self.callback()
    end
end

function Button:HandleInput()
    if not self.visible or not self.enabled then return end
    if IsElementBehindPopup(self) then return end
    if not self:IsInActiveTab() then return end 
    if not self:CanInteract() then return end
    
    Element.HandleInput(self)
    
    if self.clicked then
        self:RegisterInteraction()
    end
end

function Slider:new(text, min, max, defaultValue, callback, flag)
    local slider = Element.new(self, 0, 0, 100, 35)
    slider.text = text or "Slider"
    slider.min = min or 0
    slider.max = max or 100
    slider.value = defaultValue or min or 0
    slider.callback = callback or function() end
    slider.dragging = false
    slider.animatedValue = slider.value
    slider.flag = flag
    
    if flag and not Library.Flags[flag] then
        Library.Flags[flag] = slider
    end
    
    return slider
end

function Slider:GetTheme()
    local current = self
    while current and current.parent do
        current = current.parent
        if current and current.theme then
            return current.theme
        end
    end
    return Library.Theme.List[Library.Theme.Selected]
end

function Slider:Set(value)
    self.value = math.max(self.min, math.min(self.max, value))
    if self.callback then
        self.callback(self.value)
    end
end

function Slider:Render()
    if not self.visible then return end
    
    local x, y = self:GetAbsolutePos()
    local theme = self:GetTheme()
    
    if Library.Settings.Tween then
        self.animatedValue = Tween.animateValue("slider_" .. tostring(self), self.animatedValue, self.value, 0.2)
    else
        self.animatedValue = self.value
    end
    
    Drawing:Text(x, y, self.text, 2, true, theme.Text)
    
    local trackY = y + 18
    local trackHeight = 12
    
    Drawing:Rect(x, trackY, self.width, trackHeight, theme.Outer, false, 1)
    Drawing:Rect(x + 1, trackY + 1, self.width - 2, trackHeight - 2, theme.Dark, true, 0)
    
    local percent = (self.animatedValue - self.min) / (self.max - self.min)
    local fillWidth = (self.width - 2) * percent
    Drawing:Rect(x + 1, trackY + 1, fillWidth, trackHeight - 2, theme.Accent, true, 0)

    local fillWidth = (self.width - 2) * percent
    if fillWidth > 0 then
        Drawing:Gradient(
            x + 1, 
            trackY + 1, 
            fillWidth, 
            trackHeight - 2,
            theme.Accent,   
            theme.AccentLight, 
            true               
        )
    end
    
    local valueText = string.format("%.1f", self.value)
    local textWidth, textHeight = render.measure_text(2, true, valueText)
    local textX = x + (self.width - textWidth) / 2
    local textY = trackY + (trackHeight - textHeight) / 2
    Drawing:Text(textX, textY, valueText, 2, true, theme.Text)
end

function Slider:HandleInput()
    if not self.visible or not self.enabled then return end
    if IsElementBehindPopup(self) then return end
    if not self:IsInActiveTab() then return end 
    if not self:CanInteract() then return end
    
    Element.HandleInput(self)
    
    local x, y = self:GetAbsolutePos()
    local trackY = y + 18
    local trackBounds = IsMouseInBounds(x, trackY, self.width, 12)
    
    if trackBounds and (InputState.mousePressed or self.dragging) then
        self.dragging = true
        local mouseX, mouseY = input.cursor_position()
        local percent = math.max(0, math.min(1, (mouseX - x) / self.width))
        local newValue = self.min + (self.max - self.min) * percent
        
        if math.abs(newValue - self.value) > 0.01 then
            self.value = newValue
            if self.callback then
                self.callback(self.value)
            end
            self:RegisterInteraction()
        end
    elseif not InputState.mousePressed then 
        self.dragging = false
    end



end

function Dropdown:new(text, options, callback, defaultValue, flag)
    local dropdown = Element.new(self, 0, 0, 100, 25)
    dropdown.text = text or "Dropdown"
    dropdown.options = options or {}
    dropdown.callback = callback or function() end
    dropdown.value = defaultValue or (options and options[1]) or nil
    dropdown.open = false
    dropdown.optionHeight = 20
    dropdown.flag = flag
    
    if flag and not Library.Flags[flag] then
        Library.Flags[flag] = dropdown
    end
    
    return dropdown
end

function Dropdown:GetTheme()
    local current = self
    while current and current.parent do
        current = current.parent
        if current and current.theme then
            return current.theme
        end
    end
    return Library.Theme.List[Library.Theme.Selected]
end

function Dropdown:Set(value)
    self.value = value
    if self.callback then
        self.callback(value)
    end
end

function Dropdown:Render()
    if not self.visible then return end
    
    local x, y = self:GetAbsolutePos()
    local theme = self:GetTheme()
    
    local bgColor = self.open and theme.Light or theme.Mid
    Drawing:Rect(x, y, self.width, self.height, bgColor, true, 2)
    Drawing:Rect(x, y, self.width, self.height, theme.Outer, false, 2)
    
    local displayText = self.value or self.text
    Drawing:Text(x + 5, y + 5, displayText, 2, true, theme.Text)
    
    local arrowSize = 6
    local arrowX = x + self.width - 15
    local arrowY = y + (self.height - arrowSize) / 2
    Drawing:Line(arrowX, arrowY, arrowX + arrowSize, arrowY, theme.Text, 1)
    Drawing:Line(arrowX + arrowSize, arrowY, arrowX + arrowSize/2, arrowY + arrowSize, theme.Text, 1)
end

function Dropdown:RenderPopup()
    if not self.open then return end
    
    local x, y = self:GetAbsolutePos()
    local theme = self:GetTheme()
    
    local optionsHeight = #self.options * self.optionHeight
    Drawing:Rect(x, y + self.height, self.width, optionsHeight, theme.Dark, true, 0)
    Drawing:Rect(x, y + self.height, self.width, optionsHeight, theme.Outer, false, 0)
    
    for i, option in ipairs(self.options) do
        local optionY = y + self.height + (i-1) * self.optionHeight
        local optionColor = theme.Text
        local bgColor = theme.Dark
        
        if IsMouseInBounds(x, optionY, self.width, self.optionHeight) then
            bgColor = theme.Mid
            optionColor = theme.Accent
        end
        
        Drawing:Rect(x, optionY, self.width, self.optionHeight, bgColor, true, 0)
        Drawing:Text(x + 5, optionY + 3, option, 2, true, optionColor)
    end
end

function Dropdown:HandleInput()
    if not self.visible or not self.enabled then return end
    if IsElementBehindPopup(self) and not self.open then return end
    if not self:IsInActiveTab() and not self.open then return end 
    if not self:CanInteract() then return end
    
    Element.HandleInput(self)
    local x, y = self:GetAbsolutePos()
    
    if self.clicked then
        self.open = not self.open
        if self.open then
            Library.OpenDropdown = self
            RegisterPopup(self)
        else
            Library.OpenDropdown = nil
            UnregisterPopup(self)
        end
        BringToFront(self)
        self:RegisterInteraction()
    end
    
    if self.open and InputState.mouseClicked then
        for i, option in ipairs(self.options) do
            local optionY = y + self.height + (i-1) * self.optionHeight
            if IsMouseInBounds(x, optionY, self.width, self.optionHeight) then
                self.value = option
                self.open = false
                Library.OpenDropdown = nil
                UnregisterPopup(self)
                if self.callback then
                    self.callback(option)
                end
                self:RegisterInteraction()
                break
            end
        end
    end
end

function MultiSelectDropdown:new(text, options, callback, defaultSelected, flag)
    local dropdown = Element.new(self, 0, 0, 100, 25)
    dropdown.text = text or "Multi-Select"
    dropdown.options = options or {}  -- Ensure this is always a table
    dropdown.callback = callback or function() end
    dropdown.selectedOptions = {}
    dropdown.open = false
    dropdown.optionHeight = 22
    dropdown.maxVisible = 8
    dropdown.scrollOffset = 0
    dropdown.flag = flag
    dropdown.selectAllMode = false
    dropdown.scrollbarDragging = false -- NEW: For scrollbar dragging
    dropdown.scrollbarDragOffset = 0 -- NEW: For scrollbar dragging
    
    -- Initialize options as empty table if nil
    if not dropdown.options then
        dropdown.options = {}
    end
    
    -- Set default selected options
    if defaultSelected and type(defaultSelected) == "table" then
        for _, option in ipairs(defaultSelected) do
            if self:HasOption(dropdown, option) then
                dropdown.selectedOptions[option] = true
            end
        end
    end
    
    if flag and not Library.Flags[flag] then
        Library.Flags[flag] = dropdown
    end
    
    return dropdown
end

function MultiSelectDropdown:HasOption(option)
    -- Check if options table exists and is valid
    if not self.options or type(self.options) ~= "table" then
        return false
    end
    
    for _, opt in ipairs(self.options) do
        if opt == option then
            return true
        end
    end
    return false
end

function MultiSelectDropdown:GetTheme()
    local current = self
    while current and current.parent do
        current = current.parent
        if current and current.theme then
            return current.theme
        end
    end
    return Library.Theme.List[Library.Theme.Selected]
end

function MultiSelectDropdown:Set(selectedOptions)
    self.selectedOptions = {}
    if type(selectedOptions) == "table" then
        for _, option in ipairs(selectedOptions) do
            if self:HasOption(option) then
                self.selectedOptions[option] = true
            end
        end
    end
    
    if self.callback then
        self.callback(self:GetSelected())
    end
end

function MultiSelectDropdown:GetSelected()
    local selected = {}
    for option, isSelected in pairs(self.selectedOptions) do
        if isSelected then
            table.insert(selected, option)
        end
    end
    return selected
end

function MultiSelectDropdown:GetSelectedCount()
    local count = 0
    for _, isSelected in pairs(self.selectedOptions) do
        if isSelected then
            count = count + 1
        end
    end
    return count
end

function MultiSelectDropdown:IsSelected(option)
    return self.selectedOptions[option] == true
end

function MultiSelectDropdown:Toggle(option)
    if self:HasOption(option) then
        self.selectedOptions[option] = not self.selectedOptions[option]
        if self.callback then
            self.callback(self:GetSelected())
        end
    end
end

function MultiSelectDropdown:SelectAll()
    for _, option in ipairs(self.options) do
        self.selectedOptions[option] = true
    end
    if self.callback then
        self.callback(self:GetSelected())
    end
end

function MultiSelectDropdown:DeselectAll()
    self.selectedOptions = {}
    if self.callback then
        self.callback(self:GetSelected())
    end
end

function MultiSelectDropdown:Render()
    if not self.visible then return end
    
    local x, y = self:GetAbsolutePos()
    local theme = self:GetTheme()
    
    -- Main dropdown box
    local bgColor = self.open and theme.Light or theme.Mid
    Drawing:Rect(x, y, self.width, self.height, bgColor, true, 2)
    Drawing:Rect(x, y, self.width, self.height, theme.Outer, false, 2)
    
    -- Display text
    local selectedCount = self:GetSelectedCount()
    local displayText = self.text
    
    if selectedCount == 0 then
        displayText = self.text .. " (None)"
    elseif selectedCount == 1 then
        -- Show the single selected item
        for option, isSelected in pairs(self.selectedOptions) do
            if isSelected then
                displayText = option
                break
            end
        end
    else
        displayText = self.text .. " (" .. selectedCount .. " selected)"
    end
    
    -- Truncate text if too long
    local availableWidth = self.width - 25 -- Account for arrow
    local textWidth = render.measure_text(2, true, displayText)
    if textWidth > availableWidth then
        local charWidth = textWidth / #displayText
        local maxChars = math.floor(availableWidth / charWidth) - 3
        if maxChars > 0 then
            displayText = string.sub(displayText, 1, maxChars) .. "..."
        end
    end
    
    Drawing:Text(x + 5, y + 5, displayText, 2, true, theme.Text)
    
    -- Arrow indicator
    local arrowSize = 6
    local arrowX = x + self.width - 15
    local arrowY = y + (self.height - arrowSize) / 2
    
    if self.open then
        -- Up arrow when open
        Drawing:Line(arrowX, arrowY + arrowSize, arrowX + arrowSize, arrowY + arrowSize, theme.Text, 1)
        Drawing:Line(arrowX + arrowSize, arrowY + arrowSize, arrowX + arrowSize/2, arrowY, theme.Text, 1)
    else
        -- Down arrow when closed
        Drawing:Line(arrowX, arrowY, arrowX + arrowSize, arrowY, theme.Text, 1)
        Drawing:Line(arrowX + arrowSize, arrowY, arrowX + arrowSize/2, arrowY + arrowSize, theme.Text, 1)
    end
end

function MultiSelectDropdown:RenderPopup()
    if not self.open then return end
    
    local x, y = self:GetAbsolutePos()
    local theme = self:GetTheme()
    
    -- Calculate popup dimensions
    local visibleOptions = math.min(#self.options + 1, self.maxVisible + 1) -- +1 for select all button
    local popupHeight = visibleOptions * self.optionHeight
    local popupY = y + self.height
    
    -- Adjust popup position if it goes off screen
    local screenWidth, screenHeight = cheat.get_window_size()
    if popupY + popupHeight > screenHeight - 20 then
        popupY = y - popupHeight
    end
    
    -- Main popup background
    Drawing:Rect(x, popupY, self.width, popupHeight, theme.Dark, true, 2)
    Drawing:Rect(x, popupY, self.width, popupHeight, theme.Outer, false, 2)
    
    local currentY = popupY
    
    -- Select All / Deselect All button
    local selectAllText = self.selectAllMode and "Deselect All" or "Select All"
    local selectAllHovered = IsMouseInBounds(x, currentY, self.width, self.optionHeight)
    local selectAllBg = selectAllHovered and theme.Mid or theme.Dark
    
    Drawing:Rect(x, currentY, self.width, self.optionHeight, selectAllBg, true, 0)
    Drawing:Text(x + 5, currentY + 4, selectAllText, 2, true, theme.Accent)
    
    -- Separator line
    Drawing:Line(x + 2, currentY + self.optionHeight, x + self.width - 2, currentY + self.optionHeight, theme.Outer, 1)
    currentY = currentY + self.optionHeight
    
    -- Store bounds for click detection
    self.selectAllBounds = {x = x, y = popupY, width = self.width, height = self.optionHeight}
    self.optionBounds = {}
    
    -- Render options
    for i = 1, math.min(#self.options, self.maxVisible) do
        local optionIndex = i + self.scrollOffset
        local option = self.options[optionIndex]
        
        if option then
            local isSelected = self:IsSelected(option)
            local optionHovered = IsMouseInBounds(x, currentY, self.width, self.optionHeight)
            
            local optionBg = theme.Dark
            if optionHovered then
                optionBg = theme.Mid
            end
            
            Drawing:Rect(x, currentY, self.width, self.optionHeight, optionBg, true, 0)
            
            -- Checkbox
            local checkboxSize = 12
            local checkboxX = x + 5
            local checkboxY = currentY + (self.optionHeight - checkboxSize) / 2
            
            Drawing:Rect(checkboxX, checkboxY, checkboxSize, checkboxSize, theme.Outer, false, 1)
            Drawing:Rect(checkboxX + 1, checkboxY + 1, checkboxSize - 2, checkboxSize - 2, theme.High, true, 0)
            
            if isSelected then
                Drawing:Rect(checkboxX + 3, checkboxY + 3, checkboxSize - 6, checkboxSize - 6, theme.Accent, true, 0)
            end
            
            -- Option text
            local textColor = isSelected and theme.Accent or theme.Text
            Drawing:Text(checkboxX + checkboxSize + 8, currentY + 4, option, 2, true, textColor)
            
            -- Store bounds for click detection
            table.insert(self.optionBounds, {
                x = x, 
                y = currentY, 
                width = self.width, 
                height = self.optionHeight, 
                option = option,
                index = optionIndex
            })
            
            currentY = currentY + self.optionHeight
        end
    end
    
    -- FIXED: Scrollbar with dragging capability
    if #self.options > self.maxVisible then
        local scrollbarX = x + self.width - 8
        local scrollbarY = popupY + self.optionHeight -- Start after select all button
        local scrollbarHeight = self.maxVisible * self.optionHeight
        
        Drawing:Rect(scrollbarX, scrollbarY, 6, scrollbarHeight, theme.Mid, true, 0)
        
        local thumbHeight = math.max(20, scrollbarHeight * (self.maxVisible / #self.options))
        local maxScroll = #self.options - self.maxVisible
        local thumbY = scrollbarY + (scrollbarHeight - thumbHeight) * (self.scrollOffset / maxScroll)
        
        Drawing:Rect(scrollbarX, thumbY, 6, thumbHeight, theme.Accent, true, 0)
        
        -- Store scrollbar bounds
        self.scrollbarBounds = {
            x = scrollbarX,
            y = scrollbarY,
            width = 6,
            height = scrollbarHeight,
            thumbY = thumbY,
            thumbHeight = thumbHeight,
            maxScroll = maxScroll
        }
    else
        self.scrollbarBounds = nil
    end
end

-- FIXED: Handle scrollbar dragging in multi-select dropdown
function MultiSelectDropdown:HandleInput()
    if not self.visible or not self.enabled then return end
    if IsElementBehindPopup(self) and not self.open then return end
    if not self:IsInActiveTab() and not self.open then return end
    if not self:CanInteract() then return end
    
    Element.HandleInput(self)
    
    -- Toggle dropdown open/close
    if self.clicked then
        self.open = not self.open
        if self.open then
            Library.OpenDropdown = self
            RegisterPopup(self)
        else
            Library.OpenDropdown = nil
            UnregisterPopup(self)
        end
        BringToFront(self)
        self:RegisterInteraction()
    end
    
    -- Handle popup interactions
    if self.open then
        -- FIXED: Handle scrollbar dragging
        if self.scrollbarBounds and #self.options > self.maxVisible then
            local mouseX, mouseY = input.cursor_position()
            
            if InputState.mouseClicked then
                if IsMouseInBounds(self.scrollbarBounds.x, self.scrollbarBounds.thumbY,
                                 self.scrollbarBounds.width, self.scrollbarBounds.thumbHeight) then
                    self.scrollbarDragging = true
                    self.scrollbarDragOffset = mouseY - self.scrollbarBounds.thumbY
                end
            end
            
            if self.scrollbarDragging then
                if InputState.mousePressed then
                    local newThumbY = mouseY - self.scrollbarDragOffset
                    local minThumbY = self.scrollbarBounds.y
                    local maxThumbY = self.scrollbarBounds.y + self.scrollbarBounds.height - self.scrollbarBounds.thumbHeight
                    
                    newThumbY = math.max(minThumbY, math.min(maxThumbY, newThumbY))
                    
                    local thumbProgress = (newThumbY - minThumbY) / (maxThumbY - minThumbY)
                    self.scrollOffset = math.floor(thumbProgress * self.scrollbarBounds.maxScroll)
                    self.scrollOffset = math.max(0, math.min(self.scrollbarBounds.maxScroll, self.scrollOffset))
                else
                    self.scrollbarDragging = false
                end
            end
        end
        
        if InputState.mouseClicked and not self.scrollbarDragging then
            -- Check select all button
            if self.selectAllBounds and IsMouseInBounds(
                self.selectAllBounds.x, self.selectAllBounds.y, 
                self.selectAllBounds.width, self.selectAllBounds.height) then
                
                if self.selectAllMode then
                    self:DeselectAll()
                    self.selectAllMode = false
                else
                    self:SelectAll()
                    self.selectAllMode = true
                end
                self:RegisterInteraction()
            end
            
            -- Check option clicks
            if self.optionBounds and #self.optionBounds > 0 then
                for _, bounds in ipairs(self.optionBounds) do
                    if IsMouseInBounds(bounds.x, bounds.y, bounds.width, bounds.height) then
                        self:Toggle(bounds.option)
                        
                        -- Update select all mode based on current selection
                        local selectedCount = self:GetSelectedCount()
                        self.selectAllMode = selectedCount == #self.options
                        
                        self:RegisterInteraction()
                        break
                    end
                end
            end
                
            -- Check if clicked outside to close
            local x, y = self:GetAbsolutePos()
            local popupHeight = math.min(#self.options + 1, self.maxVisible + 1) * self.optionHeight
            local popupY = y + self.height
            
            if not IsMouseInBounds(x, popupY, self.width, popupHeight) and 
               not IsMouseInBounds(x, y, self.width, self.height) then
                self.open = false
                Library.OpenDropdown = nil
                UnregisterPopup(self)
            end
        end
        
        -- Handle scrolling when popup is open (only if not dragging scrollbar)
        if not self.scrollbarDragging and #self.options > self.maxVisible then
            local x, y = self:GetAbsolutePos()
            local popupY = y + self.height
            local popupHeight = self.maxVisible * self.optionHeight
            
            if IsMouseInBounds(x, popupY + self.optionHeight, self.width, popupHeight) then
                if utility.key_state(0x26) then -- Up arrow
                    self.scrollOffset = math.max(0, self.scrollOffset - 1)
                elseif utility.key_state(0x28) then -- Down arrow
                    self.scrollOffset = math.min(#self.options - self.maxVisible, self.scrollOffset + 1)
                end
            end
        end
    end
end

function Section:AddMultiSelectDropdown(text, options, callback, defaultSelected, flag)
    local multiSelect = MultiSelectDropdown:new(text, options, callback, defaultSelected, flag)
    return self:AddElement(multiSelect)
end

function MultiSection:AddMultiSelectDropdown(text, options, callback, defaultSelected, flag, pageIndex)
    local multiSelect = MultiSelectDropdown:new(text, options, callback, defaultSelected, flag)
    return self:AddElement(multiSelect, pageIndex)
end

function ColorPicker:new(text, callback, defaultColor)
    local picker = Element.new(self, 0, 0, 25, 10)
    picker.text = text or "Color Picker"
    picker.callback = callback or function() end
    picker.color = defaultColor or {255, 255, 255, 255}
    picker.open = false
    picker.pickerWidth = 200
    picker.pickerHeight = 180
    picker.hue = 0
    picker.saturation = 1
    picker.value = 1
    return picker
end

function ColorPicker:Set(color)
    if type(color) == "table" and #color >= 3 then
        self.color = {
            color[1] or 255,
            color[2] or 255,
            color[3] or 255,
            color[4] or 255
        }
        
        local r, g, b = self.color[1] / 255, self.color[2] / 255, self.color[3] / 255
        local max, min = math.max(r, g, b), math.min(r, g, b)
        local delta = max - min
        
        if delta == 0 then
            self.hue = 0
        elseif max == r then
            self.hue = ((g - b) / delta) % 6
        elseif max == g then
            self.hue = (b - r) / delta + 2
        else
            self.hue = (r - g) / delta + 4
        end
        self.hue = self.hue * 60
        
        self.saturation = max == 0 and 0 or delta / max
        self.value = max
        
        if self.callback then
            self.callback(self.color)
        end
    end
end

function ColorPicker:HSVtoRGB(h, s, v)
    local c = v * s
    local x = c * (1 - math.abs((h / 60) % 2 - 1))
    local m = v - c
    
    local r, g, b
    if h < 60 then
        r, g, b = c, x, 0
    elseif h < 120 then
        r, g, b = x, c, 0
    elseif h < 180 then
        r, g, b = 0, c, x
    elseif h < 240 then
        r, g, b = 0, x, c
    elseif h < 300 then
        r, g, b = x, 0, c
    else
        r, g, b = c, 0, x
    end
    
    return (r + m) * 255, (g + m) * 255, (b + m) * 255
end

function ColorPicker:Render()
    if not self.visible then return end
    
    local x, y = self:GetAbsolutePos()
    local theme = self.parent.parent.parent.theme
    
    local previewSize = 15
    Drawing:Rect(x, y+2, previewSize, self.height, self.color, true, 2)
    Drawing:Rect(x, y+2, previewSize, self.height, theme.Outer, false, 2)
    
    Drawing:Text(x + previewSize + 5, y, self.text, 2, true, theme.Text)
end

function ColorPicker:RenderPopup()
    if not self.open then return end
    
    local x, y = self:GetAbsolutePos()
    local theme = self.parent.parent.parent.theme
    
    local pickerX = x + 25
    local pickerY = y + self.height + 5
    
    Drawing:Rect(pickerX, pickerY, self.pickerWidth, self.pickerHeight, theme.Dark, true, 2)
    Drawing:Rect(pickerX, pickerY, self.pickerWidth, self.pickerHeight, theme.Outer, false, 2)
    
    local hueBarX = pickerX + 5
    local hueBarY = pickerY + 5
    local hueBarWidth = 20
    local hueBarHeight = 120
    
    for i = 0, hueBarHeight do
        local hue = (i / hueBarHeight) * 360
        local r, g, b = self:HSVtoRGB(hue, 1, 1)
        render.rect(hueBarX, hueBarY + i, hueBarWidth, 1, r, g, b, 255)
    end
    
    local hueY = hueBarY + (self.hue / 360) * hueBarHeight
    Drawing:Rect(hueBarX - 2, hueY - 2, hueBarWidth + 4, 4, theme.Text, false, 0)
    
    local svAreaX = hueBarX + hueBarWidth + 10
    local svAreaY = hueBarY
    local svAreaWidth = 120
    local svAreaHeight = 120
    
    for i = 0, svAreaWidth do
        for j = 0, svAreaHeight do
            local s = i / svAreaWidth
            local v = 1 - (j / svAreaHeight)
            local r, g, b = self:HSVtoRGB(self.hue, s, v)
            render.rect(svAreaX + i, svAreaY + j, 1, 1, r, g, b, 255)
        end
    end
    
    local svX = svAreaX + self.saturation * svAreaWidth
    local svY = svAreaY + (1 - self.value) * svAreaHeight
    Drawing:Rect(svX - 3, svY - 3, 6, 6, theme.Text, false, 0)
    Drawing:Rect(svX - 2, svY - 2, 4, 4, {0, 0, 0, 255}, false, 0)
    
    local alphaX = pickerX + 5
    local alphaY = pickerY + 135
    local alphaWidth = self.pickerWidth - 10
    local alphaHeight = 15
    
    for i = 0, alphaWidth, 8 do
        for j = 0, alphaHeight, 8 do
            local color = ((i / 8) + (j / 8)) % 2 == 0 and 200 or 100
            render.rect(alphaX + i, alphaY + j, math.min(8, alphaWidth - i), math.min(8, alphaHeight - j), color, color, color, 255)
        end
    end
    
    for i = 0, alphaWidth do
        local alpha = i / alphaWidth
        render.rect(alphaX + i, alphaY, 1, alphaHeight, self.color[1], self.color[2], self.color[3], alpha * 255)
    end
    
    Drawing:Rect(alphaX, alphaY, alphaWidth, alphaHeight, theme.Outer, false, 0)
    
    local alphaHandleX = alphaX + (self.color[4] / 255) * alphaWidth
    Drawing:Rect(alphaHandleX - 2, alphaY - 2, 4, alphaHeight + 4, theme.Text, false, 0)
    
    local previewX = pickerX + 5
    local previewY = pickerY + 155
    Drawing:Rect(previewX, previewY, 40, 20, self.color, true, 0)
    Drawing:Rect(previewX, previewY, 40, 20, theme.Outer, false, 0)
end

function ColorPicker:HandleInput()
    if not self.visible or not self.enabled then return end
    if IsElementBehindPopup(self) and not self.open then return end
    if not self:CanInteract() then return end
    
    Element.HandleInput(self)
    local x, y = self:GetAbsolutePos()
    
    if self.clicked then
        self.open = not self.open
        if self.open then
            Library.OpenColorPicker = self
            RegisterPopup(self)
        else
            Library.OpenColorPicker = nil
            UnregisterPopup(self)
        end
        BringToFront(self)
        self:RegisterInteraction()
    end
    
    if self.open and InputState.mousePressed then
        local pickerX = x + 25
        local pickerY = y + self.height + 5
        
        local hueBarX = pickerX + 5
        local hueBarY = pickerY + 5
        local hueBarWidth = 20
        local hueBarHeight = 120
        
        local svAreaX = hueBarX + hueBarWidth + 10
        local svAreaY = hueBarY
        local svAreaWidth = 120
        local svAreaHeight = 120
        
        local alphaX = pickerX + 5
        local alphaY = pickerY + 135
        local alphaWidth = self.pickerWidth - 10
        
        local mouseX, mouseY = input.cursor_position()
        
        if IsMouseInBounds(hueBarX, hueBarY, hueBarWidth, hueBarHeight) then
            local relY = math.max(0, math.min(1, (mouseY - hueBarY) / hueBarHeight))
            self.hue = relY * 360
            
            local r, g, b = self:HSVtoRGB(self.hue, self.saturation, self.value)
            self.color[1] = r
            self.color[2] = g
            self.color[3] = b
            
            if self.callback then
                self.callback(self.color)
            end
            self:RegisterInteraction()
        end
        
        if IsMouseInBounds(svAreaX, svAreaY, svAreaWidth, svAreaHeight) then
            local relX = math.max(0, math.min(1, (mouseX - svAreaX) / svAreaWidth))
            local relY = math.max(0, math.min(1, (mouseY - svAreaY) / svAreaHeight))
            
            self.saturation = relX
            self.value = 1 - relY
            
            local r, g, b = self:HSVtoRGB(self.hue, self.saturation, self.value)
            self.color[1] = r
            self.color[2] = g
            self.color[3] = b
            
            if self.callback then
                self.callback(self.color)
            end
            self:RegisterInteraction()
        end
        
        if IsMouseInBounds(alphaX, alphaY, alphaWidth, 15) then
            local relX = math.max(0, math.min(1, (mouseX - alphaX) / alphaWidth))
            self.color[4] = relX * 255
            
            if self.callback then
                self.callback(self.color)
            end
            self:RegisterInteraction()
        end
    end
end

function Window:new(title, x, y, width, height)
    local window = Element.new(self, x or 100, y or 100, width or 500, height or 400)
    window.title = title or "Melatonin UI"
    window.dragging = false
    window.dragOffset = {0, 0}
    window.targetX = x or 100
    window.targetY = y or 100
    window.tabs = {}
    window.currentTab = nil
    window.headerHeight = 25
    window.theme = Library.Theme.List[Library.Theme.Selected]
    window.tabHeight = 25
    return window
end

function Window:Render()
    if not self.visible then return end
    
    if Library.Settings.Tween then
        self.x = Tween.animateValue("window_x_" .. tostring(self), self.x, self.targetX)
        self.y = Tween.animateValue("window_y_" .. tostring(self), self.y, self.targetY)
    end
    
    local x, y = self:GetAbsolutePos()
    local theme = self.theme
    
    Drawing:Rect(x, y, self.width, self.height, theme.Dark, true, 4)
    Drawing:Rect(x, y, self.width, self.height, theme.Accent, false, 4)
    
    Drawing:Rect(x + 1, y + 1, self.width - 2, self.headerHeight, theme.Light, true, 0)
    Drawing:Gradient(x + 1, y + 1, self.width - 2, self.headerHeight, theme.Light, theme.Mid, true)
    
    Drawing:Text(x + 8, y + 6, self.title, 2, true, theme.Header)
    
    local tabY = y + self.headerHeight + 1
    
    if #self.tabs > 0 then
        local tabWidth = math.floor((self.width - 4) / #self.tabs)
        
        for i, tab in ipairs(self.tabs) do
            local tabX = x + 2 + (i - 1) * tabWidth
            local isActive = tab == self.currentTab
            
            local tabColor = isActive and theme.High or theme.Mid
            Drawing:Rect(tabX, tabY, tabWidth, self.tabHeight, tabColor, true, 0)
            Drawing:Rect(tabX, tabY, tabWidth, self.tabHeight, theme.Outer, false, 0)
            
            local textWidth, textHeight = render.measure_text(2, true, tab.name)
            local textX = tabX + (tabWidth - textWidth) / 2
            local textY = tabY + (self.tabHeight - textHeight) / 2
            Drawing:Text(textX, textY, tab.name, 2, true, theme.Text)
            
            tab.clickX = tabX
            tab.clickY = tabY
            tab.clickWidth = tabWidth
            tab.clickHeight = self.tabHeight
        end
    end
    
    local contentY = tabY + self.tabHeight + 2
    local contentHeight = self.height - self.headerHeight - self.tabHeight - 6
    
    Drawing:Rect(x + 2, contentY, self.width - 4, contentHeight, theme.High, true, 0)
    Drawing:Rect(x + 2, contentY, self.width - 4, contentHeight, theme.Outer, false, 0)
    
    if self.currentTab then
        self.currentTab:Render()
    end
end

function Window:HandleInput()
    if not self.visible then return end
    if not self:CanInteract() then return end
    
    Element.HandleInput(self)
    
    if InputState.mouseClicked and not IsPopupActive() then
        for i, tab in ipairs(self.tabs) do
            if tab.clickX and IsMouseInBounds(tab.clickX, tab.clickY, tab.clickWidth, tab.clickHeight) then
                self:SetCurrentTab(i)
                self:RegisterInteraction()
                break
            end
        end
    end
    
    local mouseX, mouseY = input.cursor_position()
    local headerArea = IsMouseInBounds(self.x, self.y, self.width, self.headerHeight)
    
    if headerArea and InputState.mousePressed and not self.dragging and not IsPopupActive() then
        self.dragging = true
        self.dragOffset[1] = mouseX - self.x
        self.dragOffset[2] = mouseY - self.y
    elseif not InputState.mousePressed then
        self.dragging = false
    end
    
    if self.dragging then
        self.targetX = mouseX - self.dragOffset[1]
        self.targetY = mouseY - self.dragOffset[2]
        
        if not Library.Settings.Tween then
            self.x = self.targetX
            self.y = self.targetY
        end
    end
    
    if self.currentTab and not self.dragging then
        self.currentTab:HandleInput()
    end
end

function Window:AddTab(name)
    local tab = Tab:new(name, self)
    table.insert(self.tabs, tab)
    
    if not self.currentTab then
        self.currentTab = tab
    end
    
    return tab
end

function Window:SetCurrentTab(index)
    if self.tabs[index] then
        self.currentTab = self.tabs[index]
    end
end

function Tab:new(name, parent)
    local tab = Element.new(self, 0, 0, 0, 0)
    tab.name = name
    tab.parent = parent
    tab.sections = {}
    return tab
end

function Tab:Render()
    if not self.visible then return end
    for _, section in ipairs(self.sections) do
        if section and section.Render then
            section:Render()
        end
    end
end

function Tab:HandleInput()
    for _, section in ipairs(self.sections) do
        if section and section.HandleInput then
            section:HandleInput()
        end
    end
end

function Tab:AddSection(name, x, y, width, height)
    local section = Section:new(name, self, x, y, width, height)
    table.insert(self.sections, section)
    return section
end

function Tab:AddMultiSection(name, pages, x, y, width, height)
    local multiSection = MultiSection:new(name, pages, self, x, y, width, height)
    table.insert(self.sections, multiSection)
    return multiSection
end

function Tab:AddPlayerList(name, x, y, width, height)
    local playerList = PlayerList:new(name, self, x, y, width, height)
    table.insert(self.sections, playerList)
    return playerList
end

function Tab:AddESPPreview(name, x, y, width, height)
    local espPreview = ESPPreview:new(name, self, x, y, width, height)
    table.insert(self.sections, espPreview)
    return espPreview
end

function Section:new(name, parent, x, y, width, height)
    local section = Element.new(self, x or 10, y or 60, width or 200, height or 150)
    section.name = name
    section.parent = parent
    section.elements = {}
    section.elementY = 25
    return section
end

function Section:Render()
    if not self.visible then return end
    
    local x, y = self:GetAbsolutePos()
    local theme = Library.Theme.List[Library.Theme.Selected]
    
    if self.parent and self.parent.parent and self.parent.parent.theme then
        theme = self.parent.parent.theme
    end
    
    Drawing:Rect(x, y, self.width, self.height, theme.Mid, true, 2)
    Drawing:Rect(x, y, self.width, self.height, theme.Outer, false, 2)
    
    Drawing:Rect(x + 1, y + 1, self.width - 2, 20, theme.Light, true, 0)
    Drawing:Text(x + 5, y + 4, self.name, 2, true, theme.Header)
    
    for _, element in ipairs(self.elements) do
        if element and element.Render then
            element:Render()
        end
    end
end

function Section:HandleInput()
    for _, element in ipairs(self.elements) do
        if element and element.HandleInput then
            element:HandleInput()
        end
    end
end

function Section:AddElement(element)
    element.parent = self
    element.x = 5
    element.y = self.elementY
    element.width = self.width - 10
    
    table.insert(self.elements, element)
    self.elementY = self.elementY + element.height + 5
    
    return element
end

function MultiSection:new(name, pages, parent, x, y, width, height)
    local multiSection = Section.new(self, name, parent, x, y, width, height)
    multiSection.pages = {}
    multiSection.currentPage = 1
    multiSection.pageHeight = 22
    
    for i, pageName in ipairs(pages) do
        multiSection.pages[i] = {
            name = pageName,
            elements = {},
            elementY = 25 + multiSection.pageHeight + 5
        }
    end
    
    return multiSection
end

function MultiSection:Render()
    if not self.visible then return end
    
    local x, y = self:GetAbsolutePos()
    local theme = self.parent.parent.theme
    
    Drawing:Rect(x, y, self.width, self.height, theme.Mid, true, 2)
    Drawing:Rect(x, y, self.width, self.height, theme.Outer, false, 2)
    
    Drawing:Rect(x + 1, y + 1, self.width - 2, 20, theme.Light, true, 0)
    Drawing:Text(x + 5, y + 4, self.name, 2, true, theme.Header)
    
    if #self.pages > 0 then
        local tabWidth = math.floor((self.width - 4) / #self.pages)
        local tabY = y + 22
        
        for i, page in ipairs(self.pages) do
            local tabX = x + 2 + (i - 1) * tabWidth
            local isActive = i == self.currentPage
            
            local tabColor = isActive and theme.High or theme.Dark
            Drawing:Rect(tabX, tabY, tabWidth, self.pageHeight, tabColor, true, 0)
            Drawing:Rect(tabX, tabY, tabWidth, self.pageHeight, theme.Outer, false, 0)
            
            local textWidth, textHeight = render.measure_text(1, true, page.name)
            local textX = tabX + (tabWidth - textWidth) / 2
            local textY = tabY + (self.pageHeight - textHeight) / 2
            Drawing:Text(textX, textY, page.name, 1, true, theme.Text)
            
            page.clickX = tabX
            page.clickY = tabY
            page.clickWidth = tabWidth
            page.clickHeight = self.pageHeight
        end
    end
    
    if self.pages[self.currentPage] then
        for _, element in ipairs(self.pages[self.currentPage].elements) do
            if element and element.Render then
                element:Render()
            end
        end
    end
end

function MultiSection:HandleInput()
    if not self:CanInteract() then return end
    
    if InputState.mouseClicked and not IsPopupActive() then
        if self:IsInActiveTab() then 
            for i, page in ipairs(self.pages) do
                if page.clickX and IsMouseInBounds(page.clickX, page.clickY, page.clickWidth, page.clickHeight) then
                    self.currentPage = i
                    self:RegisterInteraction()
                    break
                end
            end
        end
    end
    
    if self.pages[self.currentPage] then
        for _, element in ipairs(self.pages[self.currentPage].elements) do
            if element and element.HandleInput then
                element:HandleInput()
            end
        end
    end
end

function MultiSection:AddElement(element, pageIndex)
    pageIndex = pageIndex or self.currentPage
    
    if not self.pages[pageIndex] then return end
    
    local page = self.pages[pageIndex]
    element.parent = self
    element.pageIndex = pageIndex 
    element.x = 5
    element.y = page.elementY
    element.width = self.width - 10
    
    table.insert(page.elements, element)
    page.elementY = page.elementY + element.height + 5
    
    return element
end

function Library.Notifications:Init()
    self.List = {}
end

-- Notification object
local Notification = {}
Notification.__index = Notification

function Notification:new(title, message, type, duration)
    local notif = {
        Title = title or "Notification",
        Message = message or "",
        Type = type or "info",
        Duration = duration or Library.Notifications.Duration,
        CreatedAt = utility.get_tickcount(),
        AnimProgress = 0,
        Closing = false,
        Closed = false,
        Height = Library.Notifications.Height,
        Width = Library.Notifications.Width
    }
    setmetatable(notif, self)
    return notif
end

function Notification:Update()
    if self.Closed then return end
    
    local currentTime = utility.get_tickcount()
    local elapsed = currentTime - self.CreatedAt
    
    if self.Closing then
        self.AnimProgress = math.max(0, self.AnimProgress - Library.Notifications.AnimSpeed)
        if self.AnimProgress <= 0 then
            self.Closed = true
        end
    else
        self.AnimProgress = math.min(1, self.AnimProgress + Library.Notifications.AnimSpeed)
        
        if elapsed > self.Duration then
            self.Closing = true
        end
    end
end

local function easeOutQuad(t)
    return 1 - (1 - t) * (1 - t)
end

function Notification:Render()
    if self.Closed then return end
    
    local theme = Library.Theme.List[Library.Theme.Selected]
    local x, y = self:GetPosition()
    local alpha = math.floor(255 * self.AnimProgress)
    
    local animProgress = self.AnimProgress
    local easedProgress = easeOutQuad(animProgress)
    
    -- Apply easing to width and alpha
    local animWidth = self.Width * easedProgress
    local alpha = math.floor(255 * easedProgress)
    
    -- Draw background with eased width
    Drawing:Rect(x, y, animWidth, self.Height, theme.Dark, true, 4)
    
    -- Border
    Drawing:Rect(x, y, animWidth, self.Height, theme.Outer, false, 4)
    
    -- Accent bar based on type
    local accentColor = theme.Accent
    if self.Type == "warning" then
        accentColor = theme.Warning
    elseif self.Type == "error" then
        accentColor = theme.Error
    end
    
    Drawing:Rect(x, y, 5, self.Height, accentColor, true, 0)
    
    -- Content
    Drawing:Text(x + 15, y + 10, self.Title, 2, true, theme.Header)
    Drawing:Text(x + 15, y + 30, self.Message, 1, true, theme.Text)
    
    -- Close button
    local closeSize = 12
    local closeX = x + self.Width - closeSize - 8
    local closeY = y + 10
    local closeHovered = IsMouseInBounds(closeX, closeY, closeSize, closeSize)
    
    Drawing:Rect(closeX, closeY, closeSize, closeSize, closeHovered and theme.Accent or theme.Outer, true, 0)
    Drawing:Line(closeX + 3, closeY + 3, closeX + closeSize - 3, closeY + closeSize - 3, theme.Text, 1)
    Drawing:Line(closeX + closeSize - 3, closeY + 3, closeX + 3, closeY + closeSize - 3, theme.Text, 1)
    
    return closeHovered
end

function Notification:GetPosition()
    local screenWidth, screenHeight = cheat.get_window_size()
    local index = self:GetIndex()
    
    if Library.Notifications.Position == "top-right" then
        return screenWidth - self.Width - 20, 20 + (self.Height + Library.Notifications.Spacing) * index
    elseif Library.Notifications.Position == "top-left" then
        return 20, 20 + (self.Height + Library.Notifications.Spacing) * index
    elseif Library.Notifications.Position == "bottom-right" then
        return screenWidth - self.Width - 20, 
               screenHeight - self.Height - 20 - (self.Height + Library.Notifications.Spacing) * index
    else -- bottom-left
        return 20, screenHeight - self.Height - 20 - (self.Height + Library.Notifications.Spacing) * index
    end
end

function Notification:GetIndex()
    for i, notif in ipairs(Library.Notifications.List) do
        if notif == self then
            return i - 1
        end
    end
    return 0
end

-- Public notification functions
function Library.Notify(title, message, type, duration)
    local notif = Notification:new(title, message, type, duration)
    table.insert(Library.Notifications.List, 1, notif)
    
    -- Limit visible notifications
    if #Library.Notifications.List > Library.Notifications.MaxVisible + 2 then
        for i = Library.Notifications.MaxVisible + 2, #Library.Notifications.List do
            Library.Notifications.List[i].Closing = true
        end
    end
end

-- Add to update function
function Library.Notifications:UpdateAll()
    for i = #self.List, 1, -1 do
        local notif = self.List[i]
        notif:Update()
        
        if notif.Closed then
            table.remove(self.List, i)
        end
    end
end

-- Add to render function
function Library.Notifications:RenderAll()
    for i, notif in ipairs(self.List) do
        if i <= self.MaxVisible then
            local closeClicked = notif:Render()
            
            if closeClicked and InputState.mouseClicked then
                notif.Closing = true
            end
        end
    end
end

function Library.RefreshTheme()
    local theme = Library.Theme.List[Library.Theme.Selected]
    for _, window in ipairs(Library.Windows) do
        window.theme = theme
        -- Propagate theme to all child elements
        for _, tab in ipairs(window.tabs) do
            for _, section in ipairs(tab.sections) do
                section.theme = theme
            end
        end
    end
end

function Library.CreateWatermark(info)
    if Library.Watermark then
        -- If watermark already exists, update it
        if info.title then Library.Watermark.title = info.title end
        if info.template then Library.Watermark:SetTemplate(info.template) end
        if info.position then Library.Watermark:SetPosition(info.position) end
    else
        -- Create new watermark
        Library.Watermark = Watermark:new(info)
    end
    return Library.Watermark
end

function Library.Init(args)
    args = args or {}
    local title = args.Title or args.title or Library.Title
    local theme = args.Theme or args.theme or "Default"
    Library.Theme.Selected = theme
    
    -- Create default watermark if enabled
    if args.Watermark ~= false then
        local watermarkInfo = args.Watermark or {}
        watermarkInfo.title = watermarkInfo.title or title
        Library.CreateWatermark(watermarkInfo)
    end

    Library.KeybindsList = KeybindsList:new()
    Library.KeybindsList:UpdatePosition()

    Library.TargetHUD = TargetHUD:new()
    Library.TargetHUD:UpdatePosition()
    
    return Library
end

function Library.Window(args)
    args = args or {}
    local title = args.Title or args.title or "Window"
    local x = args.X or args.x or 100
    local y = args.Y or args.y or 100
    local width = args.Width or args.width or 500
    local height = args.Height or args.height or 400
    
    local window = Window:new(title, x, y, width, height)
    table.insert(Library.Windows, window)
    
    if not Library.CurrentWindow then
        Library.CurrentWindow = window
    end
    
    return window
end


local UI = Library.Init({
    Title = "shedhook fallen survival",
    Theme = "Abyss",
    Watermark = {
        title = "shedhook",
        template = "$TITLE | $PLAYER | $FPS FPS | $PINGms Latency",
        position = "top-right"
    }
})

local MainWindow = Library.Window({
    Title = "shedhook",
    X = 100,
    Y = 100,
    Width = 630,
    Height = 610
})

local elements = {}
local sections = {}
local tabs = {}
local multiSections = {}

local AimbotConfig = {
    enabled = false,
    mode = "mouse",
    visible = false,
    targets = {"Players"},
    sticky = false,
    targetSelection = "Closest to crosshair",
    hitboxes = {"Head", "UpperTorso"},
    fov = 60,
    visualizeFOV = false,
    visualizeFOVColor = {255, 255, 255, 255},
    fovCircleFilled = false,
    fovCircleFilledColor = {255, 255, 255, 100},
    mouseMovement = "Linear",
    speed = 50,
    smoothing = 20,
    smoothingEnabled = true,
    maxDistance = 1000,
    visualizeTarget = false,
    targetColor = {255, 0, 0, 255},
    showHitchance = true,
    
    keybind = {
        key = 0x41,
        mode = "Hold",
        active = false
    },

    activeWeapon = "General",
    weapons = {
        ["Wooden Bow"] = {
            predictionEnabled = false,
            predictionMethod = "Regular",
            predictionStrength = 1.0,
            visualizePrediction = false,
            predictionVisualizationType = "Line",
            predictionColor = {0, 255, 255, 255},
        },
        ["Crossbow"] = {
            predictionEnabled = false,
            predictionMethod = "Regular",
            predictionStrength = 1.0,
            bulletDrop = 0.0,
            visualizePrediction = false,
            predictionVisualizationType = "Line",
            predictionColor = {0, 255, 255, 255},
        },
        ["Nail Gun"] = {
            predictionEnabled = false,
            predictionMethod = "Regular",
            predictionStrength = 1.0,
            bulletDrop = 0.0,
            visualizePrediction = false,
            predictionVisualizationType = "Line",
            predictionColor = {0, 255, 255, 255},
        },
        ["Salvaged Break Action"] = {
            predictionEnabled = false,
            predictionMethod = "Regular",
            predictionStrength = 1.0,
            bulletDrop = 0.0,
            visualizePrediction = false,
            predictionVisualizationType = "Line",
            predictionColor = {0, 255, 255, 255},
        },
        ["Salvaged RPG"] = {
            predictionEnabled = false,
            predictionMethod = "Regular",
            predictionStrength = 1.0,
            bulletDrop = 0.0,
            visualizePrediction = false,
            predictionVisualizationType = "Line",
            predictionColor = {0, 255, 255, 255},
        },
        ["Military AA12"] = {
            predictionEnabled = false,
            predictionMethod = "Regular",
            predictionStrength = 1.0,
            bulletDrop = 0.0,
            visualizePrediction = false,
            predictionVisualizationType = "Line",
            predictionColor = {0, 255, 255, 255},
        },
        ["Salvaged Pump Action"] = {
            predictionEnabled = false,
            predictionMethod = "Regular",
            predictionStrength = 1.0,
            bulletDrop = 0.0,
            visualizePrediction = false,
            predictionVisualizationType = "Line",
            predictionColor = {0, 255, 255, 255},
        },
        ["Salvaged P250"] = {
            predictionEnabled = false,
            predictionMethod = "Regular",
            predictionStrength = 1.0,
            bulletDrop = 0.0,
            visualizePrediction = false,
            predictionVisualizationType = "Line",
            predictionColor = {0, 255, 255, 255},
        },
        ["Salvaged Skorpion"] = {
            predictionEnabled = false,
            predictionMethod = "Regular",
            predictionStrength = 1.0,
            bulletDrop = 0.0,
            visualizePrediction = false,
            predictionVisualizationType = "Line",
            predictionColor = {0, 255, 255, 255},
        },
        ["Salvaged Pipe Rifle"]  = {
            predictionEnabled = false,
            predictionMethod = "Regular",
            predictionStrength = 1.0,
            bulletDrop = 0.0,
            visualizePrediction = false,
            predictionVisualizationType = "Line",
            predictionColor = {0, 255, 255, 255},
        },
        ["Salvaged AK74U"] = {
            predictionEnabled = false,
            predictionMethod = "Regular",
            predictionStrength = 1.0,
            bulletDrop = 0.0,
            visualizePrediction = false,
            predictionVisualizationType = "Line",
            predictionColor = {0, 255, 255, 255},
        },
        ["Salvaged SMG"] = {
            predictionEnabled = false,
            predictionMethod = "Regular",
            predictionStrength = 1.0,
            bulletDrop = 0.0,
            visualizePrediction = false,
            predictionVisualizationType = "Line",
            predictionColor = {0, 255, 255, 255},
        },
        ["Military MP7"] = {
            predictionEnabled = false,
            predictionMethod = "Regular",
            predictionStrength = 1.0,
            bulletDrop = 0.0,
            visualizePrediction = false,
            predictionVisualizationType = "Line",
            predictionColor = {0, 255, 255, 255},
        },
        ["Bruno's M4A1"] = {
            predictionEnabled = false,
            predictionMethod = "Regular",
            predictionStrength = 1.0,
            bulletDrop = 0.0,
            visualizePrediction = false,
            predictionVisualizationType = "Line",
            predictionColor = {0, 255, 255, 255},
        },
        ["Military M4A1"] = {
            predictionEnabled = false,
            predictionMethod = "Regular",
            predictionStrength = 1.0,
            bulletDrop = 0.0,
            visualizePrediction = false,
            predictionVisualizationType = "Line",
            predictionColor = {0, 255, 255, 255},
        },
        ["Salvaged AK47"] = {
            predictionEnabled = false,
            predictionMethod = "Regular",
            predictionStrength = 1.0,
            bulletDrop = 0.0,
            visualizePrediction = false,
            predictionVisualizationType = "Line",
            predictionColor = {0, 255, 255, 255},
        },
        ["Salvaged M14"] = {
            predictionEnabled = false,
            predictionMethod = "Regular",
            predictionStrength = 1.0,
            bulletDrop = 0.0,
            visualizePrediction = false,
            predictionVisualizationType = "Line",
            predictionColor = {0, 255, 255, 255},
        },
        ["Military PKM"] = {
            predictionEnabled = false,
            predictionMethod = "Regular",
            predictionStrength = 1.0,
            bulletDrop = 0.0,
            visualizePrediction = false,
            predictionVisualizationType = "Line",
            predictionColor = {0, 255, 255, 255},
        },
        ["Military Barret"] = {
            predictionEnabled = false,
            predictionMethod = "Regular",
            predictionStrength = 1.0,
            bulletDrop = 0.0,
            visualizePrediction = false,
            predictionVisualizationType = "Line",
            predictionColor = {0, 255, 255, 255},
        }

    }
}

-- Enhanced Movement Tracker with Advanced Pattern Recognition
local MovementTracker = {
    targets = {},
    maxHistoryFrames = 30,
    consistencyThreshold = 8,
    crossingPointThreshold = 0.3,
    patternAnalysisFrames = 15,
    zigzagDetectionFrames = 10,
    
    addMovement = function(self, targetId, velocity, position)
        if not targetId or not position or not position.x or not position.y or not position.z then return end
        
        if not self.targets[targetId] then
            self.targets[targetId] = {
                history = {},
                lastPosition = vector(position.x, position.y, position.z),
                consistentFrames = 0,
                lastDirection = vector(0, 0, 0),
                crossingPoint = vector(0, 0, 0),
                crossingDetected = false,
                directionChanges = 0,
                
                -- Enhanced pattern tracking
                movementPatterns = {},
                averageVelocity = vector(0, 0, 0),
                velocityVariance = 0,
                directionVariance = 0,
                predictability = 0.5,
                zigzagDetected = false,
                zigzagFrequency = 0,
                patternConfidence = 0,
                strafePattern = {left = 0, right = 0, forward = 0, backward = 0},
                
                -- Timing analysis
                firstContactTime = utility.get_tickcount(),
                lastUpdateTime = utility.get_tickcount(),
                totalObservationTime = 0,
                
                -- Behavioral analysis
                reactiveMovement = false,
                baselineEstablished = false,
                baselineMovement = vector(0, 0, 0),
                reactionThreshold = 3.0,
            }
        end
        
        local target = self.targets[targetId]
        local currentTime = utility.get_tickcount()
        target.lastUpdateTime = currentTime
        target.totalObservationTime = currentTime - target.firstContactTime
        
        local currentDirection = vector(0, 0, 0)
        local currentVelocity = vector(0, 0, 0)
        
        if velocity and velocity.x and velocity.y and velocity.z then
            currentVelocity = vector(velocity.x, velocity.y, velocity.z)
            local vel_magnitude = currentVelocity:length()
            if vel_magnitude > 0.1 then
                currentDirection = vector(velocity.x / vel_magnitude, velocity.y / vel_magnitude, velocity.z / vel_magnitude)
            end
        end
        
        -- Calculate direction change
        local directionChange = 0
        if target.lastDirection and currentDirection then
            local lastDir = target.lastDirection
            if lastDir.x and lastDir.y and lastDir.z and currentDirection.x and currentDirection.y and currentDirection.z then
                directionChange = (lastDir.x * currentDirection.x) + (lastDir.y * currentDirection.y) + (lastDir.z * currentDirection.z)
            end
        end
        
        -- Track direction changes for zigzag detection
        if directionChange < 0.3 and target.lastDirection:length() > 0.1 then
            target.directionChanges = target.directionChanges + 1
        end
        
        -- Update consistency tracking
        if directionChange > 0.8 then
            target.consistentFrames = math.min(target.consistentFrames + 1, self.maxHistoryFrames)
        else
            target.consistentFrames = 0
        end
        
        -- Add to movement history
        table.insert(target.history, {
            velocity = currentVelocity,
            position = vector(position.x, position.y, position.z),
            direction = currentDirection,
            timestamp = currentTime,
            directionChange = directionChange
        })
        
        if #target.history > self.maxHistoryFrames then
            table.remove(target.history, 1)
        end
        
        -- Enhanced pattern analysis
        self:analyzeMovementPatterns(targetId)
        self:detectZigzagPattern(targetId)
        self:calculatePredictability(targetId)
        self:detectReactiveMovement(targetId)
        
        target.lastDirection = currentDirection
        target.lastPosition = vector(position.x, position.y, position.z)
    end,
    
    -- Analyze movement patterns for better prediction
    analyzeMovementPatterns = function(self, targetId)
        local target = self.targets[targetId]
        if not target or #target.history < self.patternAnalysisFrames then return end
        
        local recentHistory = {}
        local startIdx = math.max(1, #target.history - self.patternAnalysisFrames + 1)
        
        for i = startIdx, #target.history do
            table.insert(recentHistory, target.history[i])
        end
        
        -- Calculate average velocity and variance
        local totalVelocity = vector(0, 0, 0)
        local velocityCount = 0
        
        for _, frame in ipairs(recentHistory) do
            if frame.velocity then
                totalVelocity.x = totalVelocity.x + frame.velocity.x
                totalVelocity.y = totalVelocity.y + frame.velocity.y
                totalVelocity.z = totalVelocity.z + frame.velocity.z
                velocityCount = velocityCount + 1
            end
        end
        
        if velocityCount > 0 then
            target.averageVelocity = vector(
                totalVelocity.x / velocityCount,
                totalVelocity.y / velocityCount,
                totalVelocity.z / velocityCount
            )
        end
        
        -- Calculate velocity variance
        local varianceSum = 0
        for _, frame in ipairs(recentHistory) do
            if frame.velocity then
                local diff = vector(
                    frame.velocity.x - target.averageVelocity.x,
                    frame.velocity.y - target.averageVelocity.y,
                    frame.velocity.z - target.averageVelocity.z
                )
                varianceSum = varianceSum + diff:length_sqr()
            end
        end
        target.velocityVariance = velocityCount > 0 and (varianceSum / velocityCount) or 0
        
        -- Analyze strafe patterns
        target.strafePattern = {left = 0, right = 0, forward = 0, backward = 0}
        for _, frame in ipairs(recentHistory) do
            if frame.velocity then
                if frame.velocity.x > 1.0 then target.strafePattern.right = target.strafePattern.right + 1 end
                if frame.velocity.x < -1.0 then target.strafePattern.left = target.strafePattern.left + 1 end
                if frame.velocity.z > 1.0 then target.strafePattern.forward = target.strafePattern.forward + 1 end
                if frame.velocity.z < -1.0 then target.strafePattern.backward = target.strafePattern.backward + 1 end
            end
        end
    end,
    
    -- Detect zigzag movement patterns
    detectZigzagPattern = function(self, targetId)
        local target = self.targets[targetId]
        if not target or #target.history < self.zigzagDetectionFrames then return end
        
        local recentFrames = math.min(self.zigzagDetectionFrames, #target.history)
        local directionSwitches = 0
        local lastXDirection = nil
        local lastZDirection = nil
        
        for i = #target.history - recentFrames + 1, #target.history do
            local frame = target.history[i]
            if frame and frame.velocity then
                local currentXDir = frame.velocity.x > 0.5 and 1 or (frame.velocity.x < -0.5 and -1 or 0)
                local currentZDir = frame.velocity.z > 0.5 and 1 or (frame.velocity.z < -0.5 and -1 or 0)
                
                if lastXDirection and currentXDir ~= 0 and lastXDirection ~= currentXDir then
                    directionSwitches = directionSwitches + 1
                end
                if lastZDirection and currentZDir ~= 0 and lastZDirection ~= currentZDir then
                    directionSwitches = directionSwitches + 1
                end
                
                if currentXDir ~= 0 then lastXDirection = currentXDir end
                if currentZDir ~= 0 then lastZDirection = currentZDir end
            end
        end
        
        target.zigzagFrequency = directionSwitches / recentFrames
        target.zigzagDetected = target.zigzagFrequency > 0.2
    end,
    
    -- Calculate movement predictability score
    calculatePredictability = function(self, targetId)
        local target = self.targets[targetId]
        if not target or #target.history < 5 then 
            target.predictability = 0.5
            return 
        end
        
        local consistencyScore = math.min(target.consistentFrames / self.consistencyThreshold, 1.0)
        local varianceScore = math.max(0, 1.0 - (target.velocityVariance / 100))
        local zigzagPenalty = target.zigzagDetected and 0.2 or 0
        local observationBonus = math.min(target.totalObservationTime / 5000, 0.2) -- 5 second observation bonus
        
        local basePredictability = (consistencyScore * 0.4) + (varianceScore * 0.4) + observationBonus
        target.predictability = math.max(0.1, math.min(1.0, basePredictability - zigzagPenalty))
        
        -- Increase confidence over time if patterns are stable
        if target.velocityVariance < 20 and not target.zigzagDetected then
            target.patternConfidence = math.min(1.0, target.patternConfidence + 0.02)
        else
            target.patternConfidence = math.max(0, target.patternConfidence - 0.05)
        end
    end,
    
    -- Detect reactive movement (movement changes after being shot at)
    detectReactiveMovement = function(self, targetId)
        local target = self.targets[targetId]
        if not target or #target.history < 10 then return end
        
        -- Establish baseline movement in first few seconds
        if not target.baselineEstablished and target.totalObservationTime > 2000 then
            local baselineFrames = math.min(8, #target.history)
            local totalVel = vector(0, 0, 0)
            
            for i = 1, baselineFrames do
                local frame = target.history[i]
                if frame and frame.velocity then
                    totalVel.x = totalVel.x + frame.velocity.x
                    totalVel.y = totalVel.y + frame.velocity.y
                    totalVel.z = totalVel.z + frame.velocity.z
                end
            end
            
            target.baselineMovement = vector(
                totalVel.x / baselineFrames,
                totalVel.y / baselineFrames,
                totalVel.z / baselineFrames
            )
            target.baselineEstablished = true
        end
        
        -- Check for sudden movement changes (reactive behavior)
        if target.baselineEstablished and #target.history >= 3 then
            local recentFrame = target.history[#target.history]
            if recentFrame and recentFrame.velocity then
                local velocityDifference = vector(
                    recentFrame.velocity.x - target.baselineMovement.x,
                    recentFrame.velocity.y - target.baselineMovement.y,
                    recentFrame.velocity.z - target.baselineMovement.z
                )
                
                target.reactiveMovement = velocityDifference:length() > target.reactionThreshold
            end
        end
    end,
    
    -- Enhanced prediction with pattern recognition
    getEnhancedPrediction = function(self, targetId, currentPos, predictionTime)
        local target = self.targets[targetId]
        if not target or #target.history < 3 then
            return currentPos
        end
        
        local predictedPos = vector(currentPos.x, currentPos.y, currentPos.z)
        
        if target.zigzagDetected and target.patternConfidence > 0.2 then
            -- For zigzag patterns, predict based on pattern frequency
            local zigzagCycle = target.zigzagFrequency * predictionTime
            local phaseOffset = (zigzagCycle % 1.0) * 2 * math.pi
            
            -- Apply sinusoidal movement prediction for zigzag
            local amplitude = target.averageVelocity:length() * 0.5
            local zigzagOffset = vector(
                amplitude * math.sin(phaseOffset),
                0,
                amplitude * math.cos(phaseOffset * 0.7)
            )
            
            predictedPos.x = predictedPos.x + (target.averageVelocity.x * predictionTime * 0.7) + zigzagOffset.x
            predictedPos.z = predictedPos.z + (target.averageVelocity.z * predictionTime * 0.7) + zigzagOffset.z
        else
            -- For consistent movement, use pattern-based prediction
            local confidenceMultiplier = target.patternConfidence
            local baseVelocity = target.averageVelocity
            
            -- Account for strafe patterns
            local strafeAdjustment = vector(0, 0, 0)
            local totalStrafe = target.strafePattern.left + target.strafePattern.right + target.strafePattern.forward + target.strafePattern.backward
            
            if totalStrafe > 0 then
                local leftRightRatio = (target.strafePattern.right - target.strafePattern.left) / totalStrafe
                local forwardBackRatio = (target.strafePattern.forward - target.strafePattern.backward) / totalStrafe
                
                strafeAdjustment.x = leftRightRatio * baseVelocity:length() * 0.3
                strafeAdjustment.z = forwardBackRatio * baseVelocity:length() * 0.3
            end
            
            predictedPos.x = predictedPos.x + ((baseVelocity.x + strafeAdjustment.x) * predictionTime * confidenceMultiplier)
            predictedPos.y = predictedPos.y + (baseVelocity.y * predictionTime * confidenceMultiplier)
            predictedPos.z = predictedPos.z + ((baseVelocity.z + strafeAdjustment.z) * predictionTime * confidenceMultiplier)
        end
        
        return predictedPos
    end,
    
    -- Calculate hitchance based on predictability and patterns
    calculateHitchance = function(self, targetId, distance, weaponAccuracy)
        local target = self.targets[targetId]
        if not target then return 50 end
        
        local basePredictability = target.predictability * 100
        
        -- Distance factor (closer = higher hitchance)
        local distanceFactor = math.max(0.3, 1.0 - (distance / 3000))
        
        -- Weapon accuracy factor
        local weaponFactor = weaponAccuracy or 0.8
        
        -- Pattern stability factor
        local stabilityFactor = 1.0
        if target.zigzagDetected then
            stabilityFactor = 0.6 - (target.zigzagFrequency * 0.3)
        end
        
        -- Reactive movement penalty
        local reactivePenalty = target.reactiveMovement and 0.8 or 1.0
        
        -- Observation time bonus (more observation = better prediction)
        local observationBonus = math.min(target.totalObservationTime / 10000, 0.15)
        
        local hitchance = basePredictability * distanceFactor * weaponFactor * stabilityFactor * reactivePenalty + (observationBonus * 100)
        
        return math.max(5, math.min(95, math.floor(hitchance)))
    end,
    
    getPredictionScale = function(self, targetId)
        local target = self.targets[targetId]
        if not target then return 0.5 end
        
        return target.predictability
    end,
    
    getCompensatedVelocity = function(self, targetId)
        local target = self.targets[targetId]
        if not target or not target.history or #target.history < 3 then
            return vector(0, 0, 0)
        end
        
        -- Use enhanced prediction for experimental mode
        return target.averageVelocity or vector(0, 0, 0)
    end,
    
    cleanup = function(self)
        local currentTime = utility.get_tickcount()
        for targetId, target in pairs(self.targets) do
            if target and target.history and #target.history > 0 then
                local lastFrame = target.history[#target.history]
                if lastFrame and lastFrame.timestamp and currentTime - lastFrame.timestamp > 5000 then
                    self.targets[targetId] = nil
                end
            else
                self.targets[targetId] = nil
            end
        end
    end
}

local ESPConfig = {
    MainEnabled = true,
    AntiClutter = false,
    OnlyEnemies = false,
    
    SelectedOres = {"Stone"},
    SelectedPlants = {"Wool"},
    SelectedAnimals = {"Deer"},
    SelectedLoot = {"Keycard"},
    
    OresEnabled = false,
    OresDistance = 500,
    OresShowDistance = true,
    OresTracers = false,
    
    PlantsEnabled = false,
    PlantsDistance = 2000,
    PlantsShowDistance = true,
    PlantsTracers = false,
    
    DropsEnabled = false,
    DigPileEnabled = false,
    DropsDistance = 500,
    DigPileDistance = 2000,
    DropsShowDistance = true,
    DigPileShowDistance = true,
    DropsTracers = false,
    DigPileTracers = false,
    
    KeycardEnabled = false,
    MonumentSpawnsEnabled = false,
    KeycardDistance = 2000,
    MonumentSpawnsDistance = 2000,
    KeycardShowDistance = true,
    MonumentSpawnsShowDistance = true,
    KeycardTracers = false,
    MonumentSpawnsTracers = false,
    
    SoldiersEnabled = false,
    SoldiersDistance = 500,
    SoldiersShowDistance = true,
    SoldiersTracers = false,
    
    AnimalsEnabled = false,
    AnimalsDistance = 2000,
    AnimalsShowDistance = true,
    AnimalsTracers = false,
    
    SleeperEnabled = false,
    BodyBagEnabled = false,
    SleeperDistance = 500,
    BodyBagDistance = 500,
    ModAdminViewerEnabled = false,
    
    Colors = {
        Stone = {127, 127, 127, 255},
        Metal = {255, 155, 0, 255},
        Phosphate = {238, 229, 127, 255},
        Wool = {255, 255, 255, 255},
        Raspberry = {255, 123, 123, 255},
        Corn = {253, 255, 94, 255},
        Tomato = {255, 108, 108, 255},
        Blueberry = {87, 160, 255, 255},
        Lemon = {244, 255, 58, 255},
        Drops = {255, 255, 0, 255},
        DigPile = {255, 186, 139, 255},
        Keycard = {255, 186, 139, 255},
        TrashCan = {188, 188, 188, 255},
        OilBarrel = {255, 80, 50, 255},
        LockedWoodenCrate = {188, 110, 0, 255},
        LockedMetalCrate = {207, 207, 207, 255},
        FoodCrate = {255, 245, 122, 255},
        Soldier = {255, 0, 0, 255},
        Deer = {255, 203, 59, 255},
        Wildboar = {255, 186, 139, 255},
        Wolf = {160, 0, 0, 255},
        Sleeper = {255, 0, 0, 255},
        BodyBag = {255, 0, 0, 255}
    }
}

local weapon_keyset,n={},0
local wpn_display={}
for k,v in pairs(AimbotConfig.weapons) do
  n=n+1
  
  weapon_keyset[n]=k
  if string.find(k, "%s") then 
    k = split(k, "%s")[2]
  end
  wpn_display[n]= k
end

tabs.Legit = MainWindow:AddTab("Aimbot")
tabs.Prediction = MainWindow:AddTab("Prediction")
tabs.Visuals = MainWindow:AddTab("Visuals")
tabs.Entities = MainWindow:AddTab("Entities")
tabs.Player = MainWindow:AddTab("Players")
tabs.Settings = MainWindow:AddTab("Settings")

sections.Aimbot = tabs.Legit:AddSection("Aimbot", 5, 55, 620, 535)
sections.Prediction = tabs.Prediction:AddMultiSection("Prediction", wpn_display, 5, 55, 620, 535)

elements.aimbotEnabled = Toggle:new("Enabled", function(state)
    AimbotConfig.enabled = state
end, AimbotConfig.enabled, "aimbot_enabled")

elements.aimbotEnabled.keybind = elements.aimbotEnabled:AddKeybind(AimbotConfig.keybind.key, "Hold")
sections.Aimbot:AddElement(elements.aimbotEnabled)

elements.aimbotMode = Dropdown:new("Mode", {"mouse", "silent"}, function(selected)
    AimbotConfig.mode = selected
end, AimbotConfig.mode, "aimbot_mode")
sections.Aimbot:AddElement(elements.aimbotMode)

elements.aimbotVisible = Toggle:new("Visible Only", function(state)
    AimbotConfig.visible = state
end, AimbotConfig.visible, "aimbot_visible")
sections.Aimbot:AddElement(elements.aimbotVisible)

elements.aimbotTargets = MultiSelectDropdown:new("Target Types", {"Players", "Soldiers", "Animals", "Whitelisteds"}, function(selected)
    AimbotConfig.targets = selected
end, AimbotConfig.targets, "aimbot_targets")
sections.Aimbot:AddElement(elements.aimbotTargets)

elements.aimbotSticky = Toggle:new("Sticky Target", function(state)
    AimbotConfig.sticky = state
end, AimbotConfig.sticky, "aimbot_sticky")
sections.Aimbot:AddElement(elements.aimbotSticky)

elements.aimbotTargetSelection = Dropdown:new("Target Selection", {"Closest to crosshair", "Closest to Player", "Lowest HP"}, function(selected)
    AimbotConfig.targetSelection = selected
end, AimbotConfig.targetSelection, "aimbot_target_selection")
sections.Aimbot:AddElement(elements.aimbotTargetSelection)

elements.aimbotHitboxes = MultiSelectDropdown:new("Hitboxes", {
    "Head", "UpperTorso", "LowerTorso", "LeftUpperArm", "LeftLowerArm", 
    "RightUpperArm", "RightLowerArm", "LeftUpperLeg", "LeftLowerLeg", 
    "RightUpperLeg", "RightLowerLeg", "LeftHand", "RightHand", "LeftFoot", "RightFoot"
}, function(selected)
    AimbotConfig.hitboxes = selected
end, AimbotConfig.hitboxes, "aimbot_hitboxes")
sections.Aimbot:AddElement(elements.aimbotHitboxes)

elements.aimbotFOV = Slider:new("FOV", 0, 1000, AimbotConfig.fov, function(value)
    AimbotConfig.fov = value
end, "aimbot_fov")
sections.Aimbot:AddElement(elements.aimbotFOV)

elements.aimbotVisualizeFOV = Toggle:new("Visualize FOV", function(state)
    AimbotConfig.visualizeFOV = state
end, AimbotConfig.visualizeFOV, "aimbot_visualize_fov")
elements.aimbotVisualizeFOV:AddColorPicker("FOV Color", function(color)
    AimbotConfig.visualizeFOVColor = color
end, AimbotConfig.visualizeFOVColor, "aimbot_visualize_fov_color")
sections.Aimbot:AddElement(elements.aimbotVisualizeFOV)

elements.aimbotVisualizeFOVFilled = Toggle:new("FOV Filled", function(state)
    AimbotConfig.fovCircleFilled = state
end, AimbotConfig.fovCircleFilled, "aimbot_visualize_fov_filled")
elements.aimbotVisualizeFOVFilled:AddColorPicker("FOV Fill Color", function(color)
    AimbotConfig.fovCircleFilledColor = color
end, AimbotConfig.fovCircleFilledColor, "aimbot_visualize_fov_filled_color")
sections.Aimbot:AddElement(elements.aimbotVisualizeFOVFilled)

elements.aimbotMouseMovement = Dropdown:new("Mouse Movement", {"Linear", "Exponential", "Curved"}, function(selected)
    AimbotConfig.mouseMovement = selected
end, AimbotConfig.mouseMovement, "aimbot_mouse_movement")
sections.Aimbot:AddElement(elements.aimbotMouseMovement)

elements.aimbotSpeed = Slider:new("Speed", 0, 100, AimbotConfig.speed, function(value)
    AimbotConfig.speed = value
end, "aimbot_speed")
sections.Aimbot:AddElement(elements.aimbotSpeed)

elements.aimbotSmoothingEnabled = Toggle:new("Enable Smoothing", function(state)
    AimbotConfig.smoothingEnabled = state
end, AimbotConfig.smoothingEnabled, "aimbot_smoothing_enabled")
sections.Aimbot:AddElement(elements.aimbotSmoothingEnabled)

elements.aimbotSmoothing = Slider:new("Smoothing", 1, 50, AimbotConfig.smoothing, function(value)
    AimbotConfig.smoothing = value
end, "aimbot_smoothing")
sections.Aimbot:AddElement(elements.aimbotSmoothing)

elements.aimbotMaxDistance = Slider:new("Max Distance", 100, 5000, AimbotConfig.maxDistance, function(value)
    AimbotConfig.maxDistance = value
end, "aimbot_max_distance")
sections.Aimbot:AddElement(elements.aimbotMaxDistance)

elements.aimbotVisualizeTarget = Toggle:new("Visualize Target", function(state)
    AimbotConfig.visualizeTarget = state
end, AimbotConfig.visualizeTarget, "aimbot_visualize_target")
elements.aimbotVisualizeTarget:AddColorPicker("Target Color", function(color)
    AimbotConfig.targetColor = color
end, AimbotConfig.targetColor, "aimbot_target_color")
sections.Aimbot:AddElement(elements.aimbotVisualizeTarget)

-- Hitchance settings
elements.showHitchance = Toggle:new("Show Hitchance", function(state)
    AimbotConfig.showHitchance = state
end, AimbotConfig.showHitchance, "show_hitchance")
sections.Aimbot:AddElement(elements.showHitchance)



local weaponIndex = 1
for _, weapon in ipairs(weapon_keyset) do
    elements[weapon.."_predictionEnabled"] = Toggle:new(string.format("Enable %s Prediction", weapon), function(state)
        AimbotConfig.weapons[weapon].predictionEnabled = state
    end, AimbotConfig.weapons[weapon].predictionEnabled, string.format("%s_prediction_enabled", weapon))
    sections.Prediction:AddElement(elements[weapon.."_predictionEnabled"], weaponIndex)

    elements[weapon.."_predictionMethod"] = Dropdown:new("Prediction Method", {"Regular", "Experimental"}, function(selected)
        AimbotConfig.weapons[weapon].predictionMethod = selected
    end, AimbotConfig.weapons[weapon].predictionMethod, string.format("%s_prediction_method", weapon))
    sections.Prediction:AddElement(elements[weapon.."_predictionMethod"], weaponIndex)

    elements[weapon.."_predictionStrength"] = Slider:new("Prediction Strength", 0.1, 5.0, AimbotConfig.weapons[weapon].predictionStrength, function(value)
        AimbotConfig.weapons[weapon].predictionStrength = value
    end, string.format("%s_prediction_strength", weapon))
    sections.Prediction:AddElement(elements[weapon.."_predictionStrength"], weaponIndex)

    elements[weapon.."_gravity"] = Slider:new("Gravity", 0, 300, AimbotConfig.weapons[weapon].gravity, function(value)
        AimbotConfig.weapons[weapon].gravity = value
    end, string.format("%s_gravity", weapon))
    sections.Prediction:AddElement(elements[weapon.."_gravity"], weaponIndex)

    elements[weapon.."_bulletDrop"] = Slider:new("Bullet Drop", 0.0, 30.0, AimbotConfig.weapons[weapon].bulletDrop, function(value)
        AimbotConfig.weapons[weapon].bulletDrop = value
    end, string.format("%s_bullet_drop", weapon))
    sections.Prediction:AddElement(elements[weapon.."_bulletDrop"], weaponIndex)

    elements[weapon.."_visualizePrediction"] = Toggle:new("Visualize Prediction", function(state)
        AimbotConfig.weapons[weapon].visualizePrediction = state
    end, AimbotConfig.weapons[weapon].visualizePrediction, string.format("%s_visualize_prediction", weapon))
    sections.Prediction:AddElement(elements[weapon.."_visualizePrediction"], weaponIndex)

    elements[weapon.."_predictionVisualizationType"] = Dropdown:new("Visualization Type", {"Line", "Circle", "Dot"}, function(selected)
        AimbotConfig.weapons[weapon].predictionVisualizationType = selected
    end, AimbotConfig.weapons[weapon].predictionVisualizationType, string.format("%s_prediction_visualization_type", weapon))
    sections.Prediction:AddElement(elements[weapon.."_predictionVisualizationType"], weaponIndex)

    elements[weapon.."_predictionColor"] = ColorPicker:new("Prediction Color", function(color)
        AimbotConfig.weapons[weapon].predictionColor = color
    end, AimbotConfig.weapons[weapon].predictionColor)
    sections.Prediction:AddElement(elements[weapon.."_predictionColor"], weaponIndex)
    
    weaponIndex = weaponIndex + 1
end

-- ESP Section - Converted from MultiSection to regular Section with inline colorpickers
sections.ESPPreview = tabs.Visuals:AddESPPreview("ESP Preview", 10, 60, 250, 350)
sections.ESPSettings = tabs.Visuals:AddSection("ESP Settings", 270, 60, 350, 530)

elements.enableESP = Toggle:new("Enable ESP", function(state)
    Library.ESP.Enabled = state
end, Library.ESP.Enabled, "esp_enabled")
sections.ESPSettings:AddElement(elements.enableESP)

elements.boxToggle = Toggle:new("Box ESP", function(state)
    Library.ESP.Show2DBox = state
    Library.ESPPreview.Components.Box = state
end, Library.ESP.Show2DBox, "esp_box")
elements.boxToggle:AddColorPicker("Box Color", function(color)
    Library.ESP.Colors.Box = color
    Library.ESPPreview.Colors.Box = color
end, Library.ESP.Colors.Box)
sections.ESPSettings:AddElement(elements.boxToggle)

elements.healthBarToggle = Toggle:new("Health Bar", function(state)
    Library.ESP.ShowHealth = state
    Library.ESPPreview.Components.HealthBar = state
end, Library.ESP.ShowHealth, "esp_healthbar")
sections.ESPSettings:AddElement(elements.healthBarToggle)

elements.nameToggle = Toggle:new("Name ESP", function(state)
    Library.ESP.ShowName = state
    Library.ESPPreview.Components.Name = state
end, Library.ESP.ShowName, "esp_name")
elements.nameToggle:AddColorPicker("Name Color", function(color)
    Library.ESP.Colors.Name = color
    Library.ESPPreview.Colors.Name = color
end, Library.ESP.Colors.Name)
sections.ESPSettings:AddElement(elements.nameToggle)

elements.showTagsToggle = Toggle:new("Show Tags", function(state)
    Library.ESP.ShowTags = state
end, Library.ESP.ShowTags, "esp_show_tags")
sections.ESPSettings:AddElement(elements.showTagsToggle)

elements.distanceToggle = Toggle:new("Distance ESP", function(state)
    Library.ESP.ShowDistance = state
    Library.ESPPreview.Components.Distance = state
end, Library.ESP.ShowDistance, "esp_distance")
elements.distanceToggle:AddColorPicker("Distance Color", function(color)
    Library.ESP.Colors.Distance = color
    Library.ESPPreview.Colors.Distance = color
end, Library.ESP.Colors.Distance)
sections.ESPSettings:AddElement(elements.distanceToggle)

elements.weaponToggle = Toggle:new("Weapon ESP", function(state)
    Library.ESP.ShowWeapon = state
    Library.ESPPreview.Components.Weapon = state
end, Library.ESP.ShowWeapon, "esp_weapon")
elements.weaponToggle:AddColorPicker("Weapon Color", function(color)
    Library.ESP.Colors.Weapon = color
    Library.ESPPreview.Colors.Weapon = color
end, Library.ESP.Colors.Weapon)
sections.ESPSettings:AddElement(elements.weaponToggle)

elements.skeletonToggle = Toggle:new("Skeleton ESP", function(state)
    Library.ESP.ShowSkeleton = state
    Library.ESPPreview.Components.Skeleton = state
end, Library.ESP.ShowSkeleton, "esp_skeleton")
elements.skeletonToggle:AddColorPicker("Skeleton Color", function(color)
    Library.ESP.Colors.Skeleton = color
    Library.ESPPreview.Colors.Skeleton = color
end, Library.ESP.Colors.Skeleton)
sections.ESPSettings:AddElement(elements.skeletonToggle)

elements.flagsToggle = Toggle:new("Flags ESP", function(state)
    Library.ESP.ShowFlags = state
    Library.ESPPreview.Components.Flags = state
end, Library.ESP.ShowFlags, "esp_flags")
elements.flagsToggle:AddColorPicker("Flags Color", function(color)
    Library.ESP.Colors.Flags = color
    Library.ESPPreview.Colors.Flags = color
end, Library.ESP.Colors.Flags)
sections.ESPSettings:AddElement(elements.flagsToggle)

elements.onlyEnemiesToggle = Toggle:new("Only Enemies", function(state)
    Library.ESP.OnlyEnemies = state
end, Library.ESP.OnlyEnemies, "esp_only_enemies")
sections.ESPSettings:AddElement(elements.onlyEnemiesToggle)

elements.enemyColorPicker = ColorPicker:new("Enemy Color", function(color)
    Library.ESP.Colors.Enemy = color
end, Library.ESP.Colors.Enemy)
sections.ESPSettings:AddElement(elements.enemyColorPicker)

elements.friendlyColorPicker = ColorPicker:new("Friendly Color", function(color)
    Library.ESP.Colors.Friendly = color
end, Library.ESP.Colors.Friendly)
sections.ESPSettings:AddElement(elements.friendlyColorPicker)

elements.maxDistanceSlider = Slider:new("Max Distance", 100, 20000, Library.ESP.MaxDistance, function(value)
    Library.ESP.MaxDistance = value
end, "esp_max_distance")
sections.ESPSettings:AddElement(elements.maxDistanceSlider)

sections.ESPMain = tabs.Entities:AddSection("ESP Main Controls", 10, 60, 300, 150)

local function isItemSelected(itemName, selectedArray)
    for _, selected in ipairs(selectedArray) do
        if string.find(itemName:lower(), selected:lower()) then
            return true
        end
    end
    return false
end

elements.enableMainESP = Toggle:new("Enable ESP", function(state)
    ESPConfig.MainEnabled = state
end, ESPConfig.MainEnabled, "main_esp_enabled")
sections.ESPMain:AddElement(elements.enableMainESP)

elements.antiClutter = Toggle:new("Anti-Clutter", function(state)
    ESPConfig.AntiClutter = state
end, ESPConfig.AntiClutter, "anti_clutter_enabled")
sections.ESPMain:AddElement(elements.antiClutter)

local ResourceCategories = {"Ores", "Plants", "World Items", "Loot"}
multiSections.Resources = tabs.Entities:AddMultiSection("Resources ESP", ResourceCategories, 10, 220, 300, 350)

elements.oresMainToggle = Toggle:new("Enable Ores ESP", function(state)
    ESPConfig.OresEnabled = state
end, ESPConfig.OresEnabled, "ores_main_enabled")
multiSections.Resources:AddElement(elements.oresMainToggle, 1)

elements.oresMultiSelect = MultiSelectDropdown:new("Ore Types", 
    {"Stone", "Metal", "Phosphate"}, 
    function(selected)
        ESPConfig.SelectedOres = selected
    end, 
    ESPConfig.SelectedOres, 
    "selected_ores")
multiSections.Resources:AddElement(elements.oresMultiSelect, 1)

elements.stoneColorPicker = ColorPicker:new("Stone Color", function(color)
    ESPConfig.Colors.Stone = color
end, ESPConfig.Colors.Stone)
multiSections.Resources:AddElement(elements.stoneColorPicker, 1)

elements.metalColorPicker = ColorPicker:new("Metal Color", function(color)
    ESPConfig.Colors.Metal = color
end, ESPConfig.Colors.Metal)
multiSections.Resources:AddElement(elements.metalColorPicker, 1)

elements.phosphateColorPicker = ColorPicker:new("Phosphate Color", function(color)
    ESPConfig.Colors.Phosphate = color
end, ESPConfig.Colors.Phosphate)
multiSections.Resources:AddElement(elements.phosphateColorPicker, 1)

elements.oresDistance = Slider:new("Ores Distance", 100, 3000, ESPConfig.OresDistance, function(value)
    ESPConfig.OresDistance = value
end, "ores_distance")
multiSections.Resources:AddElement(elements.oresDistance, 1)

elements.oresShowDistance = Toggle:new("Show Distance", function(state)
    ESPConfig.OresShowDistance = state
end, ESPConfig.OresShowDistance, "ores_show_distance")
multiSections.Resources:AddElement(elements.oresShowDistance, 1)

elements.oresTracers = Toggle:new("Ores Tracers", function(state)
    ESPConfig.OresTracers = state
end, ESPConfig.OresTracers, "ores_tracers")
multiSections.Resources:AddElement(elements.oresTracers, 1)

elements.plantsMainToggle = Toggle:new("Enable Plants ESP", function(state)
    ESPConfig.PlantsEnabled = state
end, ESPConfig.PlantsEnabled, "plants_main_enabled")
multiSections.Resources:AddElement(elements.plantsMainToggle, 2)

elements.plantsMultiSelect = MultiSelectDropdown:new("Plant Types", 
    {"Wool", "Raspberry", "Corn", "Tomato", "Blueberry", "Lemon"}, 
    function(selected)
        ESPConfig.SelectedPlants = selected
    end, 
    ESPConfig.SelectedPlants, 
    "selected_plants")
multiSections.Resources:AddElement(elements.plantsMultiSelect, 2)

local plantTypes = {"Wool", "Raspberry", "Corn", "Tomato", "Blueberry", "Lemon"}
for _, plant in ipairs(plantTypes) do
    elements[plant:lower() .. "ColorPicker"] = ColorPicker:new(plant .. " Color", function(color)
        ESPConfig.Colors[plant] = color
    end, ESPConfig.Colors[plant])
    multiSections.Resources:AddElement(elements[plant:lower() .. "ColorPicker"], 2)
end

elements.plantsDistance = Slider:new("Plants Distance", 100, 4000, ESPConfig.PlantsDistance, function(value)
    ESPConfig.PlantsDistance = value
end, "plants_distance")
multiSections.Resources:AddElement(elements.plantsDistance, 2)

elements.plantsShowDistance = Toggle:new("Show Distance", function(state)
    ESPConfig.PlantsShowDistance = state
end, ESPConfig.PlantsShowDistance, "plants_show_distance")
multiSections.Resources:AddElement(elements.plantsShowDistance, 2)

elements.plantsTracers = Toggle:new("Plants Tracers", function(state)
    ESPConfig.PlantsTracers = state
end, ESPConfig.PlantsTracers, "plants_tracers")
multiSections.Resources:AddElement(elements.plantsTracers, 2)

elements.dropsToggle = Toggle:new("Drops ESP", function(state)
    ESPConfig.DropsEnabled = state
end, ESPConfig.DropsEnabled, "drops_enabled")
elements.dropsToggle:AddColorPicker("Drops Color", function(color)
    ESPConfig.Colors.Drops = color
end, ESPConfig.Colors.Drops, "drops_color")
multiSections.Resources:AddElement(elements.dropsToggle, 3)

elements.dropsDistance = Slider:new("Drops Distance", 100, 4000, ESPConfig.DropsDistance, function(value)
    ESPConfig.DropsDistance = value
end, "drops_distance")
multiSections.Resources:AddElement(elements.dropsDistance, 3)

elements.digPileToggle = Toggle:new("DigPile ESP", function(state)
    ESPConfig.DigPileEnabled = state
end, ESPConfig.DigPileEnabled, "digpile_enabled")
elements.digPileToggle:AddColorPicker("DigPile Color", function(color)
    ESPConfig.Colors.DigPile = color
end, ESPConfig.Colors.DigPile, "digpile_color")
multiSections.Resources:AddElement(elements.digPileToggle, 3)

elements.digPileDistance = Slider:new("DigPile Distance", 100, 4000, ESPConfig.DigPileDistance, function(value)
    ESPConfig.DigPileDistance = value
end, "digpile_distance")
multiSections.Resources:AddElement(elements.digPileDistance, 3)

elements.keycardToggle = Toggle:new("Keycard ESP", function(state)
    ESPConfig.KeycardEnabled = state
end, ESPConfig.KeycardEnabled, "keycard_enabled")
elements.keycardToggle:AddColorPicker("Keycard Color", function(color)
    ESPConfig.Colors.Keycard = color
end, ESPConfig.Colors.Keycard, "keycard_color")
multiSections.Resources:AddElement(elements.keycardToggle, 4)

elements.monumentSpawnsToggle = Toggle:new("Monument Spawns ESP", function(state)
    ESPConfig.MonumentSpawnsEnabled = state
end, ESPConfig.MonumentSpawnsEnabled, "monument_spawns_enabled")
multiSections.Resources:AddElement(elements.monumentSpawnsToggle, 4)

elements.lootMultiSelect = MultiSelectDropdown:new("Loot Types", 
    {"TrashCan", "OilBarrel", "LockedWoodenCrate", "LockedMetalCrate", "FoodCrate"}, 
    function(selected)
        ESPConfig.SelectedLoot = selected
    end, 
    ESPConfig.SelectedLoot, 
    "selected_loot")
multiSections.Resources:AddElement(elements.lootMultiSelect, 4)

local lootTypes = {"TrashCan", "OilBarrel", "LockedWoodenCrate", "LockedMetalCrate", "FoodCrate"}
for _, loot in ipairs(lootTypes) do
    local displayName = loot:gsub("([A-Z])", " %1"):gsub("^%s+", "")
    elements[loot:lower() .. "ColorPicker"] = ColorPicker:new(displayName .. " Color", function(color)
        ESPConfig.Colors[loot] = color
    end, ESPConfig.Colors[loot])
    multiSections.Resources:AddElement(elements[loot:lower() .. "ColorPicker"], 4)
end

local EntityCategories = {"Soldiers", "Animals", "Players", "Misc"}
multiSections.Entities = tabs.Entities:AddMultiSection("Entities ESP", EntityCategories, 320, 220, 300, 350)

elements.soldiersToggle = Toggle:new("Soldier ESP", function(state)
    ESPConfig.SoldiersEnabled = state
end, ESPConfig.SoldiersEnabled, "soldiers_enabled")
elements.soldiersToggle:AddColorPicker("Soldier Color", function(color)
    ESPConfig.Colors.Soldier = color
end, ESPConfig.Colors.Soldier, "soldiers_color")
multiSections.Entities:AddElement(elements.soldiersToggle, 1)

elements.soldiersDistance = Slider:new("Soldiers Distance", 100, 3000, ESPConfig.SoldiersDistance, function(value)
    ESPConfig.SoldiersDistance = value
end, "soldiers_distance")
multiSections.Entities:AddElement(elements.soldiersDistance, 1)

elements.soldiersShowDistance = Toggle:new("Show Distance", function(state)
    ESPConfig.SoldiersShowDistance = state
end, ESPConfig.SoldiersShowDistance, "soldiers_show_distance")
multiSections.Entities:AddElement(elements.soldiersShowDistance, 1)

elements.soldiersTracers = Toggle:new("Soldiers Tracers", function(state)
    ESPConfig.SoldiersTracers = state
end, ESPConfig.SoldiersTracers, "soldiers_tracers")
multiSections.Entities:AddElement(elements.soldiersTracers, 1)

elements.animalsMainToggle = Toggle:new("Enable Animals ESP", function(state)
    ESPConfig.AnimalsEnabled = state
end, ESPConfig.AnimalsEnabled, "animals_main_enabled")
multiSections.Entities:AddElement(elements.animalsMainToggle, 2)

elements.animalsMultiSelect = MultiSelectDropdown:new("Animal Types", 
    {"Deer", "Wildboar", "Wolf"}, 
    function(selected)
        ESPConfig.SelectedAnimals = selected
    end, 
    ESPConfig.SelectedAnimals, 
    "selected_animals")
multiSections.Entities:AddElement(elements.animalsMultiSelect, 2)

local animalTypes = {"Deer", "Wildboar", "Wolf"}
for _, animal in ipairs(animalTypes) do
    elements[animal:lower() .. "ColorPicker"] = ColorPicker:new(animal .. " Color", function(color)
        ESPConfig.Colors[animal] = color
    end, ESPConfig.Colors[animal])
    multiSections.Entities:AddElement(elements[animal:lower() .. "ColorPicker"], 2)
end

elements.animalsDistance = Slider:new("Animals Distance", 100, 4000, ESPConfig.AnimalsDistance, function(value)
    ESPConfig.AnimalsDistance = value
end, "animals_distance")
multiSections.Entities:AddElement(elements.animalsDistance, 2)

elements.animalsShowDistance = Toggle:new("Show Distance", function(state)
    ESPConfig.AnimalsShowDistance = state
end, ESPConfig.AnimalsShowDistance, "animals_show_distance")
multiSections.Entities:AddElement(elements.animalsShowDistance, 2)

elements.animalsTracers = Toggle:new("Animals Tracers", function(state)
    ESPConfig.AnimalsTracers = state
end, ESPConfig.AnimalsTracers, "animals_tracers")
multiSections.Entities:AddElement(elements.animalsTracers, 2)

elements.sleeperToggle = Toggle:new("Sleeper ESP", function(state)
    ESPConfig.SleeperEnabled = state
end, ESPConfig.SleeperEnabled, "sleeper_enabled")
elements.sleeperToggle:AddColorPicker("Sleeper Color", function(color)
    ESPConfig.Colors.Sleeper = color
end, ESPConfig.Colors.Sleeper, "sleeper_color")
multiSections.Entities:AddElement(elements.sleeperToggle, 3)

elements.sleeperDistance = Slider:new("Sleeper Distance", 100, 3000, ESPConfig.SleeperDistance, function(value)
    ESPConfig.SleeperDistance = value
end, "sleeper_distance")
multiSections.Entities:AddElement(elements.sleeperDistance, 3)

elements.bodyBagToggle = Toggle:new("Body Bag ESP", function(state)
    ESPConfig.BodyBagEnabled = state
end, ESPConfig.BodyBagEnabled, "body_bag_enabled")
elements.bodyBagToggle:AddColorPicker("Body Bag Color", function(color)
    ESPConfig.Colors.BodyBag = color
end, ESPConfig.Colors.BodyBag, "body_bag_color")
multiSections.Entities:AddElement(elements.bodyBagToggle, 3)

elements.bodyBagDistance = Slider:new("Body Bag Distance", 100, 3000, ESPConfig.BodyBagDistance, function(value)
    ESPConfig.BodyBagDistance = value
end, "body_bag_distance")
multiSections.Entities:AddElement(elements.bodyBagDistance, 3)

elements.modAdminViewer = Toggle:new("Mod/Admin Viewer", function(state)
    ESPConfig.ModAdminViewerEnabled = state
end, ESPConfig.ModAdminViewerEnabled, "mod_admin_viewer_enabled")
multiSections.Entities:AddElement(elements.modAdminViewer, 4)

sections.MainPlayerList = tabs.Player:AddPlayerList("Player List", 10, 60, 610, 450)

sections.General = tabs.Settings:AddSection("General Settings", 10, 60, 300, 200)

elements.toggleKeybindsList = Toggle:new("Keybinds List", function(state)
    Library.KeybindsList.visible = state
end, Library.KeybindsList.visible, "keybinds_list_enabled")
sections.General:AddElement(elements.toggleKeybindsList)

elements.menu_toggle = Toggle:new("Menu Toggle", function(state)
end, false, "menu_visible")
elements.menu_keybind = elements.menu_toggle:AddKeybind(0x12, "Toggle") 
sections.General:AddElement(elements.menu_toggle)

elements.targethud_toggle = Toggle:new("Target HUD", function(state)
    Library.TargetHUD.visible = state
end, Library.TargetHUD.visible, "target_hud")
sections.General:AddElement(elements.targethud_toggle)

elements.enableAnimations = Toggle:new("Enable Animations", function(state)
    Library.Settings.Tween = state
end, Library.Settings.Tween, "animations_enabled")
sections.General:AddElement(elements.enableAnimations)

elements.animationSpeed = Slider:new("Animation Speed", 0.05, 0.3, Library.Settings.Animation.Speed, function(value)
    Library.Settings.Animation.Speed = value
end, "animation_speed")
sections.General:AddElement(elements.animationSpeed)

sections.Theme = tabs.Settings:AddSection("Theme Settings", 320, 60, 300, 415)

local themeNames = {}
for name, _ in pairs(Library.Theme.List) do
    table.insert(themeNames, name)
end

elements.themeSelector = Dropdown:new("Select Theme", themeNames, function(selected)
end, Library.Theme.Selected, "selected_theme")
sections.Theme:AddElement(elements.themeSelector)

elements.applyThemeButton = Button:new("Apply Theme", function()
    if elements.themeSelector.value then
        Library.Theme.Selected = elements.themeSelector.value
        Library.RefreshTheme()
    end
end)
sections.Theme:AddElement(elements.applyThemeButton)

local themeKeys = {
    "Accent", "Warning", "Error", "Header", "Text", "Secondary",
    "Outer", "Light", "Dark", "High", "Mid", "Low", "Stroke",
    "AccentLight", "MidLight"
}

elements.colorPickers = {}
for i, key in ipairs(themeKeys) do
    local row = math.floor((i-1)/2)
    local col = (i-1) % 2
    
    elements["label_"..key] = {
        Render = function()
            local x, y = sections.Theme:GetAbsolutePos()
            local theme = Library.Theme.List[Library.Theme.Selected]
            local labelX = 320 + 10 + (col * 150)
            local labelY = 60 + 40 + (row * 25)
            
            render.text(labelX, labelY, theme.Text[1], theme.Text[2], theme.Text[3], theme.Text[4], 
                        1, false, key)
        end
    }
    
    elements[key.."Picker"] = ColorPicker:new(key, function(color)
        if Library.Theme.List[Library.Theme.Selected] then
            Library.Theme.List[Library.Theme.Selected][key] = color
            for _, window in ipairs(Library.Windows) do
                window.theme = Library.Theme.List[Library.Theme.Selected]
            end
        end
    end, Library.Theme.List[Library.Theme.Selected][key])
    elements[key.."Picker"].x = 320 + 80 + (col * 150)
    elements[key.."Picker"].y = 60 + 35 + (row * 25)
    elements[key.."Picker"].width = 20
    elements[key.."Picker"].height = 15
    
    sections.Theme:AddElement(elements[key.."Picker"])
end

elements.resetThemeButton = Button:new("Reset to Default", function()
    local currentTheme = Library.Theme.Selected
    local defaultTheme = Library.Theme.List[currentTheme]
    
    local originalTheme = {}
    for name, theme in pairs(Library.Theme.List) do
        if name == currentTheme then
            originalTheme = table.clone(theme)
            break
        end
    end
    
    for key, value in pairs(originalTheme) do
        Library.Theme.List[currentTheme][key] = value
        if elements[key.."Picker"] then
            elements[key.."Picker"].color = value
        end
    end
    
    for _, window in ipairs(Library.Windows) do
        window.theme = Library.Theme.List[currentTheme]
    end
end)
sections.Theme:AddElement(elements.resetThemeButton)

function table.clone(org)
    local copy = {}
    for k, v in pairs(org) do
        if type(v) == "table" then
            copy[k] = table.clone(v)
        else
            copy[k] = v
        end
    end
    return copy
end

sections.ConfigManagement = tabs.Settings:AddSection("Config Management", 10, 270, 300, 325)
local availableConfigs = Library.ConfigSystem:GetConfigs()
if #availableConfigs == 0 then
    availableConfigs = {"No configs found"}
end

elements.configNameInput = Input:new("Config Name", function(value)
end, Library.ConfigSystem.Configs[1], "config_name")
sections.ConfigManagement:AddElement(elements.configNameInput)

elements.configList = List:new("Available Configs", availableConfigs, function(selected)
    if selected and selected ~= "No configs found" then
        elements.configNameInput:Set(selected)
        Library.ConfigSystem.CurrentConfig = selected
    end
end, nil, 6, "config_list")
sections.ConfigManagement:AddElement(elements.configList)

elements.saveConfigButton = Button:new("Save Config", function()
    local configName = elements.configNameInput.value
    if configName and configName ~= "" and configName ~= "No configs found" then
        if Library.ConfigSystem:SaveConfig(configName) then
            Library.Notify("Config Saved", "Successfully saved settings to "..configName..".json")
            elements.configList.options = Library.ConfigSystem:GetConfigs()
        else
            Library.Notify("Config Error", "Failed to save config: "..configName, "error", 5000)
        end
    else
        Library.Notify("Config Error", "Configs cannot be saved without a name", "error", 5000)
    end
end)
sections.ConfigManagement:AddElement(elements.saveConfigButton)

elements.loadConfigButton = Button:new("Load Config", function()
    local configName = elements.configNameInput.value
    if configName and configName ~= "" and configName ~= "No configs found" then
        if Library.ConfigSystem:LoadConfig(configName) then
            Library.Notify("Config Loaded", "Successfully loaded config "..configName..".json")
        else
            Library.Notify("Config Error", "Failed to load config: "..configName, "error", 5000)
        end
    else
        Library.Notify("Config Error", "Please select a valid config", "error", 5000)
    end
end)
sections.ConfigManagement:AddElement(elements.loadConfigButton)

local deleteConfigButton = Button:new("Delete Config", function()
    local configName = elements.configNameInput.value
    if configName and configName ~= "" and configName ~= "No configs found" then
        if Library.ConfigSystem:DeleteConfig(configName) then
            elements.configList.options = Library.ConfigSystem:GetConfigs()
            elements.configNameInput:Set("")
            Library.Notify("Config Deleted", "Successfully deleted config "..configName..".json")
        else
            Library.Notify("Config Error", "Failed to delete config: "..configName, "error", 5000)
        end
    else
        Library.Notify("Config Error", "Please select a valid config", "error", 5000)
    end
end)
sections.ConfigManagement:AddElement(deleteConfigButton)

local refreshConfigsButton = Button:new("Refresh List", function()
    Library.ConfigSystem:GetConfigs()
end)
sections.ConfigManagement:AddElement(refreshConfigsButton)

sections.Watermark = tabs.Settings:AddSection("Watermark Settings", 320, 485, 300, 110)
    
elements.enableWatermark = Toggle:new("Enable Watermark", function(state)
    if Library.Watermark then
        Library.Watermark:SetVisible(state)
    end
end, true, "watermark_enabled")
sections.Watermark:AddElement(elements.enableWatermark)

elements.watermarkPosition = Dropdown:new("Position", 
    {"top-right", "top-left", "bottom-right", "bottom-left"},
    function(selected)
        if Library.Watermark then
            Library.Watermark:SetPosition(selected)
        end
    end, "top-right", "watermark_position")
sections.Watermark:AddElement(elements.watermarkPosition)

local aimbot = {
    locked_target = nil,
    current_frame_target_data = nil,
    last_target_screen_pos = nil,
    last_target_world_pos = nil,
    last_update_time = 0,
    movement_history = {},
    last_local_position = vector(0, 0, 0),
    local_velocity = vector(0, 0, 0),
    previous_keybind_state = false,
    current_hitchance = 0,
    weapon_velocities = { -- hostilepair / 1033447524536680479
        ["Military Barret"] = 2500.00,
        ["Military PKM"] = 2400.00,
        ["Salvaged M14"] = 2100.00,
        ["Salvaged AK47"] = 2100.00,
        ["Military M4A1"] = 2100.00,
        ["Bruno's M4A1"] = 2100.00,
        ["Military MP7"] = 1900.00,
        ["Salvaged Python"] = 1800.00,
        ["Salvaged SMG"] = 1800.00,
        ["Salvaged AK74U"] = 1800.00,
        ["Salvaged Pipe Rifle"] = 1700.00,
        ["Salvaged Skorpion"] = 1600.00,
        ["Salvaged P250"] = 1400.00,
        ["Salvaged Pump Action"] = 650.00,
        ["Military AA12"] = 600.00,
        ["Salvaged Break Action"] = 550.00,
        ["Crossbow"] = 370.00,
        ["Wooden Bow"] = 260.00,
        ["Nail Gun"] = 165.00,
        ["Salvaged RPG"] = 100.00
    },
    
    get_local_player_data = function(self)
        local local_player = entity.get_local_player()
        if local_player then
            local success, pos_x, pos_y, pos_z = pcall(function()
                return local_player:get_position()
            end)
            
            if success and pos_x and pos_y and pos_z then
                local current_pos = vector(pos_x, pos_y, pos_z)
                
                if self.last_local_position and self.last_local_position.x and self.last_local_position.y and self.last_local_position.z then
                    local deltaTime = utility.get_delta_time()
                    if deltaTime and deltaTime > 0 and deltaTime < 1.0 then
                        local dx = current_pos.x - self.last_local_position.x
                        local dy = current_pos.y - self.last_local_position.y
                        local dz = current_pos.z - self.last_local_position.z
                        
                        self.local_velocity = vector(dx / deltaTime, dy / deltaTime, dz / deltaTime)
                    else
                        if not self.local_velocity then
                            self.local_velocity = vector(0, 0, 0)
                        end
                    end
                else
                    self.local_velocity = vector(0, 0, 0)
                end
                
                self.last_local_position = current_pos
                return current_pos
            end
        end
        
        local success, cam_x, cam_y, cam_z = pcall(function()
            return game.get_camera_pos()
        end)
        
        if success and cam_x and cam_y and cam_z then
            local cam_pos = vector(cam_x, cam_y, cam_z)
            
            if self.last_local_position and self.last_local_position.x and self.last_local_position.y and self.last_local_position.z then
                local deltaTime = utility.get_delta_time()
                if deltaTime and deltaTime > 0 and deltaTime < 1.0 then
                    local dx = cam_pos.x - self.last_local_position.x
                    local dy = cam_pos.y - self.last_local_position.y
                    local dz = cam_pos.z - self.last_local_position.z
                    
                    self.local_velocity = vector(dx / deltaTime, dy / deltaTime, dz / deltaTime)
                end
            else
                self.local_velocity = vector(0, 0, 0)
            end
            
            self.last_local_position = cam_pos
            return cam_pos
        else
            return vector(0, 0, 0)
        end
    end,
    
    is_active = function(self)
        if not AimbotConfig.enabled then
            return false
        end
        
        local keybind_active = false
        if elements.aimbotEnabled.keybind then
            if elements.aimbotEnabled.keybind.IsActive then
                keybind_active = elements.aimbotEnabled.keybind:IsActive()
            else
                keybind_active = utility.key_state(AimbotConfig.keybind.key)
            end
        else
            keybind_active = utility.key_state(AimbotConfig.keybind.key)
        end
        
        return keybind_active
    end,
    
    get_best_hitbox = function(self, player_entity)
        if not player_entity or not AimbotConfig.hitboxes or #AimbotConfig.hitboxes == 0 then
            return "Head"
        end
        
        local cursor_x, cursor_y = input.cursor_position()
        local closest_distance = math.huge
        local best_hitbox = AimbotConfig.hitboxes[1]
        
        for _, hitbox in ipairs(AimbotConfig.hitboxes) do
            local bone_x, bone_y, bone_z = player_entity:bone_position(hitbox)
            if bone_x and bone_y and bone_z then
                local screen_x, screen_y = utility.world_to_screen(bone_x, bone_y, bone_z)
                if screen_x and screen_y and screen_x > 0 and screen_y > 0 then
                    local distance = math.sqrt((screen_x - cursor_x)^2 + (screen_y - cursor_y)^2)
                    if distance < closest_distance then
                        closest_distance = distance
                        best_hitbox = hitbox
                    end
                end
            end
        end
        
        return best_hitbox
    end,
    
    get_player_velocity = function(self, target)
        if not target then return vector(0, 0, 0) end
        
        local workspace = game.get_workspace()
        if not workspace then return vector(0, 0, 0) end

        local char = workspace:find_first_child(target:get_name())
        if not char then return vector(0, 0, 0) end

        local hrp = char:find_first_child("HumanoidRootPart")
        if not hrp then return vector(0, 0, 0) end
        
        local success, vel_x, vel_y, vel_z = pcall(function()
            return hrp:get_velocity()
        end)
        
        if success and vel_x and vel_y and vel_z then
            return vector(vel_x, vel_y, vel_z)
        else
            return vector(0, 0, 0)
        end
    end,

    get_instance_velocity = function(self, target)
        if not target then return vector(0, 0, 0) end

        local hrp = target:find_first_child("HumanoidRootPart")
        if not hrp then return vector(0, 0, 0) end
        
        local success, vel_x, vel_y, vel_z = pcall(function()
            return hrp:get_velocity()
        end)
        
        if success and vel_x and vel_y and vel_z then
            return vector(vel_x, vel_y, vel_z)
        else
            return vector(0, 0, 0)
        end
    end,

    calculate_prediction = function(self, target, current_pos)
        local weapon_config = AimbotConfig.weapons[AimbotConfig.activeWeapon]
        if not weapon_config or not weapon_config.predictionEnabled then
            return current_pos
        end
        
        if not current_pos or not current_pos.x or not current_pos.y or not current_pos.z then
            return vector(0, 0, 0)
        end
        
        local predicted_pos = vector(current_pos.x, current_pos.y, current_pos.z)
        local velocity = vector(0, 0, 0)
        local targetId = target.name or "unknown"
        
        if target.type == "player" and target.entity then
            local vel = self:get_player_velocity(target.entity)
            if vel and vel.x and vel.y and vel.z then
                velocity = vector(vel.x or 0, vel.y or 0, vel.z or 0)
            end
        elseif target.instance then
            local vel = self:get_instance_velocity(target.instance)
            if vel and vel.x and vel.y and vel.z then
                velocity = vector(vel.x or 0, vel.y or 0, vel.z or 0)
            end
        end
        
        -- Add movement data to tracker
        pcall(function()
            MovementTracker:addMovement(targetId, velocity, current_pos)
        end)
        
        local local_pos = self:get_local_player_data()
        if not local_pos or not local_pos.x or not local_pos.y or not local_pos.z then
            return predicted_pos
        end
        
        local distance = math.sqrt(
            (local_pos.x - current_pos.x)^2 + 
            (local_pos.y - current_pos.y)^2 + 
            (local_pos.z - current_pos.z)^2
        )
        
        local bullet_speed = weapon_config.bulletVelocity or 1294.75
        local prediction_time = (distance / bullet_speed) * (weapon_config.predictionStrength or 1.0)
        
        if weapon_config.predictionMethod == "Experimental" then
            -- Use enhanced prediction with pattern recognition
            local enhanced_pos = MovementTracker:getEnhancedPrediction(targetId, current_pos, prediction_time)
            if enhanced_pos then
                predicted_pos = enhanced_pos
            end
        else
            -- Regular prediction
            if velocity and velocity.x and velocity.y and velocity.z then
                predicted_pos.x = predicted_pos.x + (velocity.x * prediction_time)
                predicted_pos.y = predicted_pos.y + (velocity.y * prediction_time)
                predicted_pos.z = predicted_pos.z + (velocity.z * prediction_time)
            end
        end
        
        -- Apply bullet drop compensation
        if weapon_config.bulletDrop and weapon_config.bulletDrop > 0 then
            local gravity = weapon_config.gravity or 98.1
            local time_to_target = distance / bullet_speed
            
            local base_drop_compensation = 0.5 * gravity * (time_to_target * time_to_target) * weapon_config.bulletDrop
            
            local y_movement_compensation = 0
            if self.local_velocity and self.local_velocity.y and math.abs(self.local_velocity.y) > 2.0 then
                y_movement_compensation = -self.local_velocity.y * time_to_target * 0.15
            end
            
            local terrain_compensation = 0
            local height_difference = predicted_pos.y - local_pos.y
            if math.abs(height_difference) > 10 then
                terrain_compensation = height_difference * 0.03 * weapon_config.bulletDrop
            end
            
            local total_drop_compensation = base_drop_compensation + y_movement_compensation + terrain_compensation
            
            predicted_pos.y = predicted_pos.y + total_drop_compensation
        end
        
        return predicted_pos
    end,
    
    get_target_position = function(self, target)
        if not target then return vector(0, 0, 0) end
        
        local base_pos = vector(0, 0, 0)
        
        if target.type == "player" and target.entity then
            local best_hitbox = self:get_best_hitbox(target.entity)
            local bone_x, bone_y, bone_z = target.entity:bone_position(best_hitbox)

            if bone_x and bone_y and bone_z then
                base_pos = vector(bone_x, bone_y, bone_z)
            else
                local pos_x, pos_y, pos_z = target.entity:get_position()
                base_pos = vector(pos_x, pos_y + 1.5, pos_z)
            end
        elseif target.pos then
            base_pos = target.pos
        end
        
        return self:calculate_prediction(target, base_pos)
    end,
    
    bezier_curve = function(self, t, p0, p1, p2, p3)
        local u = 1 - t
        local tt = t * t
        local uu = u * u
        local uuu = uu * u
        local ttt = tt * t
        
        return uuu * p0 + 3 * uu * t * p1 + 3 * u * tt * p2 + ttt * p3
    end,
    
    calculate_mouse_movement = function(self, delta_x, delta_y)
        -- Check for snap aim: speed at max (100) and smoothing disabled
        if AimbotConfig.speed >= 100 and not AimbotConfig.smoothingEnabled then
            return delta_x, delta_y  -- Return full delta for instant snap
        end
        
        local move_x, move_y = delta_x, delta_y
        local distance = math.sqrt(delta_x^2 + delta_y^2)
        
        -- Apply movement curve
        if AimbotConfig.mouseMovement == "Exponential" then
            local exp_factor = 1.0
            if distance > 5 then
                exp_factor = math.pow(distance / 50, 1.8)
                exp_factor = math.min(exp_factor, 4.0)
            end
            
            move_x = delta_x * exp_factor
            move_y = delta_y * exp_factor
            
        elseif AimbotConfig.mouseMovement == "Curved" then
            local normalized_distance = math.min(distance / 100, 1.0)
            
            local p0 = 0.0
            local p1 = 0.2
            local p2 = 0.8
            local p3 = 1.0
            
            local curve_factor = self:bezier_curve(normalized_distance, p0, p1, p2, p3)
            curve_factor = math.max(curve_factor, 0.1)
            
            move_x = delta_x * curve_factor
            move_y = delta_y * curve_factor
        end
        
        -- Apply speed factor
        local speed_factor = AimbotConfig.speed / 100.0
        move_x = move_x * speed_factor
        move_y = move_y * speed_factor
        
        -- Apply smoothing if enabled
        if AimbotConfig.smoothingEnabled then
            local smoothing_factor = AimbotConfig.smoothing / 50.0
            local alpha = math.max(0.02, math.min(0.95, smoothing_factor))
            
            move_x = move_x * alpha
            move_y = move_y * alpha
        end
        
        return move_x, move_y
    end,
    
    get_live_animals = function(self)
        local animals = {}
        
        local workspace = game.get_data_model()
        local workspace_folder = workspace:find_first_child_of_class("Workspace")
        if not workspace_folder then return animals end
        
        local animals_folder = workspace_folder:find_first_child("Animals")
        if not animals_folder then return animals end
        
        local animal_children = animals_folder:get_children()
        
        for _, animal_instance in pairs(animal_children) do
            local humanoid_root_part = animal_instance:find_first_child("HumanoidRootPart")
            
            if humanoid_root_part then
                local pos_x, pos_y, pos_z = humanoid_root_part:get_position()
                if pos_x and pos_y and pos_z then
                    local full_name = animal_instance:get_name()
                    local animal_name = "Animal"
                    
                    if string.find(full_name:lower(), "deer") then
                        animal_name = "Deer"
                    elseif string.find(full_name:lower(), "wolf") then
                        animal_name = "Wolf"
                    elseif string.find(full_name:lower(), "boar") then
                        animal_name = "Wildboar"
                    end
                    
                    table.insert(animals, {
                        type = "animal",
                        entity = nil,
                        pos = vector(pos_x, pos_y+2, pos_z),
                        name = animal_name,
                        instance = animal_instance
                    })
                end
            end
        end
        
        return animals
    end,
    
    get_live_soldiers = function(self)
        local soldiers = {}
        
        local workspace = game.get_data_model()
        local workspace_folder = workspace:find_first_child_of_class("Workspace")
        if not workspace_folder then return soldiers end
        
        local military_folder = workspace_folder:find_first_child("Military")
        if not military_folder then return soldiers end
        
        local military_children = military_folder:get_children()
        
        for _, base in pairs(military_children) do
            local base_children = base:get_children()
            for _, soldier_folder in pairs(base_children) do
                if soldier_folder:get_name() == "Soldier" then
                    local humanoid_root_part = soldier_folder:find_first_child("HumanoidRootPart")
                    if humanoid_root_part then
                        local pos_x, pos_y, pos_z = humanoid_root_part:get_position()
                        if pos_x and pos_y and pos_z then
                            table.insert(soldiers, {
                                type = "soldier",
                                entity = nil,
                                pos = vector(pos_x, pos_y, pos_z),
                                name = "Soldier",
                                instance = soldier_folder
                            })
                        end
                    end
                end
            end
        end
        
        return soldiers
    end,
    
    get_best_target = function(self)
        local current_keybind_state = self:is_active()
        
        -- Check for sticky aim behavior
        if AimbotConfig.sticky then
            -- If keybind was just released, clear the locked target
            if self.previous_keybind_state and not current_keybind_state then
                self.locked_target = nil
                self.last_target_world_pos = nil
                self.last_target_screen_pos = nil
            end
            
            -- If we have a locked target and keybind is active, stick to it
            if self.locked_target and current_keybind_state then
                local target_pos = self:get_target_position(self.locked_target)
                
                if not target_pos:is_zero() then
                    local is_valid = true
                    if self.locked_target.type == "player" and self.locked_target.entity then
                        is_valid = self.locked_target.entity:is_alive()
                    end
                    
                    if is_valid then
                        local local_pos = self:get_local_player_data()
                        local max_distance_sq = AimbotConfig.maxDistance * AimbotConfig.maxDistance
                        
                        if (local_pos - target_pos):length_sqr() <= max_distance_sq then
                            local screen_x, screen_y = utility.world_to_screen(target_pos.x, target_pos.y, target_pos.z)
                            if screen_x and screen_y and screen_x > 0 and screen_y > 0 then
                                self.last_target_world_pos = target_pos
                                self.last_target_screen_pos = vector(screen_x, screen_y, 0)
                                self.last_update_time = utility.get_tickcount() / 1000
                                self.previous_keybind_state = current_keybind_state
                                return {
                                    target = self.locked_target,
                                    screen_pos = self.last_target_screen_pos,
                                    bone_pos = target_pos
                                }
                            end
                        end
                    end
                end
                
                -- Target is no longer valid, clear it
                self.locked_target = nil
            end
        end
        
        self.previous_keybind_state = current_keybind_state
        
        if not current_keybind_state then
            self.current_frame_target_data = nil
            return nil
        end
        
        local local_player = entity.get_local_player()
        if not local_player then 
            return nil 
        end
        
        local local_pos = self:get_local_player_data()
        local cursor_x, cursor_y = input.cursor_position()
        
        local fov_radius = AimbotConfig.fov
        local fov_radius_sq = fov_radius * fov_radius
        local max_distance = AimbotConfig.maxDistance
        local max_distance_sq = max_distance * max_distance
        local selected_targets = AimbotConfig.targets
        
        local closest_distance_sq = math.huge
        local candidate_target = nil
        local all_targets = {}
        
        local function is_target_type_selected(target_type)
            for _, selected in ipairs(selected_targets) do
                if selected == target_type then
                    return true
                end
            end
            return false
        end
        
        if is_target_type_selected("Players") then
            local players = entity.get_players(false)
            if players then
                for _, player in pairs(players) do
                    if player ~= local_player and player:is_alive() then
                        local should_target = true

                        if AimbotConfig.visible and not player:is_visible() then
                            should_target = false
                        end
                        
                        if not is_target_type_selected("Whitelisteds") and (player:is_whitelisted() or Library.PlayerListElement.manualStatusChanges[player:get_name()] == "Friend") then
                            should_target = false
                        end
                        
                        if should_target then
                            table.insert(all_targets, {
                                type = "player",
                                entity = player,
                                pos = nil,
                                name = player:get_name() or "Player"
                            })
                        end
                    end
                end
            end
        end
        
        if is_target_type_selected("Soldiers") then
            local live_soldiers = self:get_live_soldiers()
            for _, soldier in ipairs(live_soldiers) do
                table.insert(all_targets, soldier)
            end
        end
        
        if is_target_type_selected("Animals") then
            local live_animals = self:get_live_animals()
            for _, animal in ipairs(live_animals) do
                table.insert(all_targets, animal)
            end
        end
        
        for _, target in ipairs(all_targets) do
            local target_pos = self:get_target_position(target)
            if target_pos == nil or target_pos:is_zero() then
                goto continue 
            end
            
            local dist_sq = (local_pos - target_pos):length_sqr()
            if dist_sq > max_distance_sq then goto continue end
            
            local screen_x, screen_y = utility.world_to_screen(target_pos.x, target_pos.y, target_pos.z)
            if not screen_x or not screen_y or screen_x <= 0 or screen_y <= 0 then goto continue end
            
            local cursor_dist_sq = (screen_x - cursor_x)^2 + (screen_y - cursor_y)^2
            if cursor_dist_sq > fov_radius_sq then goto continue end
            
            local selection_value = cursor_dist_sq
            
            if AimbotConfig.targetSelection == "Closest to Player" then
                selection_value = dist_sq  -- Use squared distance for player proximity
            elseif AimbotConfig.targetSelection == "Lowest HP" and target.type == "player" and target.entity then
                local health = target.entity:get_health() or 100
                selection_value = health  -- Lower health = lower value = higher priority
            end
            
            if selection_value < closest_distance_sq then
                closest_distance_sq = selection_value
                candidate_target = {
                    target = target,
                    screen_pos = vector(screen_x, screen_y, 0),
                    bone_pos = target_pos
                }
            end
            ::continue::
        end
        
        if candidate_target then
            if AimbotConfig.sticky then 
                self.locked_target = candidate_target.target 
            end
            self.last_target_world_pos = candidate_target.bone_pos
            self.last_target_screen_pos = candidate_target.screen_pos
            self.last_update_time = utility.get_tickcount() / 1000
            return candidate_target
        end

        return nil
    end,
    
    update = function(self)
        MovementTracker:cleanup()
        
        self:get_local_player_data()
        
        AimbotConfig.activeWeapon = self:get_active_weapon()
        
        self.current_frame_target_data = self:get_best_target()

        if not self.current_frame_target_data or not self.current_frame_target_data.target then
            Library.TargetHUD:SetTarget(nil)
            self.current_hitchance = 0
            return
        end

        local target = self.current_frame_target_data.target

        if Library.TargetHUD then
            Library.TargetHUD:SetTarget(target)
        end

        -- Calculate hitchance for current target
        if AimbotConfig.showHitchance and target.name then
            local local_pos = self:get_local_player_data()
            local target_pos = self.current_frame_target_data.bone_pos
            local distance = math.sqrt(
                (local_pos.x - target_pos.x)^2 + 
                (local_pos.y - target_pos.y)^2 + 
                (local_pos.z - target_pos.z)^2
            )
            
            -- Get weapon accuracy based on weapon type
            local weapon_accuracy = 0.8 -- default
            if AimbotConfig.activeWeapon == "Bow" then
                weapon_accuracy = 0.85
            elseif AimbotConfig.activeWeapon == "Crossbow" then
                weapon_accuracy = 0.9
            elseif AimbotConfig.activeWeapon == "Nailgun" then
                weapon_accuracy = 0.5
            elseif AimbotConfig.activeWeapon == "Spear" then
                weapon_accuracy = 0.7
            end
            
            self.current_hitchance = MovementTracker:calculateHitchance(target.name, distance, weapon_accuracy)
        else
            self.current_hitchance = 0
        end

        local cursor_x, cursor_y = input.cursor_position()
        local target_screen_x = self.current_frame_target_data.screen_pos.x
        local target_screen_y = self.current_frame_target_data.screen_pos.y
        
        local delta_x = target_screen_x - cursor_x
        local delta_y = target_screen_y - cursor_y
        
        local move_x, move_y = self:calculate_mouse_movement(delta_x, delta_y)
        
        local move_threshold = 0.1
        if math.abs(move_x) > move_threshold or math.abs(move_y) > move_threshold then
            if AimbotConfig.mode == "mouse" then
                -- For snap aim (speed 100, smoothing off), set cursor directly to target
                if AimbotConfig.speed >= 100 and not AimbotConfig.smoothingEnabled then
                    input.mouse_move(math.floor(delta_x), math.floor(delta_y))
                else
                    input.mouse_move(math.floor(move_x), math.floor(move_y))
                end
            elseif AimbotConfig.mode == "silent" then
                game.silent_aim(target_screen_x, target_screen_y)
            end
        end
    end,
    
    get_active_weapon = function(self)
        local weapon_lower = entity.get_local_player()
        if weapon_lower == nil or not weapon_lower:is_alive() then return "General" end
        weapon_lower = weapon_lower:get_weapon():lower()
        if string.find(weapon_lower, "crossbow") then
            return "Crossbow"
        elseif string.find(weapon_lower, "spear") then
            return "Spear"
        elseif string.find(weapon_lower, "bow") then
            return "Bow"
        elseif string.find(weapon_lower, "nail") then
            return "Nailgun"
        else
            return "General"
        end
    end,
    
    render = function(self)
        AimbotConfig.activeWeapon = self:get_active_weapon()
        
        if AimbotConfig.visualizeFOV then
            local cursor_x, cursor_y = input.cursor_position()
            local fov_val = AimbotConfig.fov
            
            -- Draw filled circle if enabled
            if AimbotConfig.fovCircleFilled then
                local fillColor = AimbotConfig.fovCircleFilledColor
                render.circle(cursor_x, cursor_y, fov_val, fillColor[1], fillColor[2], fillColor[3], fillColor[4], 32)
            end
            
            -- Draw outline circle
            local outlineColor = AimbotConfig.visualizeFOVColor
            render.circle_outline(cursor_x, cursor_y, fov_val, outlineColor[1], outlineColor[2], outlineColor[3], outlineColor[4], 32)
        end

        -- Render hitchance display
        if AimbotConfig.showHitchance and self:is_active() and self.current_frame_target_data and self.current_hitchance > 0 then
            local window_width, window_height = cheat.get_window_size()
            local center_x = window_width / 2
            local center_y = window_height / 2
            
            local hitchance_text = string.format("Hitchance: %d%%", self.current_hitchance)
            local text_width, text_height = render.measure_text(2, true, hitchance_text)
            
            -- Position text 20 pixels below crosshair center
            local text_x = center_x - (text_width / 2)
            local text_y = center_y - 50
            
            -- Color based on hitchance value
            local text_color = {255, 255, 255, 255}
            if self.current_hitchance >= 70 then
                text_color = {0, 255, 0, 255} -- Green for high hitchance
            elseif self.current_hitchance >= 40 then
                text_color = {255, 255, 0, 255} -- Yellow for medium hitchance
            else
                text_color = {255, 0, 0, 255} -- Red for low hitchance
            end
            
            -- Draw background for better visibility
            render.rect(text_x - 5, text_y - 2, text_width + 10, text_height + 4, 0, 0, 0, 120, 0)
            
            -- Draw hitchance text
            render.text(text_x, text_y, text_color[1], text_color[2], text_color[3], text_color[4], 2, true, hitchance_text)
        end

        if not self:is_active() or not AimbotConfig.activeWeapon then
            return
        end
        
        if AimbotConfig.visualizeTarget and self.current_frame_target_data then
            local target_pos = vector(0,0,0)
            if self.current_frame_target_data.target.type == "player" then
                target_pos = vector(self.current_frame_target_data.target.entity:bone_position("HumanoidRootPart"))
            else
                target_pos = self.current_frame_target_data.target.pos
            end
            local color = AimbotConfig.targetColor
            
            if not target_pos:is_zero() then
                local time = utility.get_tickcount() / 1000
                local pulse = (time % 1.0) / 1.0
                local radius = 20 * pulse
                local alpha = math.floor(255 * (1 - pulse))
                
                local screen_x, screen_y = utility.world_to_screen(target_pos.x, target_pos.y, target_pos.z)
                if screen_x and screen_y and screen_x > 0 and screen_y > 0 then
                    render.circle_outline(screen_x, screen_y, radius, color[1], color[2], color[3], alpha, 24)
                    render.circle_outline(screen_x, screen_y, radius / 2, color[1], color[2], color[3], alpha, 16)
                end
            end
        end
        
        if AimbotConfig.weapons[AimbotConfig.activeWeapon].visualizePrediction and AimbotConfig.weapons[AimbotConfig.activeWeapon].predictionEnabled and self.current_frame_target_data then
            local target = self.current_frame_target_data.target
            local current_pos = self.current_frame_target_data.bone_pos
            local color = AimbotConfig.weapons[AimbotConfig.activeWeapon].predictionColor
            
            local base_pos = vector(0, 0, 0)
            if target.type == "player" and target.entity then
                local best_hitbox = self:get_best_hitbox(target.entity)
                local bone_x, bone_y, bone_z = target.entity:bone_position(best_hitbox)
                if bone_x and bone_y and bone_z then
                    base_pos = vector(bone_x, bone_y, bone_z)
                end
            elseif target.pos then
                base_pos = target.pos
            end
            
            if not base_pos:is_zero() and not current_pos:is_zero() then
                local base_screen_x, base_screen_y = utility.world_to_screen(base_pos.x, base_pos.y, base_pos.z)
                local pred_screen_x, pred_screen_y = utility.world_to_screen(current_pos.x, current_pos.y, current_pos.z)
                
                if base_screen_x and base_screen_y and pred_screen_x and pred_screen_y and
                   base_screen_x > 0 and base_screen_y > 0 and pred_screen_x > 0 and pred_screen_y > 0 then
                    
                    if AimbotConfig.weapons[AimbotConfig.activeWeapon].predictionVisualizationType == "Line" then
                        render.line(base_screen_x, base_screen_y, pred_screen_x, pred_screen_y, 
                                  color[1], color[2], color[3], color[4], 2)
                    elseif AimbotConfig.weapons[AimbotConfig.activeWeapon].predictionVisualizationType == "Circle" then
                        render.circle_outline(pred_screen_x, pred_screen_y, 8, color[1], color[2], color[3], color[4], 16)
                    else
                        render.circle(pred_screen_x, pred_screen_y, 3, color[1], color[2], color[3], color[4], 8)
                    end
                end
            end
        end
    end
}

local workspace = game.get_data_model()
local workspace_folder = workspace:find_first_child_of_class("Workspace")
local military = workspace_folder:find_first_child("Military")
local military_children = military and military:get_children() or {}
local window_width, window_height = cheat.get_window_size()
local plants_folder = workspace_folder and workspace_folder:find_first_child("Plants")
local animals_folder = workspace_folder and workspace_folder:find_first_child("Animals")
local nodes_folder = workspace_folder and workspace_folder:find_first_child("Nodes")
local keycards_folder = workspace_folder and workspace_folder:find_first_child("Keycards")
local bases_folder = workspace_folder and workspace_folder:find_first_child("Bases")
local loners_folder = bases_folder and bases_folder:find_first_child("Loners")
local vegetation_folder = workspace_folder and workspace_folder:find_first_child("Vegetation")
local benchspawn_folder = workspace_folder and workspace_folder:find_first_child("BenchSpawnGroups")
local benchspawn_children = benchspawn_folder and benchspawn_folder:get_children() or {}
local players_instance = workspace:find_first_child("Players")
local bags = loners_folder and loners_folder:find_first_child("Body Bag")
local sleepers = loners_folder and loners_folder:find_first_child("Sleeper")
local drops_folder = workspace_folder and workspace_folder:find_first_child("Drops")

local g_ores = {}
local g_plants = {}
local g_soldiers = {}
local g_animals = {}
local g_keycards = {}
local g_digpiles = {}
local g_benchspawns = {}
local g_mods = {}
local players_children = {}
local g_sleepers = {}
local g_bodybags = {}
local animal_children = {}
local g_drops = {}

local function mouse_within(x, y, mx, my, w, h)
    return mx >= x and mx <= x + w and my >= y and my <= y + h
end

local function find_in_table(table, element)
    for i,v in pairs(table) do
        if v == element then
            return true
        end
    end
    return false
end

local dragging = false
local saved_pos = vector(0, 0, 0)
local offset = vector(0, 0, 0)

local function render_esp_element(items, name_key, pos_key, color, show_distance, distance_limit, tracers)
    if not items or #items == 0 then return end
    
    local local_player = entity.get_local_player()
    if not local_player then return end
    
    local local_position = vector(local_player:get_position())
    
    for _, item in pairs(items) do
        local distance = local_position:dist_to(item[pos_key])
        distance = math.floor(distance + 0.5)

        if distance_limit < distance then goto continue end

        local screen_pos = vector(utility.world_to_screen(item[pos_key]:unpack()))
        if screen_pos:is_zero() then goto continue end

        local clr = color
        local w, h = render.measure_text(0, false, item[name_key])
        local w1, h1 = render.measure_text(0, false, tostring(distance) .. "M")

        render.text(screen_pos.x - w / 2, screen_pos.y - h / 2, clr[1], clr[2], clr[3], clr[4], 0, false, item[name_key])

        if show_distance then
            render.text(screen_pos.x - w1 / 2, screen_pos.y - h1 / 2 + 7, clr[1], clr[2], clr[3], clr[4], 0, false, tostring(distance) .. "M")
        end

        if tracers then
            render.line(window_width / 2, 0, screen_pos.x, screen_pos.y, clr[1], clr[2], clr[3], clr[4], 1)
        end
        ::continue::
    end
end

local function on_update_slow()
    if not ESPConfig.MainEnabled then return end
    
    players_children = players_instance and players_instance:get_children() or {}
    animal_children = animals_folder and animals_folder:get_children() or {}

    if ESPConfig.OresEnabled and nodes_folder then
        g_ores = {}
        for _, node_folder in pairs(nodes_folder:get_children()) do
            local main = node_folder:find_first_child("Main")
            if main then
                g_ores[#g_ores + 1] = {
                    name = node_folder:get_name(),
                    pos = vector(main:get_position())
                }
            end
        end
    end

    if ESPConfig.DropsEnabled and drops_folder then
        g_drops = {}
        for _, drop in pairs(drops_folder:get_children()) do
            local mesh_part = drop:find_first_child_of_class("MeshPart")
            if mesh_part then
                g_drops[#g_drops + 1] = {
                    name = drop:get_name(),
                    pos = vector(mesh_part:get_position())
                }
            end
        end
    end

    if ESPConfig.BodyBagEnabled and bags then
        g_bodybags = {}
        for _, bag in pairs(bags:get_children()) do
            local main = bag:find_first_child("Main")
            if main then
                g_bodybags[#g_bodybags + 1] = {
                    name = "Body Bag",
                    pos = vector(main:get_position())
                }
            end
        end      
    end

    if ESPConfig.SleeperEnabled and sleepers then
        g_sleepers = {}
        for _, sleeper in pairs(sleepers:get_children()) do
            local sleeper_children = sleeper:get_children()
            local player_name = ""
            local position = vector(0, 0, 0)

            for _, child in pairs(sleeper_children) do
                local child_name = child:get_name()
                if child_name == "NameTag" then
                    local label = child:find_first_child("Label")
                    if label then
                        player_name = label:get_textlabel_value()
                    end
                end

                if child_name == "Main" then
                    position = vector(child:get_position())
                end
            end

            g_sleepers[#g_sleepers + 1] = {
                name = player_name,
                pos = position
            }
        end
    end

    if ESPConfig.MonumentSpawnsEnabled and benchspawn_folder then
        g_benchspawns = {}
        for _, monuments in pairs(benchspawn_children) do
            local children = monuments:get_children()
    
            if #children > 3 then
                for _, drop in pairs(children) do
                    local drop_name = drop:get_name()
                    drop_name = string.sub(drop_name, 3)
    
                    g_benchspawns[#g_benchspawns + 1] = {
                        name = drop_name,
                        pos = vector(drop:get_position())
                    }
                end
            end
        end
    end

    if ESPConfig.DigPileEnabled and vegetation_folder then
        g_digpiles = {}
        for _, digpiles in pairs(vegetation_folder:get_children()) do
            local digpile_name = digpiles:get_name()
            if digpile_name == "DigPile" then
                local main = digpiles:find_first_child("Pos1")
                if main then
                    g_digpiles[#g_digpiles + 1] = {
                        name = digpile_name,
                        pos = vector(main:get_position())
                    }
                end
            end
        end
    end

    if ESPConfig.KeycardEnabled and keycards_folder then
        g_keycards = {}
        for _, keycard in pairs(keycards_folder:get_children()) do
            local main = keycard:find_first_child("Main")
            if main then
                g_keycards[#g_keycards + 1] = {
                    name = "Keycard",
                    pos = vector(main:get_position())
                }
            end
        end
    end

    if ESPConfig.PlantsEnabled and plants_folder then
        g_plants = {}
        for _, plant_folder in pairs(plants_folder:get_children()) do
            local main = plant_folder:find_first_child("Main")
            if main then
                g_plants[#g_plants + 1] = {
                    name = plant_folder:get_name(),
                    pos = vector(main:get_position())
                }
            end
        end
    end
end

local function get_entities()
    if not ESPConfig.MainEnabled then return end
    
    if ESPConfig.AnimalsEnabled and animals_folder then
        g_animals = {}
        for _, node_folder in pairs(animal_children) do
            local main = node_folder:find_first_child("HumanoidRootPart")
            if main then
                local full_name = node_folder:get_name()
                local animal_name = full_name:sub(15):lower()
                animal_name = animal_name:sub(1, 1):upper() .. animal_name:sub(2)
                g_animals[#g_animals + 1] = {
                    name = animal_name,
                    pos = vector(main:get_position())
                }
            end
        end
    end
    
    if ESPConfig.SoldiersEnabled and military then
        g_soldiers = {}
        for _, bases in pairs(military_children) do
            for _, soldier_folder in pairs(bases:get_children()) do
                if soldier_folder:get_name() == "Soldier" then
                    local main = soldier_folder:find_first_child("HumanoidRootPart")
                    if main then
                        g_soldiers[#g_soldiers + 1] = {
                            name = "Soldier",
                            pos = vector(main:get_position())
                        }
                    end
                end
            end
        end
    end
end

local function draw_container(x, y, text)
    local height = 30
    local padding = 20
    local y_offset = 0

    local text_size = vector(render.measure_text(2, false, text))

    local accent_clr = {255, 100, 100, 255}
    local header_clr = {40, 40, 40, 255}
    local text_clr = {255, 255, 255, 255}

    render.rect(x, y, text_size.x + padding, height, header_clr[1], header_clr[2], header_clr[3], header_clr[4])
    render.rect(x, y + height - 2, text_size.x + padding, 2, accent_clr[1], accent_clr[2], accent_clr[3], accent_clr[4])
    render.text(x + padding / 2, y + height / 2 - text_size.y / 2, text_clr[1], text_clr[2], text_clr[3], text_clr[4], 2, false, text)

    for _, player in ipairs(players_children) do
        local text_clr = {255, 255, 255, 255}

        local player_name = player:get_name()
        local text_size = vector(render.measure_text(2, false, player_name))

        if contains(mods_names, player_name) then
            render.text(x, (y + height + 2) + y_offset, text_clr[1], text_clr[2], text_clr[3], text_clr[4], 2, false, player_name)
            y_offset = y_offset + text_size.y
        end
    end

    return {x=x, y=y, w=text_size.x + padding, h=height}
end

local function draw_esp()
    if not ESPConfig.MainEnabled then return end
    
    local local_player = entity.get_local_player()
    if not local_player then return end
    
    local local_position = vector(local_player:get_position())
    local mouse_pos = vector(input.cursor_position())

    if ESPConfig.OresEnabled then
        for _, ore in pairs(g_ores) do
            local ore_name = ore.name
            local should_render = isItemSelected(ore_name, ESPConfig.SelectedOres)
            
            if should_render then
                local color = ESPConfig.Colors.Stone
                
                if string.find(ore_name:lower(), "stone") then
                    color = ESPConfig.Colors.Stone
                elseif string.find(ore_name:lower(), "metal") then
                    color = ESPConfig.Colors.Metal
                elseif string.find(ore_name:lower(), "phosphate") then
                    color = ESPConfig.Colors.Phosphate
                end
                
                local distance = local_position:dist_to(ore.pos)
                distance = math.floor(distance + 0.5)

                if ESPConfig.OresDistance >= distance then
                    local screen_pos = vector(utility.world_to_screen(ore.pos:unpack()))
                    if not screen_pos:is_zero() then
                        local w, h = render.measure_text(0, false, ore_name)
                        local w1, h1 = render.measure_text(0, false, tostring(distance) .. "M")

                        render.text(screen_pos.x - w / 2, screen_pos.y - h / 2, color[1], color[2], color[3], color[4], 0, false, ore_name)

                        if ESPConfig.OresShowDistance then
                            render.text(screen_pos.x - w1 / 2, screen_pos.y - h1 / 2 + 7, color[1], color[2], color[3], color[4], 0, false, tostring(distance) .. "M")
                        end

                        if ESPConfig.OresTracers then
                            render.line(window_width / 2, 0, screen_pos.x, screen_pos.y, color[1], color[2], color[3], color[4], 1)
                        end
                    end
                end
            end
        end
    end

    if ESPConfig.PlantsEnabled then
        for _, plant in pairs(g_plants) do
            local plant_name = plant.name
            local should_render = isItemSelected(plant_name, ESPConfig.SelectedPlants)
            
            if should_render then
                local color = ESPConfig.Colors.Wool
                
                if string.find(plant_name:lower(), "wool") then
                    color = ESPConfig.Colors.Wool
                elseif string.find(plant_name:lower(), "raspberry") then
                    color = ESPConfig.Colors.Raspberry
                elseif string.find(plant_name:lower(), "corn") then
                    color = ESPConfig.Colors.Corn
                elseif string.find(plant_name:lower(), "tomato") then
                    color = ESPConfig.Colors.Tomato
                elseif string.find(plant_name:lower(), "blueberry") then
                    color = ESPConfig.Colors.Blueberry
                elseif string.find(plant_name:lower(), "lemon") then
                    color = ESPConfig.Colors.Lemon
                end
                
                local distance = local_position:dist_to(plant.pos)
                distance = math.floor(distance + 0.5)

                if ESPConfig.PlantsDistance >= distance then
                    local screen_pos = vector(utility.world_to_screen(plant.pos:unpack()))
                    if not screen_pos:is_zero() then
                        local w, h = render.measure_text(0, false, plant_name)
                        local w1, h1 = render.measure_text(0, false, tostring(distance) .. "M")

                        render.text(screen_pos.x - w / 2, screen_pos.y - h / 2, color[1], color[2], color[3], color[4], 0, false, plant_name)

                        if ESPConfig.PlantsShowDistance then
                            render.text(screen_pos.x - w1 / 2, screen_pos.y - h1 / 2 + 7, color[1], color[2], color[3], color[4], 0, false, tostring(distance) .. "M")
                        end

                        if ESPConfig.PlantsTracers then
                            render.line(window_width / 2, 0, screen_pos.x, screen_pos.y, color[1], color[2], color[3], color[4], 1)
                        end
                    end
                end
            end
        end
    end

    if ESPConfig.AnimalsEnabled then
        for _, animal in pairs(g_animals) do
            local animal_name = animal.name
            local should_render = isItemSelected(animal_name, ESPConfig.SelectedAnimals)
            
            if should_render then
                local color = ESPConfig.Colors.Deer
                
                if string.find(animal_name:lower(), "deer") then
                    color = ESPConfig.Colors.Deer
                elseif string.find(animal_name:lower(), "wildboar") then
                    color = ESPConfig.Colors.Wildboar
                elseif string.find(animal_name:lower(), "wolf") then
                    color = ESPConfig.Colors.Wolf
                end
                
                local distance = local_position:dist_to(animal.pos)
                distance = math.floor(distance + 0.5)

                if ESPConfig.AnimalsDistance >= distance then
                    local screen_pos = vector(utility.world_to_screen(animal.pos:unpack()))
                    if not screen_pos:is_zero() then
                        local w, h = render.measure_text(0, false, animal_name)
                        local w1, h1 = render.measure_text(0, false, tostring(distance) .. "M")

                        render.text(screen_pos.x - w / 2, screen_pos.y - h / 2, color[1], color[2], color[3], color[4], 0, false, animal_name)

                        if ESPConfig.AnimalsShowDistance then
                            render.text(screen_pos.x - w1 / 2, screen_pos.y - h1 / 2 + 7, color[1], color[2], color[3], color[4], 0, false, tostring(distance) .. "M")
                        end

                        if ESPConfig.AnimalsTracers then
                            render.line(window_width / 2, 0, screen_pos.x, screen_pos.y, color[1], color[2], color[3], color[4], 1)
                        end
                    end
                end
            end
        end
    end

    if ESPConfig.SoldiersEnabled then
        render_esp_element(g_soldiers, "name", "pos", ESPConfig.Colors.Soldier, ESPConfig.SoldiersShowDistance, ESPConfig.SoldiersDistance, ESPConfig.SoldiersTracers)
    end

    if ESPConfig.DropsEnabled then
        render_esp_element(g_drops, "name", "pos", ESPConfig.Colors.Drops, ESPConfig.DropsShowDistance, ESPConfig.DropsDistance, ESPConfig.DropsTracers)
    end

    if ESPConfig.DigPileEnabled then
        render_esp_element(g_digpiles, "name", "pos", ESPConfig.Colors.DigPile, ESPConfig.DigPileShowDistance, ESPConfig.DigPileDistance, ESPConfig.DigPileTracers)
    end

    if ESPConfig.KeycardEnabled then
        render_esp_element(g_keycards, "name", "pos", ESPConfig.Colors.Keycard, ESPConfig.KeycardShowDistance, ESPConfig.KeycardDistance, ESPConfig.KeycardTracers)
    end

    if ESPConfig.MonumentSpawnsEnabled then
        render_esp_element(g_benchspawns, "name", "pos", ESPConfig.Colors.Keycard, ESPConfig.MonumentSpawnsShowDistance, ESPConfig.MonumentSpawnsDistance, ESPConfig.MonumentSpawnsTracers)
    end

    if ESPConfig.SleeperEnabled then
        render_esp_element(g_sleepers, "name", "pos", ESPConfig.Colors.Sleeper, true, ESPConfig.SleeperDistance, false)
    end

    if ESPConfig.BodyBagEnabled then
        render_esp_element(g_bodybags, "name", "pos", ESPConfig.Colors.BodyBag, true, ESPConfig.BodyBagDistance, false)
    end

    if ESPConfig.ModAdminViewerEnabled then
        local test = draw_container(saved_pos.x, saved_pos.y, "Mod/Admin View")
        if utility.key_state(0x01) and mouse_within(test.x, test.y, mouse_pos.x, mouse_pos.y, test.w, test.h) then
            if not dragging then
                dragging = true
                offset.x = mouse_pos.x - test.x
                offset.y = mouse_pos.y - test.y
            else
                saved_pos.x = mouse_pos.x - offset.x
                saved_pos.y = mouse_pos.y - offset.y
            end
        else
            dragging = false
        end
    end
end

local windowVisible = true
local lastInsertState = false
local lastPlayerUpdate = 0

local function Update()
    --if not game.is_focused() then return end

    
    aimbot:update()

    if Library.TargetHUD then
        Library.TargetHUD:Update()
    end
    
    if Library.ESP and Library.ESP.Enabled then
        Library.ESP:Update() 
    end
    
    if Library.Watermark then
        Library.Watermark:Update() 
    end
    
    local currentInsertState = utility.key_state(elements.menu_keybind.keyCode or 0x12)
    if currentInsertState and not lastInsertState then
        windowVisible = not windowVisible
        MainWindow.visible = windowVisible
    end
    lastInsertState = currentInsertState

    local currentTime = utility.get_tickcount()
    if currentTime - lastPlayerUpdate > 1000 then
        pcall(function()
            if sections.MainPlayerList then
                sections.MainPlayerList:UpdatePlayers()
            end
        end)
        lastPlayerUpdate = currentTime
    end

    if Library.KeybindsList and Library.KeybindsList.visible then
        Library.KeybindsList:HandleInput() 
    end
    
    for _, element in ipairs(Library.SortedElements or {}) do
        if element and element.HandleInput then
            element:HandleInput() 
        end
    end
    
    for _, window in ipairs(Library.Windows or {}) do
        if window and window.visible and window.HandleInput then
            window:HandleInput() 
        end
    end

    if Library.KeybindsList and Library.KeybindsList.visible then
        Library.KeybindsList:UpdatePosition() 
    end
    
    if Library.Notifications then
        Library.Notifications:UpdateAll() 
    end
    
    for _, keybind in ipairs(Library.AllKeybinds or {}) do
        keybind:UpdateState() 
    end

    if Library.TargetHUD and Library.TargetHUD.visible then
        Library.TargetHUD:HandleInput()
    end
    
    if elements.aimbotEnabled.keybind then
        local currentKeyState = utility.key_state(AimbotConfig.keybind.key)
        AimbotConfig.keybind.active = currentKeyState
    end
    
    get_entities()
end

local function Render()
    --if not game.is_focused() then return end
    UpdateInputState()
    aimbot:render()
    
    if Library.ESP and Library.ESP.Enabled then
        Library.ESP:RenderPlayers() 
    end
    
    draw_esp()

    if Library.TargetHUD then
        Library.TargetHUD:Render()
    end
    
    if Library.KeybindsList then
        Library.KeybindsList:Render() 
    end
    
    for _, window in ipairs(Library.Windows or {}) do
        if window and window.visible and window.Render then
            window:Render() 
        end
    end

    for _, element in ipairs(Library.SortedElements or {}) do
        if element and element.RenderPopup and MainWindow.visible then
            element:RenderPopup()
        end
        
        if element and element.colorPicker and element.colorPicker.RenderPopup then
            element.colorPicker:RenderPopup()
        end
    end

    if Library.Watermark then
        Library.Watermark:Render()
    end

    if Library.Notifications then
        Library.Notifications:RenderAll()
    end
end

cheat.set_callback("update", Update)
cheat.set_callback("update_slow", on_update_slow)
cheat.set_callback("paint", Render)
