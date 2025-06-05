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
