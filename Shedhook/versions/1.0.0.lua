-- Shedhook Fallen Survival - Loader Compatible Version
-- This script is designed to be loaded from the Shedhook Loader

-- Check if UI Library is available from loader
local Library = _G.UILIB
if not Library then
    error("UI Library not found! Please run this script through the Shedhook Loader.")
end

-- Clean up any existing UI elements from loader
Library.Cleanup()

-- Set theme and initialize
Library.Theme.Selected = "Abyss"
Library.RefreshTheme()

-- Create watermark
Library.CreateWatermark({
    title = "shedhook",
    template = "$TITLE | $PLAYER | $FPS FPS | $PINGms Latency",
    position = "top-right"
})

local MainWindow = Library.Window({
    Title = "shedhook",
    X = 100,
    Y = 100,
    Width = 630,
    Height = 650
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
        General = {
            predictionEnabled = false,
            predictionMethod = "Regular",
            predictionStrength = 1.0,
            bulletVelocity = 1294.75,
            gravity = 98.1,
            bulletDrop = 0.0,
            visualizePrediction = false,
            predictionVisualizationType = "Line",
            predictionColor = {0, 255, 255, 255},
        },
        Spear = {
            predictionEnabled = false,
            predictionMethod = "Regular",
            predictionStrength = 1.0,
            bulletVelocity = 800.0,
            gravity = 98.1,
            bulletDrop = 0.0,
            visualizePrediction = false,
            predictionVisualizationType = "Line",
            predictionColor = {0, 255, 255, 255},
        },
        Bow = {
            predictionEnabled = false,
            predictionMethod = "Regular",
            predictionStrength = 1.0,
            bulletVelocity = 900.0,
            gravity = 98.1,
            bulletDrop = 0.0,
            visualizePrediction = false,
            predictionVisualizationType = "Line",
            predictionColor = {0, 255, 255, 255},
        },
        Crossbow = {
            predictionEnabled = false,
            predictionMethod = "Regular",
            predictionStrength = 1.0,
            bulletVelocity = 1100.0,
            gravity = 98.1,
            bulletDrop = 0.0,
            visualizePrediction = false,
            predictionVisualizationType = "Line",
            predictionColor = {0, 255, 255, 255},
        },
        Nailgun = {
            predictionEnabled = false,
            predictionMethod = "Regular",
            predictionStrength = 1.0,
            bulletVelocity = 1500.0,
            gravity = 98.1,
            bulletDrop = 0.0,
            visualizePrediction = false,
            predictionVisualizationType = "Line",
            predictionColor = {0, 255, 255, 255},
        },
    }
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

tabs.Legit = MainWindow:AddTab("Aimbot")
tabs.Visuals = MainWindow:AddTab("Visuals")
tabs.Entities = MainWindow:AddTab("Entities")
tabs.Player = MainWindow:AddTab("Players")
tabs.Settings = MainWindow:AddTab("Settings")

sections.Aimbot = tabs.Legit:AddSection("Aimbot", 10, 60, 300, 530)
sections.Prediction = tabs.Legit:AddMultiSection("Prediction", {"General", "Spear", "Bow", "Crossbow", "Nailgun"}, 320, 60, 300, 530)

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
for _, weapon in ipairs({"General", "Spear", "Bow", "Crossbow", "Nailgun"}) do
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

    elements[weapon.."_bulletVelocity"] = Slider:new("Bullet Velocity", 200, 3000, AimbotConfig.weapons[weapon].bulletVelocity, function(value)
        AimbotConfig.weapons[weapon].bulletVelocity = value
    end, string.format("%s_bullet_velocity", weapon))
    sections.Prediction:AddElement(elements[weapon.."_bulletVelocity"], weaponIndex)

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

sections.Watermark = tabs.Settings:AddSection("Watermark Settings", 320, 485, 300, 160)
    
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


-- Main update and render loops with safety wrappers
local windowVisible = true
local lastInsertState = false
local lastPlayerUpdate = 0

-- Safe UpdateInputState wrapper
local function UpdateInputState()
    if Library and Library.UpdateInputState then
        Library.UpdateInputState()
    end
end

local function Update()
    pcall(function()
        if not game.is_focused() then return end
        
        UpdateInputState()
        
        pcall(function() aimbot:update() end)

        if Library.TargetHUD then
            pcall(function() Library.TargetHUD:Update() end)
        end
        
        if Library.ESP and Library.ESP.Enabled then
            pcall(function() Library.ESP:Update() end)
        end
        
        if Library.Watermark then
            pcall(function() Library.Watermark:Update() end)
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
            pcall(function() Library.KeybindsList:HandleInput() end)
        end
        
        for _, element in ipairs(Library.SortedElements or {}) do
            if element and element.HandleInput then
                pcall(function() element:HandleInput() end)
            end
        end
        
        for _, window in ipairs(Library.Windows or {}) do
            if window and window.visible and window.HandleInput then
                pcall(function() window:HandleInput() end)
            end
        end

        if Library.KeybindsList and Library.KeybindsList.visible then
            pcall(function() Library.KeybindsList:UpdatePosition() end)
        end
        
        if Library.Notifications then
            pcall(function() Library.Notifications:UpdateAll() end)
        end
        
        for _, keybind in ipairs(Library.AllKeybinds or {}) do
            pcall(function() keybind:UpdateState() end)
        end

        if Library.TargetHUD and Library.TargetHUD.visible then
            pcall(function() Library.TargetHUD:HandleInput() end)
        end
        
        if elements.aimbotEnabled.keybind then
            local currentKeyState = utility.key_state(AimbotConfig.keybind.key)
            AimbotConfig.keybind.active = currentKeyState
        end
        
        pcall(on_update)
    end)
end

local function Render()
    pcall(function()
        if not game.is_focused() then return end
        
        pcall(function() aimbot:render() end)
        
        if Library.ESP and Library.ESP.Enabled then
            pcall(function() Library.ESP:RenderPlayers() end)
        end
        
        pcall(on_paint)

        if Library.TargetHUD then
            pcall(function() Library.TargetHUD:Render() end)
        end
        
        if Library.KeybindsList then
            pcall(function() Library.KeybindsList:Render() end)
        end
        
        for _, window in ipairs(Library.Windows or {}) do
            if window and window.visible and window.Render then
                pcall(function() window:Render() end)
            end
        end

        for _, element in ipairs(Library.SortedElements or {}) do
            if element and element.RenderPopup and MainWindow.visible then
                pcall(function() element:RenderPopup() end)
            end
            
            if element and element.colorPicker and element.colorPicker.RenderPopup then
                pcall(function() element.colorPicker:RenderPopup() end)
            end
        end

        if Library.Watermark then
            pcall(function() Library.Watermark:Render() end)
        end

        if Library.Notifications then
            pcall(function() Library.Notifications:RenderAll() end)
        end
    end)
end

-- Set up callbacks safely
pcall(function()
    cheat.set_callback("update", Update)
    cheat.set_callback("update_slow", on_update_slow)
    cheat.set_callback("paint", Render)
end)

-- Notify successful load
pcall(function()
    Library.Notify("Shedhook Loaded", "Fallen Survival script loaded successfully!", "info", 5000)
end)

utility.log("Shedhook Fallen Survival script loaded successfully!")
