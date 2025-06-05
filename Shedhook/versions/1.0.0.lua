
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

local function on_update()
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

local function on_paint()
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
    if not game.is_focused() then return end
    UpdateInputState()
    
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
    
    on_update()
end

local function Render()
    if not game.is_focused() then return end
    
    aimbot:render()
    
    if Library.ESP and Library.ESP.Enabled then
        Library.ESP:RenderPlayers() 
    end
    
    on_paint()

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
