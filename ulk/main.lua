    overlay.set_target("Counter-Strike 2")
local cs2 = process.set_target("cs2.exe")
local client = process.get_module("client.dll")


local Library = {
    Title = "Tyrisware UI",
    ConfigData = {},
    Windows = {},
    CurrentWindow = nil,
    Settings = {
        Tween = true,
        MenuFade = false,
        Drag = {
            Enabled = true,
            Latency = 0.08,
            Speed = 0.15
        },
        Animation = {
            Speed = 0.12,
            Easing = "quad"
        },
        TitleAnimationType = "Letter by Letter",
        TabTransitionType = "Fade"
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
                ["AccentLight"] = {247, 247, 247, 125},
                ["MidLight"] = {30, 30, 30, 255}
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
                ["AccentLight"] = {247, 247, 247, 125},
                ["MidLight"] = {30, 30, 30, 255}
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
                ["AccentLight"] = {247, 247, 247, 125},
                ["MidLight"] = {30, 30, 30, 255}
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
                ["AccentLight"] = {247, 247, 247, 125},
                ["MidLight"] = {30, 30, 30, 255}
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
                ["AccentLight"] = {247, 247, 247, 125},
                ["MidLight"] = {30, 30, 30, 255}
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
                ["AccentLight"] = {247, 247, 247, 125},
                ["MidLight"] = {30, 30, 30, 255}
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
                ["AccentLight"] = {247, 247, 247, 125},
                ["MidLight"] = {30, 30, 30, 255}
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
                ["AccentLight"] = {247, 247, 247, 125},
                ["MidLight"] = {30, 30, 30, 255}
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
                ["AccentLight"] = {247, 247, 247, 125},
                ["MidLight"] = {30, 30, 30, 255}
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
                ["AccentLight"] = {247, 247, 247, 125},
                ["MidLight"] = {30, 30, 30, 255}
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
                ["AccentLight"] = {247, 247, 247, 125},
                ["MidLight"] = {30, 30, 30, 255}
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
                ["AccentLight"] = {247, 247, 247, 125},
                ["MidLight"] = {30, 30, 30, 255}
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
                ["AccentLight"] = {247, 247, 247, 125},
                ["MidLight"] = {30, 30, 30, 255}
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
                ["AccentLight"] = {247, 247, 247, 125},
                ["MidLight"] = {30, 30, 30, 255}
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
                ["AccentLight"] = {247, 247, 247, 125},
                ["MidLight"] = {30, 30, 30, 255}
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
                ["AccentLight"] = {247, 247, 247, 125},
                ["MidLight"] = {30, 30, 30, 255}
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
                ["AccentLight"] = {247, 247, 247, 125},
                ["MidLight"] = {30, 30, 30, 255}
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
                ["AccentLight"] = {247, 247, 247, 125},
                ["MidLight"] = {30, 30, 30, 255}
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
    ESP = {
        Enabled = false,
        OnlyEnemies = false,
        MaxDistance = 1000,
        ShowName = true,
        ShowDistance = true,
        ShowHealth = true,
        HealthBarAddons = {},
        Show2DBox = true,
        ShowWeapon = true,
        ShowSkeleton = false,
        ShowHitboxes = false,
        ShowTeam = true,
        ShowFlags = true,
        ShowTags = false,
        Targets = {"Visible"},
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
            Hitbox = {255, 255, 255, 255},
            Flags = {255, 255, 0, 255},
            HealthBar = {0, 255, 0, 255}
        },
        Flags = {},
        Font = 2,
        HealthBarWidth = 4,
        HealthBarOffset = 10,
        FlagOffset = 40,
        HitboxSegments = 12,
        HitboxThickness = 1.0,
        PredictionEnabled = true,
        PredictionStrength = 1.0
    },
    ConfigSystem = {
        Configs = {},
        CurrentConfig = "",
        ConfigIndex = "tyrisware-configs.json"
    },
    Notifications = {
        List = {},
        MaxVisible = 5,
        Position = "bottom-left",
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
        fps = 60,
        ping = "Unknown",
        playerName = "Unknown"
    }
}

Library.ESP.DefaultFlags = {
    LowHealth = {
        name = "Low HP",
        color = Library.ESP.Colors.HealthLow,
        condition = function(player)
            return false
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
            return false
        end,
        priority = 2
    },
    Moderator = {
        name = "Moderator",
        color = {250, 143, 12, 255},
        condition = function(player)
            return false
        end,
        priority = 1
    }
}

Library.ESP.EntityCache = {
    entities = {},
    lastUpdate = 0,
    updateInterval = 20, -- time in millis fr
    localPlayer = nil,
    localPlayerController = 0
}

local offsets = {
    dwEntityList = 0x1A020A8,
    dwViewMatrix = 0x1A6B230,
    dwLocalPlayerController = 0x1A50AD0,
    dwSensitivity = 0x1A67858,
    dwSensitivity_sensitivity = 0x40,
    m_iTeamNum = 0x3E3,
    m_iHealth = 0x344,
    m_modelState = 0x170,
    m_bPawnIsAlive = 0x82C,
    m_sSanitizedPlayerName = 0x778,
    m_hPawn = 0x62C,
    m_pGameSceneNode = 0x328,
    m_vecOrigin = 0x88,
    m_pClippingWeapon = 0x13A0,
    m_Item = 0x50,
    m_iItemDefinitionIndex = 0x1BA,
    m_entitySpottedState = 0x23D0,
    m_bSpotted = 0x8,
    m_steamID = 0x6E8,
    m_iShotsFired = 0x23FC,
    m_aimPunchAngle = 0x1584,
    m_pBulletServices = 0x1518,
    m_flCrosshairDistance = 0x1760,
    m_iCrosshairTextureID = 0x1770,
    m_iIDEntIndex = 0x1458,
    m_hController = 0x133C,
    hitbox_start = 0x18,
    hitbox_end = 0x24,
    hitbox_radius = 0x30,
    hitboxes_hash_name = 0x20,
    hitboxes_count = 0x28,
    hitboxes_array = 0x30,
    hitbox_size = 0x70,
    render_mesh_hitboxes = 0x108,
    render_mesh_hitbox_count = 0x110,
    hitboxes_set_size = 0x50,
    model_meshes = 0x78,
    model_meshes_count = 0x70,
    render_meshes_array = 0x8,
    skeleton_model_state = 0x170,
    model_state_to_model = 0xA0,

    -- Updated offsets from offsets.cs
    CHitboxComponent = 0xA58,
    CRenderComponent = 0xA50,
    CBodyComponent = 0x38,
    m_nHitboxSet = 0x3A8,
    m_bvDisabledHitGroups = 0x24,
    m_MeshGroupMask = 0x198,
    m_hModel = 0xA0,
    m_skeletonInstance = 0x50,
    m_nodeToWorld = 0x10,
    m_vecAbsOrigin = 0xD0,

    C_EconEntity = {
        m_AttributeManager = 0x1148
    },
    C_AttributeContainer = {
        m_Item = 0x50
    },
    C_EconItemView = {
        m_iItemDefinitionIndex = 0x1BA
    },
    CCSPlayer_BulletServices = {
        m_totalHitsOnServer = 0x40
    }
}

local weapon_index_map = {
    [59] = "T knife",
    [42] = "CT knife",
    [1] = "deagle",
    [2] = "elite",
    [3] = "fiveseven",
    [4] = "glock",
    [64] = "revolver",
    [32] = "p2000",
    [36] = "p250",
    [61] = "usp-s",
    [30] = "tec9",
    [63] = "cz75a",
    [17] = "mac10",
    [24] = "ump45",
    [26] = "bizon",
    [33] = "mp7",
    [34] = "mp9",
    [19] = "p90",
    [13] = "galil",
    [10] = "famas",
    [60] = "m4a1_silencer",
    [16] = "m4a4",
    [8] = "aug",
    [39] = "sg556",
    [7] = "ak47",
    [11] = "g3sg1",
    [38] = "scar20",
    [9] = "awp",
    [40] = "ssg08",
    [25] = "xm1014",
    [29] = "sawedoff",
    [27] = "mag7",
    [35] = "nova",
    [28] = "negev",
    [14] = "m249",
    [31] = "zeus",
    [43] = "flashbang",
    [44] = "hegrenade",
    [45] = "smokegrenade",
    [46] = "molotov",
    [47] = "decoy",
    [48] = "incgrenade",
    [49] = "c4"
}

local weapon_name_map = {
    ["Default"] = "Default",
    -- Knives
    ["T knife"] = "T Knife",
    ["CT knife"] = "CT Knife",

    -- Pistols
    ["deagle"] = "Desert Eagle",
    ["elite"] = "Dual Berettas",
    ["fiveseven"] = "Five-SeveN",
    ["glock"] = "Glock",
    ["revolver"] = "R8 Revolver",
    ["p2000"] = "P2000",
    ["p250"] = "P250",
    ["usp-s"] = "USP-S",
    ["tec9"] = "Tec-9",
    ["cz75a"] = "CZ75-Auto",

    -- SMGs
    ["mac10"] = "MAC-10",
    ["ump45"] = "UMP-45",
    ["bizon"] = "PP-Bizon",
    ["mp7"] = "MP7",
    ["mp9"] = "MP9",
    ["p90"] = "P90",

    -- Rifles
    ["galil"] = "Galil AR",
    ["famas"] = "FAMAS",
    ["m4a1_silencer"] = "M4A1-S",
    ["m4a4"] = "M4A4",
    ["aug"] = "AUG",
    ["sg556"] = "SG 553",
    ["ak47"] = "AK-47",

    -- Snipers
    ["g3sg1"] = "G3SG1",
    ["scar20"] = "SCAR-20",
    ["awp"] = "AWP",
    ["ssg08"] = "SSG 08",

    -- Shotguns/LMGs
    ["xm1014"] = "XM1014",
    ["sawedoff"] = "Sawed-Off",
    ["mag7"] = "MAG-7",
    ["nova"] = "Nova",
    ["negev"] = "Negev",
    ["m249"] = "M249",

    -- Other
    ["zeus"] = "Zeus x27",
    ["flashbang"] = "Flashbang",
    ["hegrenade"] = "HE Grenade",
    ["smokegrenade"] = "Smoke Grenade",
    ["molotov"] = "Molotov",
    ["decoy"] = "Decoy Grenade",
    ["incgrenade"] = "Incendiary Grenade",
    ["c4"] = "C4 Explosive"
}

local bone_ids = {
    ["Head"] = 6,
    ["Chest"] = 4,
    ["Stomach"] = 0,
    ["Left Leg"] = 22,
    ["Right Leg"] = 25,
    ["Left Foot"] = 24,
    ["Right Foot"] = 27
}

local skeleton_bone_ids = {
    Head = 6,
    Neck = 5,
    Spine = 4,
    Pelvis = 0,
    LeftShoulder = 8,
    LeftElbow = 9,
    LeftHand = 10,
    RightShoulder = 13,
    RightElbow = 14,
    RightHand = 15,
    LeftHip = 22,
    LeftKnee = 23,
    LeftFoot = 24,
    RightHip = 25,
    RightKnee = 26,
    RightFoot = 27
}

local M_PI = 3.14159265358979323846

local bone_connections = {{skeleton_bone_ids.Head, skeleton_bone_ids.Neck},
                          {skeleton_bone_ids.Neck, skeleton_bone_ids.Spine},
                          {skeleton_bone_ids.Spine, skeleton_bone_ids.Pelvis},
                          {skeleton_bone_ids.Neck, skeleton_bone_ids.LeftShoulder},
                          {skeleton_bone_ids.LeftShoulder, skeleton_bone_ids.LeftElbow},
                          {skeleton_bone_ids.LeftElbow, skeleton_bone_ids.LeftHand},
                          {skeleton_bone_ids.Neck, skeleton_bone_ids.RightShoulder},
                          {skeleton_bone_ids.RightShoulder, skeleton_bone_ids.RightElbow},
                          {skeleton_bone_ids.RightElbow, skeleton_bone_ids.RightHand},
                          {skeleton_bone_ids.Pelvis, skeleton_bone_ids.LeftHip},
                          {skeleton_bone_ids.LeftHip, skeleton_bone_ids.LeftKnee},
                          {skeleton_bone_ids.LeftKnee, skeleton_bone_ids.LeftFoot},
                          {skeleton_bone_ids.Pelvis, skeleton_bone_ids.RightHip},
                          {skeleton_bone_ids.RightHip, skeleton_bone_ids.RightKnee},
                          {skeleton_bone_ids.RightKnee, skeleton_bone_ids.RightFoot}}
local view_matrix = nil

local function source_2_wts(x, y, z)
    local wts = source2.world_to_screen(vector(x, y, z), view_matrix)
    if wts == nil then
        return nil, nil
    end
    return wts.x, wts.y
end

-- Optimized world-to-screen function with cached matrix
local cached_matrix = {}
local matrix_cache_time = 0
local MATRIX_CACHE_DURATION = 16

local function w2s(pos)
    local current_time = utility.get_tickcount()

    -- Update matrix cache if expired
    if current_time - matrix_cache_time > MATRIX_CACHE_DURATION then
        view_matrix = memory.read_mat4(client + offsets.dwViewMatrix)
        for i = 0, 15 do
            cached_matrix[i + 1] = view_matrix[i + 1]
        end
        matrix_cache_time = current_time
    end

    return source2.world_to_screen(pos, view_matrix)
end

-- Get team color for display
local function get_team_color(team_num)
    if team_num == 2 then
        return {255, 165, 0, 255} -- Orange for Terrorists
    elseif team_num == 3 then
        return {0, 100, 255, 255} -- Blue for Counter-Terrorists
    else
        return {255, 255, 255, 255} -- White for unknown/spectators
    end
end

-- Hitbox helper functions
local hitbox_to_bone_map = {
    ["head_0"] = 6,
    ["neck_0"] = 5,
    ["pelvis"] = 0,
    ["spine_0"] = 1,
    ["spine_1"] = 2,
    ["spine_2"] = 3,
    ["spine_3"] = 4,
    ["hand_l"] = 10,
    ["hand_r"] = 15,
    ["arm_upper_l"] = 8,
    ["arm_lower_l"] = 9,
    ["arm_upper_r"] = 13,
    ["arm_lower_r"] = 14,
    ["leg_upper_l"] = 22,
    ["leg_upper_r"] = 25,
    ["leg_lower_l"] = 23,
    ["leg_lower_r"] = 26,
    ["ankle_l"] = 24,
    ["ankle_r"] = 27
}

local SteamProfileXMLParser = {}
SteamProfileXMLParser.__index = SteamProfileXMLParser

function SteamProfileXMLParser:new(steamid64)
    local self = setmetatable({}, SteamProfileXMLParser)
    
    self.steamid64 = steamid64
    self.raw_xml_data = ""
    self.parsed_xml_data = {}
    self.is_parsed = false
    self.delimiters = {}
    
    self:fetch_profile_data()
    
    return self
end

function SteamProfileXMLParser:fetch_profile_data()
    local url = "https://steamcommunity.com/profiles/" .. tostring(self.steamid64) .. "/?xml=1"
    
    http.get(url, {}, function(body)
        self.raw_xml_data = body
        utility.log("[SteamProfileParser] Fetched XML data for SteamID: " .. tostring(self.steamid64))
    end)
end

function SteamProfileXMLParser:create_delimiters()
    -- Tags to be deleted (similar to C++ version)
    local deletion_tags_start = {"<inGameInfo>"}
    local deletion_tags_end = {"</inGameInfo>"}
    
    if #deletion_tags_start >= 1 and #deletion_tags_end >= 1 and #deletion_tags_start == #deletion_tags_end then
        for i = 1, #deletion_tags_start do
            table.insert(self.delimiters, {
                start_tag = deletion_tags_start[i],
                end_tag = deletion_tags_end[i]
            })
        end
    end
end

function SteamProfileXMLParser:remove_between(str, start_pattern, end_pattern)
    local start_pos = string.find(str, start_pattern, 1, true)
    if start_pos then
        local end_pos = string.find(str, end_pattern, start_pos, true)
        if end_pos then
            return string.sub(str, 1, start_pos - 1) .. string.sub(str, end_pos + #end_pattern)
        end
    end
    return str
end

function SteamProfileXMLParser:parse()
    if self.raw_xml_data == "" then
        utility.log("[SteamProfileParser] No XML data to parse")
        return false
    end
    
    local xml_data = self.raw_xml_data
    
    -- Create delimiters
    self:create_delimiters()
    
    -- Remove XML declaration and profile tag
    local topline_first = string.find(xml_data, "<?xml", 1, true)
    local topline_last = string.find(xml_data, "<profile>", 1, true)
    
    if topline_first and topline_last then
        xml_data = string.sub(xml_data, topline_last + #"<profile>")
    end
    
    -- Remove everything from <customURL> tag onwards
    local custom_url_pos = string.find(xml_data, "<customURL>", 1, true)
    if custom_url_pos then
        xml_data = string.sub(xml_data, 1, custom_url_pos - 1)
    end
    
    -- Remove delimited sections
    for i = 1, #self.delimiters do
        xml_data = self:remove_between(xml_data, self.delimiters[i].start_tag, self.delimiters[i].end_tag)
    end
    
    -- Remove CDATA tags
    xml_data = string.gsub(xml_data, "<![CDATA[", "")
    xml_data = string.gsub(xml_data, "]]>", "")
    
    -- Remove closing profile tag
    xml_data = string.gsub(xml_data, "</profile>", "")
    
    -- Remove tabs and carriage returns
    xml_data = string.gsub(xml_data, "\t", "")
    xml_data = string.gsub(xml_data, "\r", "")
    
    -- Split into lines
    local lines = {}
    for line in string.gmatch(xml_data, "[^\n]+") do
        -- Trim whitespace
        line = string.match(line, "^%s*(.-)%s*$")
        if line ~= "" then
            table.insert(lines, line)
        end
    end
    
    -- Parse each line
    for i = 1, #lines do
        local line = lines[i]
        
        -- Extract tag name and value
        local tag_name = string.match(line, "<([^>]+)>")
        local tag_value = string.match(line, ">([^<]*)<")
        
        if tag_name and tag_value then
            -- Clean up tag name (remove attributes if any)
            tag_name = string.match(tag_name, "^([^%s]+)")
            
            -- Store in parsed data
            self.parsed_xml_data[tag_name] = tag_value
        end
    end
    
    self.is_parsed = true
    utility.log("[SteamProfileParser] Successfully parsed XML data")
    return true
end

function SteamProfileXMLParser:get_data_member(keyname)
    if self.is_parsed then
        return self.parsed_xml_data[keyname] or ""
    else
        return self.raw_xml_data
    end
end

function SteamProfileXMLParser:get_all_data()
    if self.is_parsed then
        return self.parsed_xml_data
    else
        return nil
    end
end

function SteamProfileXMLParser:print_data()
    if self.is_parsed then
        utility.log("[SteamProfileParser] Parsed data:")
        for key, value in pairs(self.parsed_xml_data) do
            utility.log("  " .. key .. ": " .. value)
        end
    else
        utility.log("[SteamProfileParser] Data not parsed yet")
    end
end



local function read_string(address, max_length)
    local str = ""
    for i = 0, max_length - 1 do
        local byte = memory.read_byte(address + i)
        if byte == 0 then
            break
        end
        str = str .. string.char(byte)
    end
    return str
end

local function read_quaternion(address)
    local x = memory.read_float(address)
    local y = memory.read_float(address + 4)
    local z = memory.read_float(address + 8)
    local w = memory.read_float(address + 12)
    return {
        x = x,
        y = y,
        z = z,
        w = w
    }
end

local function read_bone_data(address)
    local location = memory.read_vector3(address)
    local scale = memory.read_float(address + 12)
    local rotation = read_quaternion(address + 16)
    return {
        location = location,
        scale = scale,
        rotation = rotation
    }
end

local function quaternion_rotate_vector(q, v)
    local qv = vector(q.x, q.y, q.z)
    local uv = qv:cross(v)
    local uuv = qv:cross(uv)
    return v + uv:scale(2.0 * q.w) + uuv:scale(2.0)
end

local function get_hitbox(entity_ptr, index)
    -- Follow the proper data structure chain from offsets.cs
    -- entity -> CBodyComponent -> CSkeletonInstance -> CModelState
    local body_component = memory.read_int64(entity_ptr + 0x38) -- m_CBodyComponent
    if body_component == 0 then
        return nil
    end

    local skeleton_instance = memory.read_int64(body_component + 0x50) -- m_skeletonInstance
    if skeleton_instance == 0 then
        return nil
    end
    
    local model_state = memory.read_int64(skeleton_instance + 0x170) -- m_modelState
    if model_state == 0 then
        return nil
    end
    
    local model_ptr = memory.read_int64(model_state + 0xA0) -- m_hModel
    

    -- Try alternative approach using CHitboxComponent
    local hitbox_component = memory.read_int64(entity_ptr + offsets.CHitboxComponent)
    if hitbox_component == 0 then
        -- Fallback to simplified hitbox structure
        return {
            name = "hitbox_" .. index,
            start = vector(-2, -2, -2),
            endPos = vector(2, 2, 2),
            radius = 3.0
        }
    end

    -- If we have a valid hitbox component, try to read basic hitbox data
    local hitbox = {}
    hitbox.name = "hitbox_" .. index
    hitbox.start = vector(-3, -3, -3)
    hitbox.endPos = vector(3, 3, 3)
    hitbox.radius = 4.0

    return hitbox
end

local function get_bone_location(entity_ptr, bone_index)
    local body_component = memory.read_int64(entity_ptr + offsets.CBodyComponent)
    if body_component == 0 then
        return nil
    end

    local skeleton_instance = memory.read_int64(body_component + offsets.m_skeletonInstance)
    if skeleton_instance == 0 then
        return nil
    end

    local model_state = memory.read_int64(skeleton_instance + offsets.skeleton_model_state)
    if model_state == 0 then
        return nil
    end

    local bone_data_address = model_state + bone_index * 32
    return read_bone_data(bone_data_address)
end

local function create_circle(point, center, radius, segments)
    local points = {}

    local normal = (point - center):normalize()

    local arbitrary = vector(1, 0, 0)
    if math.abs(normal.x) >= 0.99 then
        arbitrary = vector(0, 1, 0)
    end

    local u = normal:cross(arbitrary):normalize()
    local v = normal:cross(u):normalize()

    for i = 0, segments do
        local angle = (2.0 * M_PI * i) / segments
        local circle_point = point + (u:scale(math.cos(angle)) + v:scale(math.sin(angle))):scale(radius)
        table.insert(points, circle_point)
    end

    return points
end

local function extend_vector(from, to, distance)
    local direction = (to - from):normalize()
    return from + direction:scale(distance)
end

local function draw_capsule(vMin, vMax, radius, rotation, origPos, color, segments, thickness)
    local bottom = quaternion_rotate_vector(rotation, vMax)
    local top = quaternion_rotate_vector(rotation, vMin)

    local distance = top:dist_to(bottom)
    local point = extend_vector(top, bottom, distance * 2)

    local radiusHalf = radius * math.cos((M_PI * 2) / 360 * 45)

    local topSmallCircle = create_circle(extend_vector(top, bottom, -radiusHalf), point, radiusHalf, segments)
    local topCircle = create_circle(top, point, radius, segments)
    local bottomSmallCircle = create_circle(extend_vector(bottom, top, -radiusHalf), point, radiusHalf, segments)
    local bottomCircle = create_circle(bottom, point, radius, segments)

    local w2sTop = w2s(extend_vector(top, bottom, -radius) + origPos)
    local w2sBottom = w2s(extend_vector(bottom, top, -radius) + origPos)

    if not w2sTop or not w2sBottom then
        return
    end

    local wtopSmallCircle = {}
    local wtopCircle = {}
    local wbottomSmallCircle = {}
    local wbottomCircle = {}

    for i = 1, segments + 1 do
        wtopSmallCircle[i] = w2s(topSmallCircle[i] + origPos)
        wtopCircle[i] = w2s(topCircle[i] + origPos)
        wbottomSmallCircle[i] = w2s(bottomSmallCircle[i] + origPos)
        wbottomCircle[i] = w2s(bottomCircle[i] + origPos)
    end

    local r, g, b, a = color[1], color[2], color[3], color[4]

    for i = 1, segments do
        if wtopSmallCircle[i] and w2sTop then
            render.line(wtopSmallCircle[i].x, wtopSmallCircle[i].y, w2sTop.x, w2sTop.y, r, g, b, a, thickness)
        end
        if wtopSmallCircle[i] and wtopCircle[i] then
            render.line(wtopSmallCircle[i].x, wtopSmallCircle[i].y, wtopCircle[i].x, wtopCircle[i].y, r, g, b, a,
                thickness)
        end
        if wtopCircle[i] and wbottomCircle[i] then
            render.line(wtopCircle[i].x, wtopCircle[i].y, wbottomCircle[i].x, wbottomCircle[i].y, r, g, b, a, thickness)
        end
        if wbottomCircle[i] and wbottomSmallCircle[i] then
            render.line(wbottomCircle[i].x, wbottomCircle[i].y, wbottomSmallCircle[i].x, wbottomSmallCircle[i].y, r, g,
                b, a, thickness)
        end
        if wbottomSmallCircle[i] and w2sBottom then
            render.line(wbottomSmallCircle[i].x, wbottomSmallCircle[i].y, w2sBottom.x, w2sBottom.y, r, g, b, a,
                thickness)
        end
    end

    for i = 1, segments do
        if wtopSmallCircle[i] and wtopSmallCircle[i + 1] then
            render.line(wtopSmallCircle[i].x, wtopSmallCircle[i].y, wtopSmallCircle[i + 1].x, wtopSmallCircle[i + 1].y,
                r, g, b, a, thickness)
        end
        if wtopCircle[i] and wtopCircle[i + 1] then
            render.line(wtopCircle[i].x, wtopCircle[i].y, wtopCircle[i + 1].x, wtopCircle[i + 1].y, r, g, b, a,
                thickness)
        end
        if wbottomCircle[i] and wbottomCircle[i + 1] then
            render.line(wbottomCircle[i].x, wbottomCircle[i].y, wbottomCircle[i + 1].x, wbottomCircle[i + 1].y, r, g, b,
                a, thickness)
        end
        if wbottomSmallCircle[i] and wbottomSmallCircle[i + 1] then
            render.line(wbottomSmallCircle[i].x, wbottomSmallCircle[i].y, wbottomSmallCircle[i + 1].x,
                wbottomSmallCircle[i + 1].y, r, g, b, a, thickness)
        end
    end
end

-- Calculate bounding box for entity (from cs2_base.lua approach)
local function calculate_bounding_box(entity)
    if not entity.bones or entity.bones == 0 then
        return nil
    end

    local head_pos = memory.read_vector3(entity.bones + bone_ids["Head"] * 32)
    local feet_pos = entity.origin or memory.read_vector3(entity.node + offsets.m_vecOrigin)

    local head_screen = w2s(head_pos)
    local feet_screen = w2s(feet_pos)

    if not head_screen or not feet_screen then
        return nil
    end

    local height = feet_screen.y - head_screen.y
    local width = height * 0.5 -- Aspect ratio from cs2_base.lua
    local box_x = head_screen.x - width / 2
    local box_y = head_screen.y - height * 0.05

    return {
        x = box_x,
        y = box_y,
        width = width,
        height = height,
        head_screen = head_screen,
        feet_screen = feet_screen
    }
end

local function get_cursor_position()
    local mouse = input.get_cursor_position()
    return mouse.x, mouse.y
end

local function contains(table, value)
    for _, v in ipairs(table) do
        if v:lower() == value:lower() then
            return true
        end
    end
    return false
end

local function get_window_size()
    local size = overlay.get_window_size()
    if size and size.x and size.y then
        return size.x, size.y
    end
    return 1920, 1080 -- fallback values
end

-- Hit Sound Configuration
local HitSoundConfig = {
    enabled = false,
    selectedSound = "silenthill",
    availableSounds = {"silenthill", "silenthill_1"},
    cachedSounds = {}
}

-- Hit Marker Configuration
local HitMarkerConfig = {
    enabled = false,
    effects = {},
    maxEffects = 10,
    duration = 800
}


-- Cache hitsounds on startup
local function cacheHitSounds()
    for _, soundName in ipairs(HitSoundConfig.availableSounds) do
        local fileName = soundName .. ".wav"
        local success, soundData = pcall(file.read, fileName)
        if success and soundData then
            HitSoundConfig.cachedSounds[soundName] = soundData
            print("[Hitsound] Successfully cached: " .. fileName)
        else
            print("[Hitsound] Failed to load: " .. fileName .. " - " .. tostring(soundData))
        end
    end
end

-- Call cache function on startup
cacheHitSounds()



-- Custom SDK inspired by cs2_sdk.lua but using our own offsets
local CustomSDK = {}


CustomSDK.entity = {}
function CustomSDK.entity.getHealth(entity_pawn)
    return memory.read_int(entity_pawn + offsets.m_iHealth)
end

function CustomSDK.entity.isAlive(entity_pawn)
    local health = memory.read_int(entity_pawn + offsets.m_iHealth)
    return health > 0
end

function CustomSDK.entity.getTeam(entity_controller)
    return memory.read_int(entity_controller + offsets.m_iTeamNum)
end

function CustomSDK.entity.getSpeed(entity_pawn)
    local vel = memory.read_vector3(entity_pawn + 0x3F0) -- m_vecAbsVelocity
    local x, y, z = vel.x, vel.y, vel.z
    return math.sqrt(x * x + y * y + z * z)
end

function CustomSDK.entity.getWeaponIndex(entity_pawn)
    local weapon = memory.read_int64(entity_pawn + 0x13A0) -- m_pClippingWeapon
    if weapon == 0 then
        return 0
    end
    return memory.read_short(weapon + 0x1148 + 0x50 + 0x1BA) -- AttributeManager + Item + ItemDefinitionIndex
end

function CustomSDK.entity.isScoped(entity_pawn)
    return memory.read_bool(entity_pawn + 0x23E8) -- m_bIsScoped
end

function CustomSDK.entity.getCrosshairEntity(local_player_pawn)
    local crosshair = memory.read_int(local_player_pawn + 0x1458) -- m_iIDEntIndex
    local entityList = memory.read_int64(client + offsets.dwEntityList)
    return source2.read_entity_by_index(entityList, crosshair)
end

CustomSDK.localplayer = {}
function CustomSDK.localplayer.get()
    return memory.read_int64(client + offsets.dwLocalPlayerPawn)
end

CustomSDK.bomb = {}
function CustomSDK.bomb.isPlanted()
    local gameRules = memory.read_int64(client + 0x1A840B0) -- dwGameRules (using existing offset from original file)
    return memory.read_bool(gameRules + 0x9A5) -- m_bBombPlanted
end

function CustomSDK.bomb.isBeingDefused()
    local bombEntity = memory.read_int64(client + 0x1A22570) -- dwWeaponC4 (using existing offset from original file)
    return memory.read_bool(bombEntity + 0xFCC) -- m_bBeingDefused
end

function CustomSDK.bomb.getPlantSite()
    local bombEntity = memory.read_int64(client + 0x1A22570) -- dwWeaponC4
    local bombInt = memory.read_int(bombEntity + 0xF94) -- m_nBombSite
    if bombInt == 0 then
        return "A"
    end
    if bombInt == 1 then
        return "B"
    end
    return "Unknown"
end

local function create_entity_wrapper(controller, pawn)
    local entity = {}
    local node = memory.read_int64(pawn + offsets.m_pGameSceneNode)
    local bones = memory.read_int64(node + offsets.m_modelState + 0x80)

    entity.controller = controller
    entity.pawn = pawn
    entity.node = node
    entity.bones = bones

    -- Basic entity properties
    function entity:is_local_player()
        local local_controller = memory.read_int64(client + offsets.dwLocalPlayerController)
        return controller == local_controller
    end

    function entity:get_health()
        return CustomSDK.entity.getHealth(self.pawn)
    end

    function entity:get_position()
        local pos = memory.read_vector3(self.node + offsets.m_vecOrigin)
        return pos.x, pos.y, pos.z
    end

    function entity:bone_position(bone_index)
        local pos = memory.read_vector3(self.bones + bone_index * 32)
        return pos.x, pos.y, pos.z
    end

    function entity:is_alive()
        return memory.read_bool(self.controller + offsets.m_bPawnIsAlive)
    end

    function entity:get_team()
        return CustomSDK.entity.getTeam(self.controller)
    end

    function entity:is_visible()
        return memory.read_bool(self.pawn + offsets.m_entitySpottedState + offsets.m_bSpotted)
    end

    function entity:is_enemy()
        local local_controller = memory.read_int64(client + offsets.dwLocalPlayerController)
        if local_controller == 0 then
            return false
        end
        local local_team = memory.read_int(local_controller + offsets.m_iTeamNum)
        local my_team = memory.read_int(self.controller + offsets.m_iTeamNum)
        return my_team ~= local_team and my_team ~= 0 and local_team ~= 0
    end

    function entity:get_name()
        local name_ptr = memory.read_int64(self.controller + offsets.m_sSanitizedPlayerName)
        if name_ptr ~= 0 then
            local nam = memory.read_string(name_ptr)
            return nam
        end
        return "Player"
    end

    function entity:get_steamid()
        local controller = memory.read_int64(self.pawn + offsets.m_hController)
        local steam_id = memory.read_int64(controller + offsets.m_steamID)
        return steam_id
    end

    -- Enhanced movement and state detection
    function entity:get_velocity()
        local vel = memory.read_vector3(self.pawn + 0x3F0) -- m_vecAbsVelocity offset
        return vel.x, vel.y, vel.z
    end

    function entity:get_speed()
        return CustomSDK.entity.getSpeed(self.pawn)
    end

    function entity:get_flags()
        return memory.read_int(self.pawn + 0x3EC) -- m_fFlags offset
    end

    function entity:is_on_ground()
        local flags = self:get_flags()
        return flags == 65665
    end

    function entity:is_ducking()
        local flags = self:get_flags()
        return flags == 65667
    end

    function entity:is_moving()
        return self:get_speed() > 5
    end

    -- Weapon information
    function entity:get_active_weapon()
        if not self.pawn or self.pawn == 0 then
            return "Default"
        end

        local weapon = memory.read_int64(self.pawn + 0x13A0) -- m_pClippingWeapon
        if weapon == 0 then
            return "Default"
        end

        local designer_name = memory.read_short(weapon + offsets.C_EconEntity.m_AttributeManager +
                                                    offsets.C_AttributeContainer.m_Item +
                                                    offsets.C_EconItemView.m_iItemDefinitionIndex)
        if not designer_name then return "Default" end
        local raw_name = weapon_index_map[designer_name]
        if not raw_name then return "Default" end
        if contains({"CT knife", "T knife", "c4", "incgrenade", "decoy", "molotov", "smokegrenade", "hegrenade", "flashbang", "zeus"}, raw_name) then
            return "Default"
        end

        return raw_name or "Default"
    end

    function entity:get_weapon_index()
        return CustomSDK.entity.getWeaponIndex(self.pawn)
    end

    function entity:is_scoped()
        return CustomSDK.entity.isScoped(self.pawn)
    end

    function entity:get_weapon_name()
        local weapon_index = self:get_weapon_index()
        return CustomSDK.weapon.getType(weapon_index)
    end

    return entity
end



-- CS2 SDK functions are now handled by the cs2_sdk module initialized above
-- Helper function to get local player properly
local function get_local_player()
    local entity_list = memory.read_int64(client + offsets.dwEntityList)
    local local_controller = memory.read_int64(client + offsets.dwLocalPlayerController)

    if local_controller == 0 then
        return nil
    end

    local pawn_handle = memory.read_int64(local_controller + offsets.m_hPawn) % 4294967296
    local local_pawn = source2.read_entity_by_index(entity_list, pawn_handle % 32768)

    if local_pawn == 0 then
        return nil
    end

    return create_entity_wrapper(local_controller, local_pawn)
end


-- Hitlog system configuration
local HitlogConfig = {
    enabled = false,
    lastLocalPlayerHits = 0,
    lastDamageTaken = 0,
    lastAttackerIndex = -1,
    lastLocalPlayerHealth = 100,
    trackedPlayers = {},  -- Cache for tracking other players' health
    lastHitTime = 0,      -- Track when last hit occurred
    hitCooldown = 100     -- Milliseconds to prevent duplicate hit detection
}

-- Hitlog system functions
local function getPlayerNameByIndex(entityIndex)
    local entities = get_entities()
    if entities and entities[entityIndex] then
        return entities[entityIndex].name or "Unknown"
    end
    return "Unknown"
end

local function trackDamageDealt(damageAmount, targetName, bodypart)
    if not HitlogConfig.enabled then return end
    
    -- Create damage dealt notification with enhanced formatting
    local title = "⚡ Damage Dealt"
    local message = string.format("Hit %s for %d HP (%s)", 
        targetName or "Enemy", 
        damageAmount or 0, 
        bodypart or "body")
    
    Library.Notify(title, message, "info", 4000)
end

local function trackDamageReceived(damageAmount, attackerName, bodypart)
    if not HitlogConfig.enabled then return end
    
    -- Create damage received notification with enhanced formatting
    local title = "💥 Damage Taken"
    local message = string.format("-%d HP from %s (%s)", 
        damageAmount or 0, 
        attackerName or "Enemy", 
        bodypart or "body")
    
    Library.Notify(title, message, "warning", 4000)
end

-- Determine bodypart from aimbot target or hitbox
local function getBodypartFromTarget()
    if aimbot and aimbot.current_target and aimbot.current_target.hitbox then
        local hitbox = aimbot.current_target.hitbox
        if hitbox:find("head") then
            return "head"
        elseif hitbox:find("neck") then
            return "neck"
        elseif hitbox:find("chest") or hitbox:find("spine") then
            return "chest"
        elseif hitbox:find("stomach") or hitbox:find("pelvis") then
            return "stomach"
        elseif hitbox:find("arm") or hitbox:find("hand") then
            return "arm"
        elseif hitbox:find("leg") or hitbox:find("ankle") then
            return "leg"
        end
    end
    return "body"
end

local function updateHitlogTracking()
    if not HitlogConfig.enabled then return end
    
    local localPlayer = get_local_player()
    if not localPlayer or not localPlayer:is_alive() then return end
    
    -- Track local player health changes (damage received)
    local currentHealth = CustomSDK.entity.getHealth(localPlayer.pawn)
    if HitlogConfig.lastLocalPlayerHealth > currentHealth then
        local damageReceived = HitlogConfig.lastLocalPlayerHealth - currentHealth
        trackDamageReceived(damageReceived, "Enemy", "body") -- Limited info available
    end
    HitlogConfig.lastLocalPlayerHealth = currentHealth
    
    -- Track other players' health for damage dealt detection
    local currentTime = utility.get_tickcount()
    local entities = get_entities()
    if entities then
        for _, entity in ipairs(entities) do
            if entity and entity.index and entity.index ~= localPlayer.index then
                local entityHealth = entity.health or 0
                local lastHealth = HitlogConfig.trackedPlayers[entity.index]
                
                if lastHealth and lastHealth > entityHealth and entityHealth >= 0 then
                    -- Player took damage, check if we recently hit someone
                    local timeSinceLastHit = currentTime - HitlogConfig.lastHitTime
                    if timeSinceLastHit <= HitlogConfig.hitCooldown then
                        local damageDealt = lastHealth - entityHealth
                        local targetName = entity.name or "Unknown"
                        local bodypart = getBodypartFromTarget()
                        trackDamageDealt(damageDealt, targetName, bodypart)
                    end
                end
                
                -- Update tracked health
                HitlogConfig.trackedPlayers[entity.index] = entityHealth
            end
        end
    end
end

--[[
local function get_entities()


    local entity_list = memory.read_int64(client + offsets.dwEntityList)
    local local_controller = memory.read_int64(client + offsets.dwLocalPlayerController)
    local local_team = memory.read_int64(local_controller + offsets.m_iTeamNum) % 4294967296
    local entities = {}
    
    for i = 1, 64 do
        local controller = source2.read_entity_by_index(entity_list, i)
        
        if controller == 0 or controller == local_controller then goto continue end
        local team = memory.read_int64(controller + offsets.m_iTeamNum) % 4294967296
        if team == local_team then goto continue end
        
        local pawn_handle = memory.read_int64(controller + offsets.m_hPawn) % 4294967296
        local pawn = source2.read_entity_by_index(entity_list, pawn_handle % 32768)
        if pawn == 0 then goto continue end

        entities[#entities + 1] = create_entity_wrapper(controller, pawn)

        ::continue::

    end
    return entities
end
]] --
function get_entities()
    return Library.ESP.EntityCache:Update()
end

local Drawing = {}
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
local Graph = {}
Graph.__index = Graph
setmetatable(Graph, Element)
local Dropdown = {}
Dropdown.__index = Dropdown
setmetatable(Dropdown, Element)
local MultiSelectDropdown = {}
MultiSelectDropdown.__index = MultiSelectDropdown
setmetatable(MultiSelectDropdown, Element)
local ColorPicker = {}
ColorPicker.__index = ColorPicker
setmetatable(ColorPicker, Element)
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
local EntityESPPreview = {}
EntityESPPreview.__index = EntityESPPreview
setmetatable(EntityESPPreview, Element)
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
local Divider = {}
Divider.__index = Divider
setmetatable(Divider, Element)
local Separator = {}
Separator.__index = Separator
setmetatable(Separator, Element)
local Notification = {}
Notification.__index = Notification
local ZIndexCounter = 1000
local ActiveElements = {}
do
    http.get("https://raw.githubusercontent.com/Tyris0001/melatonin/refs/heads/main/assets/Joeyy.png", {},
        function(imageData)
            if imageData and #imageData > 0 then
                local textureId = utility.load_image(imageData)
                if textureId then
                    Library.Assets.Joeyy = textureId
                end
            end
        end)
end

-- Helper function to apply fade alpha to colors
function ApplyFadeAlpha(color, fadeAlpha)
    if not color or not fadeAlpha then
        return color
    end
    return {color[1] or 255, color[2] or 255, color[3] or 255, math.floor((color[4] or 255) * fadeAlpha)}
end

function Library:BeginDraw()
    if not self._callbacks_set then
        UpdateInputState()
        if aimbot then
            aimbot:update()
        end
        if self.TargetHUD then
            self.TargetHUD:Update()
        end
        if self.ESP and self.ESP.Enabled then
            self.ESP:Update()
        end
        if self.Watermark then
            self.Watermark:Update()
        end
        local currentInsertState = utility.key_state(elements.menu_keybind.keyCode or 0x12)
        if currentInsertState and not self._lastInsertState then
            self._windowVisible = not self._windowVisible
            if MainWindow then
                MainWindow.visible = self._windowVisible
            end
        end
        self._lastInsertState = currentInsertState
        local currentTime = utility.get_tickcount()
        if currentTime - (self._lastPlayerUpdate or 0) > 1000 then
            pcall(function()
                if sections and sections.MainPlayerList then
                    sections.MainPlayerList:UpdatePlayers()
                end
            end)
            self._lastPlayerUpdate = currentTime
        end
        if self.KeybindsList and self.KeybindsList.visible then
            self.KeybindsList:HandleInput()
        end
        for _, element in ipairs(self.SortedElements or {}) do
            if element and element.HandleInput then
                element:HandleInput()
            end
        end
        for _, window in ipairs(self.Windows or {}) do
            if window and window.visible and window.HandleInput then
                window:HandleInput()
            end
        end
        if self.KeybindsList and self.KeybindsList.visible then
            self.KeybindsList:Update()
        end
        if self.Notifications then
            self.Notifications:Update()
        end
        get_entities()
    end
end



function Library.ESP.EntityCache:Update()
    local currentTime = utility.get_tickcount()
    if currentTime - self.lastUpdate < self.updateInterval then
        return self.entities
    end

    self.lastUpdate = currentTime
    self.entities = {}

    local entity_list = memory.read_int64(client + offsets.dwEntityList)
    local local_controller = memory.read_int64(client + offsets.dwLocalPlayerController)
    self.localPlayerController = local_controller

    for i = 1, 64 do
        local controller = source2.read_entity_by_index(entity_list, i)
        if controller ~= 0 then
            local pawn_handle = memory.read_int64(controller + offsets.m_hPawn) % 4294967296
            local pawn = source2.read_entity_by_index(entity_list, pawn_handle % 32768)

            if pawn ~= 0 then
                local entity = create_entity_wrapper(controller, pawn)
                if controller == local_controller then
                    self.localPlayer = entity
                end
                table.insert(self.entities, entity)
            end
        end
    end

    return self.entities
end

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
    local scaled_font = math.max(1, math.floor((font or 2) * scale_factor))
    if centered then
        local textWidth, textHeight = render.measure_text(scaled_font, true, text)
        x = x - textWidth / 2
        y = y - textHeight / 2
    end
    render.text(x, y, r, g, b, a, scaled_font, true, text)
    return render.measure_text(scaled_font, true, text)
end
function Library.ESP:GetEntityColor(entity_obj)
    local entities = get_entities()
    local localPlayer = nil
    for _, ent in ipairs(entities) do
        if ent.controller and memory.read_int64(ent.controller + offsets.dwLocalPlayerController) ~= 0 then
            localPlayer = ent
            break
        end
    end
    if entity_obj == localPlayer then
        return self.Colors.Local
    elseif entity_obj:is_enemy() then
        return self.Colors.Enemy
    else
        return self.Colors.Friendly
    end
end
function Library.ESP:GetPlayerBounds(player)
    -- Use the optimized calculate_bounding_box function
    local bbox = calculate_bounding_box(player)
    if not bbox then
        return 0, 0, 0, 0, 1.0
    end

    local scale_factor = math.max(0.5, math.min(2.0, bbox.height / 100))
    return bbox.x, bbox.y, bbox.width, bbox.height, scale_factor
end
function Library.ESP:Draw2DBox(player, color)
    -- Use improved bounding box calculation
    local bbox = calculate_bounding_box(player)
    if not bbox then
        return 0, 0, 0, 0, 1.0
    end

    local x, y, width, height = bbox.x, bbox.y, bbox.width, bbox.height
    local scale_factor = math.max(0.5, math.min(2.0, height / 100)) -- Dynamic scaling

    -- Draw main box
    self:DrawRect(x, y, width, height, color, false, 0)
    -- Draw black outline for visibility
    self:DrawRect(x - 1, y - 1, width + 2, height + 2, {0, 0, 0, 180}, false, 0)

    return x, y, width, height, scale_factor
end
function Library.ESP:DrawHealthBar(x, y, width, height, health_value)
    -- Health bar like cs2_base.lua - simpler and more effective
    local health_percentage = math.max(0, math.min(100, health_value))
    local bar_width = 3
    local bar_height = height * (health_percentage / 100)
    local bar_x = x - 6 -- Left side of bounding box
    local bar_y = y + (height - bar_height)

    -- Check addons
    local hasGlow = false
    local hasGradient = false
    local hasCustomColor = false
    local hasGradientAnimation = false
    if self.HealthBarAddons then
        for _, addon in ipairs(self.HealthBarAddons) do
            if addon:lower():find("glow") then
                hasGlow = true
            elseif addon:lower():find("gradient") and addon:lower():find("animation") then
                hasGradientAnimation = true
                hasGradient = true -- Gradient animation includes gradient
            elseif addon:lower():find("gradient") then
                hasGradient = true
            elseif addon:lower():find("custom color") then
                hasCustomColor = true
            end
        end
    end

    -- Health bar color logic
    local r, g, b, a = 0, 255, 0, 255 -- Default green
    local useCustomColor = false


    -- Use colorpicker color if available, otherwise use health-based colors
    if self.Colors and self.Colors.HealthBar and hasCustomColor then
        r, g, b, a = self.Colors.HealthBar[1], self.Colors.HealthBar[2], self.Colors.HealthBar[3], self.Colors.HealthBar[4] or 255
        useCustomColor = true
    else
        -- Default health-based colors
        if health_percentage > 60 then
            r, g, b = 0, 255, 0 -- Green
        elseif health_percentage > 30 then
            r, g, b = 255, 255, 0 -- Yellow
        else
            r, g, b = 255, 0, 0 -- Red
        end
    end

    -- Background (black) with optional glow using healthbar color
    if hasGlow then
        -- Draw glow effect using the healthbar color
        self:DrawRect(bar_x - 3, y - 3, bar_width + 6, height + 6, {r, g, b, 50}, true, 0)
        self:DrawRect(bar_x - 2, y - 2, bar_width + 4, height + 4, {r, g, b, 75}, true, 0)
    end
    self:DrawRect(bar_x - 1, y - 1, bar_width + 2, height + 2, {0, 0, 0, 255}, true, 0)

    if bar_height > 0 then
        if hasGradient then
            -- Calculate pulse animation factor if enabled
            local pulseMultiplier = 1.0
            if hasGradientAnimation then
                local time = utility.get_tickcount() / 1000.0 -- Convert to seconds
                pulseMultiplier = 0.7 + 0.3 * math.sin(time * 3) -- Pulse between 0.7 and 1.0
            end
            
            -- Draw gradient effect from dark to bright version of the color
            local segments = math.max(1, math.floor(bar_height / 5))
            for i = 0, segments - 1 do
                local segmentHeight = bar_height / segments
                local segmentY = bar_y + (i * segmentHeight)
                local gradientFactor = (segments - i) / segments -- Bright at top, dark at bottom
                local segmentR = math.floor(r * gradientFactor * pulseMultiplier)
                local segmentG = math.floor(g * gradientFactor * pulseMultiplier)
                local segmentB = math.floor(b * gradientFactor * pulseMultiplier)
                self:DrawRect(bar_x, segmentY, bar_width, segmentHeight, {segmentR, segmentG, segmentB, a}, true, 0)
            end
        else
            self:DrawRect(bar_x, bar_y, bar_width, bar_height, {r, g, b, a}, true, 0)
        end
    end

    -- Check if health text is enabled
    local hasHealthText = false
    if self.HealthBarAddons then
        for _, addon in ipairs(self.HealthBarAddons) do
            if addon:lower():find("text") then
                hasHealthText = true
                break
            end
        end
    end

    -- Draw health text
    if hasHealthText then
        local healthText = tostring(math.floor(health_value))
        local textX = bar_x - bar_width - (render.measure_text(1, false, healthText) / 3)
        local textY = bar_y + (bar_height / 180)
    
        -- Draw text with outline for visibility
        self:DrawText(textX + 1, textY + 1, healthText, 1, {0, 0, 0, 255}, false, 1.0) -- Shadow
        self:DrawText(textX, textY, healthText, 1, {255, 255, 255, 255}, false, 1.0) -- Main text
    end
end
function Library.ESP:GetPlayerPartPosition(plr, bone)
    local characters = get_entities()
    local plr_char = nil
    for _, char in ipairs(characters) do
        if char:get_name() == plr:get_name() then
            plr_char = char
            break
        end
    end
    if plr_char == nil then
        return vector(0, 0, 0)
    end
    local player_bone = nil
    if plr_char then
        local bone_x, bone_y, bone_z = plr_char:bone_position(0) -- Use head bone as default
        player_bone = {
            x = bone_x,
            y = bone_y,
            z = bone_z
        }
    end
    if player_bone == nil then
        return vector(0, 0, 0)
    end
    local position = vector(player_bone:get_position())
    if not plr_char or not position then
        return vector(0, 0, 0)
    end
    return position
end
function Library.ESP:DrawSkeleton(player, color)
    -- Improved skeleton ESP using cs2_base.lua approach
    if not player.bones or player.bones == 0 then
        return false
    end

    local validConnections = 0

    -- Draw skeleton connections
    for _, connection in ipairs(bone_connections) do
        local start_bone = connection[1]
        local end_bone = connection[2]

        local start_pos = memory.read_vector3(player.bones + start_bone * 32)
        local end_pos = memory.read_vector3(player.bones + end_bone * 32)

        local start_screen = w2s(start_pos)
        local end_screen = w2s(end_pos)

        if start_screen and end_screen then
            self:DrawLine(start_screen.x, start_screen.y, end_screen.x, end_screen.y, color, 1)
            validConnections = validConnections + 1
        end
    end

    return validConnections > 0
end

function Library.ESP:DrawHitboxes(player, color)
    if not player.pawn or player.pawn == 0 then
        return false
    end

    local segments = self.HitboxSegments or 12
    local drawn = false

    -- Try the complex capsule approach first
    pcall(function()
        local hitbox_index = 0
        while hitbox_index < 20 do
            local hitbox = get_hitbox(player.pawn, hitbox_index)
            if not hitbox then
                break
            end
            
            local bone_index = hitbox_to_bone_map[hitbox.name] or hitbox_index
            local bone_data = get_bone_location(player.pawn, bone_index)

            if bone_data and player.bones and player.bones ~= 0 then
                local bone_pos = memory.read_vector3(player.bones + bone_index * 32)
                if bone_pos then
                    draw_capsule(hitbox.endPos, hitbox.start, hitbox.radius, bone_data.rotation, bone_pos, color, segments, 1.0)
                    drawn = true
                end
            end
            hitbox_index = hitbox_index + 1
        end
    end)

    -- If complex approach failed, use simple circle fallback
    if not drawn then
        pcall(function()
            -- Draw simple circles at major bone positions
            local major_bones = {6, 5, 4, 2, 13, 14, 15, 16, 22, 23, 24, 25} -- Head, chest, limbs
            for _, bone_idx in ipairs(major_bones) do
                if player.bones and player.bones ~= 0 then
                    local bone_pos = memory.read_vector3(player.bones + bone_idx * 32)
                    if bone_pos then
                        local screen_pos = w2s(bone_pos)
                        if screen_pos then
                            local r, g, b, a = color[1], color[2], color[3], color[4] or 255
                            render.circle_outline(screen_pos.x, screen_pos.y, 12, r, g, b, a, segments)
                            drawn = true
                        end
                    end
                end
            end
        end)
    end

    return drawn
end

function Library.ESP:GetPlayerData()
    local playerData = {}

    -- Use cached entities
    local players = Library.ESP.EntityCache.entities
    if not players or #players == 0 then
        return playerData
    end

    -- Use cached local player
    local localPlayer = Library.ESP.EntityCache.localPlayer
    if not localPlayer then
        return playerData
    end

    local cameraPosition = vector(localPlayer:get_position())
    local maxDistanceSq = self.MaxDistance * self.MaxDistance

    -- Process all players in one pass
    for _, player in pairs(players) do
        if player == localPlayer then
            player:get_name()
            goto continue
        end
        -- Skip dead players early
        local health = memory.read_int(player.pawn + offsets.m_iHealth)
        if health <= 0 then
            goto continue
        end

        local position = vector(player:get_position())
        local distanceSq = (cameraPosition.x - position.x) ^ 2 + (cameraPosition.y - position.y) ^ 2 +
                               (cameraPosition.z - position.z) ^ 2
        distanceSq = distanceSq / 1000
        -- Early distance check using squared distance
        if distanceSq <= maxDistanceSq then
            local is_enemy = player:is_enemy()

            -- Skip if only showing enemies and this isn't an enemy
            if not (self.OnlyEnemies and not is_enemy) then
                -- Build minimal player data
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
                table.sort(flags, function(a, b)
                    return a.priority > b.priority
                end)

                local playerEntry = {
                    player = player,
                    name = player:get_name(), -- Use cached name
                    position = position,
                    distance = math.sqrt(distanceSq),
                    health = health,
                    maxHealth = 100,
                    is_enemy = is_enemy,
                    flags = flags
                }

                -- Only get expensive data if needed
                if self.ShowWeapon then
                    playerEntry.weapon = player:get_active_weapon()
                end

                if self.ShowTeam or self.ShowTags then
                    local team_num = memory.read_int(player.controller + offsets.m_iTeamNum)
                    playerEntry.team = (team_num == 2 and "T") or (team_num == 3 and "CT") or "Unknown"
                end

                table.insert(playerData, playerEntry)
            end
        end

        ::continue::
    end

    return playerData
end
function Library.ESP:RenderPlayers()
    if not self.Enabled then
        return
    end

    local playerData = self:GetPlayerData()

    for _, data in pairs(playerData) do
        local player = data.player
        if not player then
            goto continue
        end

        local player_visible = player:is_visible()

        if not contains(Library.ESP.Targets, player_visible and "visible" or "hidden") then
            goto continue
        end

        local color = self:GetEntityColor(player)
        local healthPercentage = (data.health / data.maxHealth) * 100

        -- Get bounding box
        local boxX, boxY, boxWidth, boxHeight, scale_factor = 0, 0, 0, 0, 1
        if self.Show2DBox then
            boxX, boxY, boxWidth, boxHeight, scale_factor = self:Draw2DBox(player, self.Colors.Box)
        else
            boxX, boxY, boxWidth, boxHeight, scale_factor = self:GetPlayerBounds(player)
        end

        -- Fixed pixel offsets for text (not scaled)
        local TEXT_SPACING = 14 -- Fixed spacing between text elements
        local currentY = boxY + boxHeight + 5 -- Start position below box

        -- Render texts with fixed spacing
        if self.ShowDistance and boxHeight > 0 then
            local distanceText = string.format("%.0fm", data.distance)
            self:DrawText(boxX + boxWidth / 2, currentY, distanceText, self.Font, self.Colors.Distance, true, 1.0)
            currentY = currentY + TEXT_SPACING
        end

        if self.ShowWeapon and data.weapon and boxHeight > 0 then
            self:DrawText(boxX + boxWidth / 2, currentY, data.weapon, self.Font, self.Colors.Weapon, true, 1.0)
            currentY = currentY + TEXT_SPACING
        end

        -- Name above box with fixed offset
        if self.ShowName and boxHeight > 0 then
            local nameY = boxY - 8 -- Fixed 8 pixels above box
            local displayName = data.name
            if self.ShowTags then
                if self.ShowTeam and data.team then
                    displayName = displayName .. " [" .. data.team .. "]"
                end
            end
            self:DrawText(boxX + boxWidth / 2, nameY, displayName, self.Font, self.Colors.Name, true, 1.0)
        end

        -- Health bar
        if self.ShowHealth and boxHeight > 0 then
            self:DrawHealthBar(boxX, boxY, boxWidth, boxHeight, data.health)
        end

        -- Skeleton
        if self.ShowSkeleton then
            pcall(function()
                self:DrawSkeleton(player, self.Colors.Skeleton)
            end)
        end

        -- Hitboxes
        if self.ShowHitboxes then
            pcall(function()
                self:DrawHitboxes(player, self.Colors.Hitbox)
            end)
        end

        -- Flags with fixed spacing
        if self.ShowFlags and #data.flags > 0 and boxHeight > 0 then
            local flagX = boxX + boxWidth + 5
            local flagY = boxY
            local FLAG_SPACING = 12 -- Fixed spacing between flags

            for i, flag in ipairs(data.flags) do
                if i <= 5 then
                    self:DrawText(flagX, flagY, flag.name, 1, flag.color, false, 1.0)
                    flagY = flagY + FLAG_SPACING
                end
            end
        end

        ::continue::
    end
end
function Library.ESP:Update()
end

local function fileExists(path)
    local success, _ = pcall(file.read, path)
    return success
end
local function BringToFront(element)
    ZIndexCounter = ZIndexCounter + 1
    element.zIndex = ZIndexCounter
    ActiveElements[element] = true
    local elements = {}
    for elem in pairs(ActiveElements) do
        table.insert(elements, elem)
    end
    table.sort(elements, function(a, b)
        return (a.zIndex or 0) < (b.zIndex or 0)
    end)
    Library.SortedElements = elements
end
local function RegisterPopup(element)
    for popup, _ in pairs(Library.ActivePopups) do
        if popup ~= element then
            if popup.__index == Graph and popup.interpDropdown == element then
                goto continue
            end
            if popup.open ~= nil then
                popup.open = false
            end
            if popup.menuOpen ~= nil then
                popup.menuOpen = false
            end
            if popup.popupOpen ~= nil then
                popup.popupOpen = false
            end
        end
        ::continue::
    end
    if not (element.parent and element.parent.__index == Graph) then
        Library.OpenDropdown = nil
        Library.OpenColorPicker = nil
        Library.OpenKeybindMenu = nil
    end
    Library.ActivePopups[element] = true
    Library.PopupBlocking = true
    if element.__index == Graph then
        ZIndexCounter = ZIndexCounter + 5000
        element.zIndex = ZIndexCounter
        element.baseZIndex = ZIndexCounter
    else
        ZIndexCounter = ZIndexCounter + 1000
        element.zIndex = ZIndexCounter
    end
    ActiveElements[element] = true
    local elements = {}
    for elem in pairs(ActiveElements) do
        table.insert(elements, elem)
    end
    table.sort(elements, function(a, b)
        return (a.zIndex or 0) < (b.zIndex or 0)
    end)
    Library.SortedElements = elements
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
local function CloseAllPopups()
    for popupElement, _ in pairs(Library.ActivePopups) do
        if popupElement.open ~= nil then
            popupElement.open = false
        end
        if popupElement.menuOpen ~= nil then
            popupElement.menuOpen = false
        end
    end
    Library.OpenDropdown = nil
    Library.OpenColorPicker = nil
    Library.OpenKeybindMenu = nil
    Library.ActivePopups = {}
    Library.PopupBlocking = false
end
function IsElementBehindPopup(element)
    if not Library.PopupBlocking then
        return false
    end
    if Library.ActivePopups[element] then
        return false
    end
    if element.popupOpen or element.menuOpen or element.open then
        return false
    end

    -- Check if element is in a different tab than active popups
    for popupElement, _ in pairs(Library.ActivePopups) do
        -- Allow interaction with children of popup elements
        if popupElement.__index == Graph and popupElement.popupOpen then
            if element == popupElement.interpDropdown then
                return false
            end
            if element.parent == popupElement then
                return false
            end
        end
        if popupElement == element.parent then
            return false
        end

        -- Check if element is in different tab/window than popup
        local elementWindow = element
        while elementWindow and elementWindow.__index ~= Window do
            elementWindow = elementWindow.parent
        end

        local popupWindow = popupElement
        while popupWindow and popupWindow.__index ~= Window do
            popupWindow = popupWindow.parent
        end

        -- If elements are in different windows, allow interaction
        if elementWindow and popupWindow and elementWindow ~= popupWindow then
            return false
        end

        -- Check if element is in different tab than popup
        local elementTab = element
        while elementTab and elementTab.__index ~= Tab do
            elementTab = elementTab.parent
        end

        local popupTab = popupElement
        while popupTab and popupTab.__index ~= Tab do
            popupTab = popupTab.parent
        end

        -- If popup is in different tab than element, block element interaction
        if elementTab and popupTab and elementTab ~= popupTab then
            return true
        end
    end

    local current = element.parent
    while current do
        if Library.ActivePopups[current] or current.popupOpen or current.menuOpen or current.open then
            return false
        end
        current = current.parent
    end
    return true
end
local function ColorUnpack(color)
    return color[1], color[2], color[3], color[4]
end
local function IsMouseInBounds(x, y, width, height)
    local mouseX, mouseY = get_cursor_position()
    return mouseX >= x and mouseX <= x + width and mouseY >= y and mouseY <= y + height
end
local KeyCodeNames = {
    [0x01] = "LMB",
    [0x02] = "RMB",
    [0x04] = "MMB",
    [0x08] = "BACKSPACE",
    [0x09] = "TAB",
    [0x0D] = "ENTER",
    [0x10] = "SHIFT",
    [0x11] = "CTRL",
    [0x12] = "ALT",
    [0x20] = "SPACE",
    [0x25] = "LEFT",
    [0x26] = "UP",
    [0x27] = "RIGHT",
    [0x28] = "DOWN",
    [0x2E] = "DELETE",
    [0x30] = "0",
    [0x31] = "1",
    [0x32] = "2",
    [0x33] = "3",
    [0x34] = "4",
    [0x35] = "5",
    [0x36] = "6",
    [0x37] = "7",
    [0x38] = "8",
    [0x39] = "9",
    [0x41] = "A",
    [0x42] = "B",
    [0x43] = "C",
    [0x44] = "D",
    [0x45] = "E",
    [0x46] = "F",
    [0x47] = "G",
    [0x48] = "H",
    [0x49] = "I",
    [0x4A] = "J",
    [0x4B] = "K",
    [0x4C] = "L",
    [0x4D] = "M",
    [0x4E] = "N",
    [0x4F] = "O",
    [0x50] = "P",
    [0x51] = "Q",
    [0x52] = "R",
    [0x53] = "S",
    [0x54] = "T",
    [0x55] = "U",
    [0x56] = "V",
    [0x57] = "W",
    [0x58] = "X",
    [0x59] = "Y",
    [0x5A] = "Z",
    [0x70] = "F1",
    [0x71] = "F2",
    [0x72] = "F3",
    [0x73] = "F4",
    [0x74] = "F5",
    [0x75] = "F6",
    [0x76] = "F7",
    [0x77] = "F8",
    [0x78] = "F9",
    [0x79] = "F10",
    [0x7A] = "F11",
    [0x7B] = "F12"
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
        if not anim.cleanupTime then
            anim.cleanupTime = utility.get_tickcount() + 5000
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
    rightMouseClicked = false,
    clickConsumed = false,
    scrollbarActive = false,
    windowFocused = true,
    lastCursorX = 0,
    lastCursorY = 0,
    lastActivityTime = 0
}
local function ConsumeClick()
    if not InputState.scrollbarActive then
        InputState.clickConsumed = true
    end
end

local function UpdateWindowFocus()
    local currentTime = utility.get_tickcount() / 1000
    local cursorX, cursorY = get_cursor_position()

    -- Check for cursor movement activity
    if cursorX ~= InputState.lastCursorX or cursorY ~= InputState.lastCursorY then
        InputState.lastActivityTime = currentTime
        InputState.lastCursorX = cursorX
        InputState.lastCursorY = cursorY
    end

    -- Check for any key activity (including mouse clicks)
    if utility.key_state(1) or utility.key_state(2) or utility.key_state(0x10) or utility.key_state(0x11) then
        InputState.lastActivityTime = currentTime
    end

    -- If no activity for 0.5 seconds, assume window might not be focused
    -- Also check if cursor is at screen edges (common when switching windows)
    local screenWidth, screenHeight = get_window_size()
    local atEdge = cursorX <= 1 or cursorY <= 1 or cursorX >= screenWidth - 1 or cursorY >= screenHeight - 1

    -- Conservative focus detection: only consider unfocused if inactive AND at edge
    -- BUT keep focused if UI elements are open (keybind menus, dropdowns, etc.)
    local hasActiveUI = Library.OpenKeybindMenu or Library.OpenDropdown or Library.OpenColorPicker or IsPopupActive()
    if (currentTime - InputState.lastActivityTime) > 0.5 and atEdge and not hasActiveUI then
        InputState.windowFocused = false
    else
        InputState.windowFocused = true
    end
end
local function UpdateInputState()
    UpdateWindowFocus()

    if not InputState.windowFocused then
        InputState.lastMousePressed = InputState.mousePressed
        InputState.mousePressed = false
        InputState.mouseClicked = false
        InputState.lastRightMousePressed = InputState.rightMousePressed
        InputState.rightMousePressed = false
        InputState.rightMouseClicked = false
        return
    end

    InputState.lastMousePressed = InputState.mousePressed
    InputState.mousePressed = utility.key_state(1)
    InputState.mouseClicked = InputState.mousePressed and not InputState.lastMousePressed
    if IsPopupActive() and InputState.mouseClicked then
        local mouseX, mouseY = get_cursor_position()
        local clickedInsideAnyPopup = false
        for popupElement, _ in pairs(Library.ActivePopups) do
            if popupElement.__index == Graph and popupElement.popupOpen then
                if popupElement.popupBounds and popupElement.popupBounds.popup then
                    local bounds = popupElement.popupBounds.popup
                    local clickInsideGraph = IsMouseInBounds(bounds.x, bounds.y, bounds.width, bounds.height)
                    if popupElement.interpDropdown then
                        local dropdownX = popupElement.interpDropdown.popupX or 0
                        local dropdownY = popupElement.interpDropdown.popupY or 0
                        local dropdownWidth = popupElement.interpDropdown.width or 100
                        local dropdownHeight = popupElement.interpDropdown.height or 25
                        if IsMouseInBounds(dropdownX, dropdownY, dropdownWidth, dropdownHeight) then
                            clickInsideGraph = true
                        end
                        if popupElement.interpDropdown.open then
                            local visibleOptions = math.min(#popupElement.interpDropdown.options,
                                popupElement.interpDropdown.maxVisible or 5)
                            local popupHeight = visibleOptions * (popupElement.interpDropdown.optionHeight or 22)
                            local popupY = dropdownY + dropdownHeight
                            local screenWidth, screenHeight = get_window_size()
                            if popupY + popupHeight > screenHeight - 20 then
                                popupY = dropdownY - popupHeight
                            end
                            if IsMouseInBounds(dropdownX, popupY, dropdownWidth, popupHeight) then
                                clickInsideGraph = true
                            end
                        end
                    end
                    if clickInsideGraph then
                        clickedInsideAnyPopup = true
                        break
                    end
                end
            elseif popupElement then
                local clickInsidePopup = false
                if popupElement.__index == Dropdown and popupElement.open then
                    local dropdownX, dropdownY = popupElement:GetAbsolutePos()
                    if IsMouseInBounds(dropdownX, dropdownY, popupElement.width, popupElement.height) then
                        clickInsidePopup = true
                    else
                        local visibleOptions = math.min(#popupElement.options, popupElement.maxVisible or 8) + 1
                        local popupHeight = visibleOptions * popupElement.optionHeight
                        local popupY = dropdownY + popupElement.height
                        local screenWidth, screenHeight = get_window_size()
                        if popupY + popupHeight > screenHeight - 20 then
                            popupY = dropdownY - popupHeight
                        end
                        if IsMouseInBounds(dropdownX, popupY, popupElement.width, popupHeight) then
                            clickInsidePopup = true
                        end
                    end
                elseif popupElement.__index == ColorPicker and popupElement.open then
                    local colorX, colorY = popupElement:GetAbsolutePos()
                    if IsMouseInBounds(colorX, colorY, popupElement.width, popupElement.height) then
                        clickInsidePopup = true
                    else
                        local pickerWidth = popupElement.pickerWidth or 200
                        local pickerHeight = popupElement.pickerHeight or 180
                        local pickerX = colorX + 25
                        local pickerY = colorY + popupElement.height + 5
                        if IsMouseInBounds(pickerX, pickerY, pickerWidth, pickerHeight) then
                            clickInsidePopup = true
                        end
                    end
                elseif popupElement.__index == MultiSelectDropdown and popupElement.open then
                    local dropdownX, dropdownY = popupElement:GetAbsolutePos()
                    if IsMouseInBounds(dropdownX, dropdownY, popupElement.width, popupElement.height) then
                        clickInsidePopup = true
                    else
                        local visibleOptions = math.min(#popupElement.options, popupElement.maxVisible or 8) + 1
                        local popupHeight = visibleOptions * popupElement.optionHeight
                        local popupY = dropdownY + popupElement.height
                        local screenWidth, screenHeight = get_window_size()
                        if popupY + popupHeight > screenHeight - 20 then
                            popupY = dropdownY - popupHeight
                        end
                        if IsMouseInBounds(dropdownX, popupY, popupElement.width, popupHeight) then
                            clickInsidePopup = true
                        end
                    end
                elseif popupElement.__index == AttachedColorPicker and popupElement.open then
                    local attachedX, attachedY = popupElement:GetAbsolutePos()
                    if IsMouseInBounds(attachedX, attachedY, popupElement.width, popupElement.height) then
                        clickInsidePopup = true
                    else
                        local pickerWidth = popupElement.pickerWidth or 200
                        local pickerHeight = popupElement.pickerHeight or 180
                        local screenWidth, screenHeight = get_window_size()
                        local pickerX = attachedX - pickerWidth + popupElement.width
                        local pickerY = attachedY + popupElement.height + 5
                        if pickerX < 10 then
                            pickerX = attachedX + popupElement.width + 5
                        end
                        if pickerY + pickerHeight > screenHeight - 20 then
                            pickerY = attachedY - pickerHeight - 5
                        end
                        if IsMouseInBounds(pickerX, pickerY, pickerWidth, pickerHeight) then
                            clickInsidePopup = true
                        end
                    end
                elseif popupElement.__index == Keybind and popupElement.menuOpen then
                    local keybindX, keybindY = popupElement:GetAbsolutePos()
                    local menuWidth = 80
                    local menuHeight = 60
                    local menuX = keybindX
                    local menuY = keybindY + popupElement.height + 2
                    if IsMouseInBounds(menuX, menuY, menuWidth, menuHeight) then
                        clickInsidePopup = true
                    end
                elseif popupElement.IsMouseOver and popupElement:IsMouseOver() then
                    clickInsidePopup = true
                end
                if clickInsidePopup then
                    clickedInsideAnyPopup = true
                    break
                end
            end
        end
        if not clickedInsideAnyPopup then
            CloseAllPopups()
            InputState.clickConsumed = true
        end
    end
    if not InputState.mousePressed then
        InputState.clickConsumed = false
        local anyScrollbarActive = false
        for _, window in ipairs(Library.Windows) do
            if window.scrollbarDragging then
                if type(window.scrollbarDragging) == "table" then
                    if window.scrollbarDragging.vertical or window.scrollbarDragging.horizontal then
                        anyScrollbarActive = true
                        break
                    end
                else
                    anyScrollbarActive = true
                    break
                end
            end
        end
        if not anyScrollbarActive then
            for element, _ in pairs(ActiveElements) do
                if element and element.scrollbarDragging then
                    anyScrollbarActive = true
                    break
                end
            end
        end
        if not anyScrollbarActive then
            if Library.OpenDropdown and Library.OpenDropdown.scrollbarDragging then
                anyScrollbarActive = true
            end
        end
        if not anyScrollbarActive then
            InputState.scrollbarActive = false
        end
    end
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
    local w, h = render.measure_text(fontSize, true, text)
    local label = Element.new(self, 0, 0, 100, h / 2)
    label.text = text or "Label"
    label.fontSize = fontSize or 2
    label.color = color or nil
    label.centered = centered or false
    label.enabled = false
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
    if not self.visible then
        return
    end
    local x, y = self:GetAbsolutePos()
    local theme = self:GetTheme()
    local fadeAlpha = self.fadeAlpha or 1.0
    local textColor = self.color or theme.Text
    local textX = x
    if self.centered then
        local textWidth, textHeight = render.measure_text(self.fontSize, true, self.text)
        textX = x + (self.width - textWidth) / 2
        self.height = math.max(self.height, textHeight)
    end
    Drawing:Text(textX, y, self.text, self.fontSize, true, ApplyFadeAlpha(textColor, fadeAlpha))
end
function Label:HandleInput()
end
function Divider:new(text)
    local divider = Element.new(self, 0, 0, 100, 20)
    divider.text = text or ""
    divider.enabled = false
    return divider
end
function Divider:GetTheme()
    local current = self
    while current and current.parent do
        current = current.parent
        if current and current.theme then
            return current.theme
        end
    end
    return Library.Theme.List[Library.Theme.Selected]
end
function Divider:Render()
    if not self.visible then
        return
    end
    local x, y = self:GetAbsolutePos()
    local theme = self:GetTheme()
    local textWidth, textHeight = render.measure_text(2, true, self.text)
    local lineY = y + self.height / 2
    local padding = 10
    local leftLineStart = x
    local leftLineEnd = x + (self.width - textWidth) / 2 - padding
    local rightLineStart = x + (self.width + textWidth) / 2 + padding
    local rightLineEnd = x + self.width
    local gradientSteps = 20
    for i = 0, gradientSteps do
        local progress = i / gradientSteps
        local currentX = leftLineStart + (leftLineEnd - leftLineStart) * progress
        local alpha = math.floor(255 * (1 - progress))
        if alpha > 10 then
            render.line(currentX, lineY, currentX + 1, lineY, theme.Outer[1], theme.Outer[2], theme.Outer[3], alpha, 1)
        end
    end
    for i = 0, gradientSteps do
        local progress = i / gradientSteps
        local currentX = rightLineStart + (rightLineEnd - rightLineStart) * progress
        local alpha = math.floor(255 * progress)
        if alpha > 10 then
            render.line(currentX, lineY, currentX + 1, lineY, theme.Outer[1], theme.Outer[2], theme.Outer[3], alpha, 1)
        end
    end
    local textX = x + (self.width - textWidth) / 2
    local textY = y + (self.height - textHeight) / 2
    Drawing:Text(textX, textY, self.text, 2, true, theme.Secondary)
end
function Divider:HandleInput()
end

function Separator:new(text)
    local separator = Element.new(self, 0, 0, 100, 15)
    separator.text = text or ""
    separator.enabled = false
    return separator
end

function Separator:GetTheme()
    local current = self
    while current and current.parent do
        current = current.parent
        if current and current.theme then
            return current.theme
        end
    end
    return Library.Theme.List[Library.Theme.Selected]
end

function Separator:Render()
    if not self.visible then
        return
    end
    local x, y = self:GetAbsolutePos()
    local theme = self:GetTheme()
    local textWidth, textHeight = render.measure_text(2, true, self.text)
    local lineY = y + self.height / 2
    local padding = 15
    local dashLength = 3
    local dashSpacing = 2

    -- Left side dashes with fading
    local leftLineStart = x
    local leftLineEnd = x + (self.width - textWidth) / 2 - padding
    local leftLength = leftLineEnd - leftLineStart
    local numDashes = math.floor(leftLength / (dashLength + dashSpacing))

    for i = 0, numDashes - 1 do
        local dashX = leftLineStart + i * (dashLength + dashSpacing)
        local progress = i / (numDashes - 1)
        local alpha = math.floor(255 * (1 - progress))
        if alpha > 15 then
            render.line(dashX, lineY, dashX + dashLength, lineY, theme.Accent[1], theme.Accent[2], theme.Accent[3],
                alpha, 2)
        end
    end

    -- Right side dashes with fading
    local rightLineStart = x + (self.width + textWidth) / 2 + padding
    local rightLineEnd = x + self.width
    local rightLength = rightLineEnd - rightLineStart
    local rightNumDashes = math.floor(rightLength / (dashLength + dashSpacing))

    for i = 0, rightNumDashes - 1 do
        local dashX = rightLineStart + i * (dashLength + dashSpacing)
        local progress = i / (rightNumDashes - 1)
        local alpha = math.floor(255 * progress)
        if alpha > 15 then
            render.line(dashX, lineY, dashX + dashLength, lineY, theme.Accent[1], theme.Accent[2], theme.Accent[3],
                alpha, 2)
        end
    end

    -- Render text
    local textX = x + (self.width - textWidth) / 2
    local textY = y + (self.height - textHeight) / 2
    Drawing:Text(textX, textY, self.text, 2, true, theme.Header)
end

function Separator:HandleInput()
end
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
        customData = {},
        hitsounds = {
            enabled = HitSoundConfig.enabled,
            selectedSound = HitSoundConfig.selectedSound,
            availableSounds = HitSoundConfig.availableSounds
        },
        -- hitmarkers now handled via flag system
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
            elseif element.nodes then
                configData.flags[flag] = element.nodes
            end
            if element.keybind then
                configData.keybinds[flag] = {
                    key = element.keybind.keyCode,
                    mode = element.keybind.mode
                }
            end
        end
    end
    for key, dataRef in pairs(self.CustomData) do
        if dataRef and type(dataRef) == "table" then
            local success, clonedData = pcall(table.clone, dataRef)
            if success then
                configData.customData[key] = clonedData
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
                    element:Set(value)  -- Properly set and trigger callbacks for MultiSelectDropdown
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
                elseif element.nodes then
                    element.nodes = value
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
                local oldKeyCode = element.keybind.keyCode
                element.keybind.keyCode = keybindData.key
                element.keybind.mode = keybindData.mode
                Library.KeyStates[keybindData.key] = utility.key_state(keybindData.key)
            end
        end
        Library:CleanupUnusedKeys()
    end

    Library:CleanupUnusedKeys()
    if configData.customData and type(configData.customData) == "table" then
        for key, data in pairs(configData.customData) do
            if self.CustomData[key] and type(data) == "table" and type(self.CustomData[key]) == "table" then
                for k in pairs(self.CustomData[key]) do
                    self.CustomData[key][k] = nil
                end
                for k, v in pairs(data) do
                    self.CustomData[key][k] = v
                end
            end
        end
    end
    if configData.hitsounds and type(configData.hitsounds) == "table" then
        HitSoundConfig.enabled = configData.hitsounds.enabled or false
        HitSoundConfig.selectedSound = configData.hitsounds.selectedSound or "silenthill"
        if configData.hitsounds.availableSounds then
            HitSoundConfig.availableSounds = configData.hitsounds.availableSounds
        end
        if elements.hitsoundEnabled then
            elements.hitsoundEnabled:Set(HitSoundConfig.enabled)
        end
        if elements.hitsoundSelector then
            elements.hitsoundSelector:Set(HitSoundConfig.selectedSound)
        end
    end
    -- hitmarkers now handled via flag system

    Library.ConfigSystem.CurrentConfig = name
    pcall(function()
        updateAllElements()
        if elements.weaponSelector then
            elements.weaponSelector:Set(AimbotConfig.selectedWeapon)
        end
        if elements.enableESP then
            elements.enableESP:Set(Library.ESP.Enabled)
        end
    end)
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
Library.ConfigSystem.CustomData = {}
Library.ConfigSystem:Initialize()
function Library.ConfigSystem:RegisterCustomData(key, dataRef)
    if type(dataRef) == "table" then
        self.CustomData[key] = dataRef
    end
end
function Library.ConfigSystem:UnregisterCustomData(key)
    self.CustomData[key] = nil
end
function Library.ConfigSystem:GetCustomData()
    return self.CustomData
end

function Library:CleanupUnusedKeys()
    local usedKeys = {}
    local activeKeybinds = {}

    -- Find currently active keybinds
    for flag, element in pairs(self.Flags) do
        if element and element.keybind then
            table.insert(activeKeybinds, element.keybind)
            if element.keybind.keyCode and element.keybind.keyCode ~= 0 then
                usedKeys[element.keybind.keyCode] = true
            end
        end
    end

    -- Remove unused keys from KeyStates
    for keyCode, _ in pairs(self.KeyStates) do
        if not usedKeys[keyCode] then
            self.KeyStates[keyCode] = nil
        end
    end

    -- Clean up AllKeybinds - remove keybinds that are no longer referenced
    local newAllKeybinds = {}
    for _, keybind in ipairs(self.AllKeybinds or {}) do
        local isActive = false
        for _, activeKeybind in ipairs(activeKeybinds) do
            if keybind == activeKeybind then
                isActive = true
                break
            end
        end

        if isActive then
            table.insert(newAllKeybinds, keybind)
        else
            -- Remove from keybind list display if it was active
            if keybind.currentState and self.KeybindsList then
                self.KeybindsList:RemoveKeybind(keybind.text)
            end
        end
    end

    self.AllKeybinds = newAllKeybinds
end

function TargetHUD:new()
    local hud = Element.new(self, 200, 300, 340, 120)
    hud.visible = false
    hud.currentTarget = nil
    hud.title = "[ Target ]"
    hud.dragging = false
    hud.dragOffset = {0, 0}
    hud.avatarCache = {}
    hud.lastTargetUpdate = 0
    hud.targetUpdateInterval = 100
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
            maxHealth = 100, -- CS2 max health is always 100
            userId = nil,
            entity = target.entity
        }
        if self.currentTarget.userId and not self.avatarCache[self.currentTarget.userId] then
            self:LoadAvatar(self.currentTarget.userId)
        end
    else
        self.currentTarget = nil
    end
end
function TargetHUD:LoadAvatar(userId)
    if not userId then
        return
    end
    local thumbnailUrl = string.format(
        "https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds=%s&size=352x352&format=Png&isCircular=false",
        tostring(userId))
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
    if self.currentTarget and self.currentTarget.entity and currentTime - self.lastTargetUpdate >=
        self.targetUpdateInterval then
        if self.currentTarget.entity:is_alive() then
            self.currentTarget.health = self.currentTarget.entity:get_health() or 0
        else
            self.currentTarget = nil
        end
        self.lastTargetUpdate = currentTime
    end
end
function TargetHUD:Render()
    if not self.visible then
        return
    end
    local x, y = self:GetAbsolutePos()
    local theme = self:GetTheme()
    Drawing:Rect(x, y, self.width, self.height, theme.Dark, true, 4)
    Drawing:Rect(x, y, self.width, self.height, theme.Accent, false, 4)
    Drawing:Rect(x + 1, y + 1, self.width - 2, 20, theme.Light, true, 0)
    Drawing:Gradient(x + 1, y + 1, self.width - 2, 20, theme.Light, theme.Mid, true)
    local titleWidth, titleHeight = render.measure_text(2, true, self.title)
    local titleX = x + (self.width - titleWidth) / 2
    Drawing:Text(titleX, y + 3, self.title, 2, true, theme.Header)
    local contentY = y + 22
    local contentHeight = self.height - 22
    if self.currentTarget then
        local avatarSize = contentHeight - 4
        local avatarX = x + 2
        local avatarY = contentY + 2
        Drawing:Rect(avatarX, avatarY, avatarSize, avatarSize, theme.High, true, 2)
        Drawing:Rect(avatarX, avatarY, avatarSize, avatarSize, theme.Outer, false, 2)
        if self.currentTarget.userId and self.avatarCache[self.currentTarget.userId] then
            render.image(self.avatarCache[self.currentTarget.userId], avatarX + 2, avatarY + 2, avatarSize - 4,
                avatarSize - 4, 255, 255, 255, 255)
        else
            Drawing:Text(avatarX + avatarSize / 2, avatarY + avatarSize / 2, "?", 2, true, theme.Text)
        end
        local infoX = avatarX + avatarSize + 5
        local infoWidth = self.width - avatarSize - 10
        local nameY = contentY + 5
        Drawing:Text(infoX, nameY, self.currentTarget.name, 2, true, theme.Text)
        local healthBarY = nameY + 20
        local healthBarWidth = infoWidth - 5
        local healthBarHeight = 8
        Drawing:Rect(infoX, healthBarY, healthBarWidth, healthBarHeight, {0, 0, 0, 200}, true, 2)
        Drawing:Rect(infoX, healthBarY, healthBarWidth, healthBarHeight, theme.Outer, false, 2)
        local healthPercentage = (self.currentTarget.health / self.currentTarget.maxHealth) * 100
        local healthFillWidth = (healthBarWidth - 2) * (healthPercentage / 100)
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
        local healthText = string.format("%d / %d", math.floor(self.currentTarget.health), self.currentTarget.maxHealth)
        local healthTextWidth, healthTextHeight = render.measure_text(1, true, healthText)
        local healthTextX = infoX + (healthBarWidth - healthTextWidth) / 2
        local healthTextY = healthBarY + healthBarHeight + 2
        Drawing:Text(healthTextX, healthTextY, healthText, 1, true, theme.Text)
    else
        local noTargetText = "No Target"
        local textWidth, textHeight = render.measure_text(2, true, noTargetText)
        local textX = x + (self.width - textWidth) / 2
        local textY = contentY + (contentHeight - textHeight) / 2
        Drawing:Text(textX, textY, noTargetText, 2, true, theme.Secondary)
    end
end
function TargetHUD:HandleInput()
    if not self.visible or not self.enabled then
        return
    end
    if not self:IsInActiveTab() then
        return
    end
    Element.HandleInput(self)
    local mouseX, mouseY = get_cursor_position()
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
        local screenWidth, screenHeight = get_window_size()
        self.x = math.max(0, math.min(screenWidth - self.width, self.x))
        self.y = math.max(0, math.min(screenHeight - self.height, self.y))
    end
end
function TargetHUD:UpdatePosition()
    local screenX, screenY = get_window_size()
    if self.x == 0 and self.y == 0 then
        self.x = screenX - self.width - 20
        self.y = (screenY * 0.3) - (self.height / 2)
    end
end
function Input:new(text, callback, defaultValue, flag)
    local input = Element.new(self, 0, 0, 100, 25)
    input.text = text or "Input"
    input.callback = callback or function()
    end
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
    if not self.visible then
        return
    end
    local x, y = self:GetAbsolutePos()
    local theme = self:GetTheme()
    local fadeAlpha = self.fadeAlpha or 1.0
    local bgColor = self.focused and theme.Light or theme.Mid
    Drawing:Rect(x, y, self.width, self.height, ApplyFadeAlpha(bgColor, fadeAlpha), true, 2)
    Drawing:Rect(x, y, self.width, self.height, ApplyFadeAlpha(self.focused and theme.Accent or theme.Outer, fadeAlpha),
        false, 2)
    local displayText = self.value
    if displayText == "" and not self.focused then
        displayText = self.placeholder
    end
    if self.focused then
        local textBeforeCursor = string.sub(self.value, 1, self.cursorPos)
        local textWidth = render.measure_text(2, true, textBeforeCursor)
        local cursorX = x + 5 + textWidth
        if math.floor(utility.get_tickcount() / 500) % 2 == 0 then
            Drawing:Line(cursorX, y + 3, cursorX, y + self.height - 3, ApplyFadeAlpha(theme.Text, fadeAlpha), 1)
        end
    end
    Drawing:Text(x + 5, y + 5, displayText, 2, true, ApplyFadeAlpha(
        (displayText == self.placeholder and not self.focused) and theme.Secondary or theme.Text, fadeAlpha))
end
function Input:HandleInput()
    if not self.visible or not self.enabled then
        return
    end
    if IsElementBehindPopup(self) then
        return
    end
    if not self:IsInActiveTab() then
        return
    end
    if not self:CanInteract() then
        return
    end
    Element.HandleInput(self)
    if self.clicked then
        self.focused = true
        BringToFront(self)
        self:RegisterInteraction()
    end
    if self.focused then
        for keyCode = 8, 255 do
            local currentState = utility.key_state(keyCode)
            local lastState = self.lastKeyStates[keyCode] or false
            if currentState and not lastState then
                if keyCode == 0x08 then
                    if self.cursorPos > 0 then
                        self.value = string.sub(self.value, 1, self.cursorPos - 1) ..
                                         string.sub(self.value, self.cursorPos + 1)
                        self.cursorPos = self.cursorPos - 1
                        if self.callback then
                            self.callback(self.value)
                        end
                    end
                elseif keyCode == 0x2E then
                    if self.cursorPos < #self.value then
                        self.value = string.sub(self.value, 1, self.cursorPos) ..
                                         string.sub(self.value, self.cursorPos + 2)
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
                        self.value = string.sub(self.value, 1, self.cursorPos) .. char ..
                                         string.sub(self.value, self.cursorPos + 1)
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
        [0xDE] = shift and "\"" or "'"
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
    list.callback = callback or function()
    end
    list.selected = defaultSelected or (options and options[1]) or nil
    list.maxVisible = maxVisible
    list.scrollOffset = 0
    list.hoveredIndex = nil
    list.scrollbarDragging = false
    list.scrollbarDragOffset = 0
    list.pulseTime = 0
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
    if not self.visible then
        return
    end
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
        self.pulseTime = (self.pulseTime or 0) + 0.02
        local pulseFactor = (math.sin(self.pulseTime) + 1) / 2
        for i = 1, self.maxVisible do
            local optionIndex = i + self.scrollOffset
            local option = self.options[optionIndex]
            if option then
                local itemY = listY + (i - 1) * self.rowHeight
                local isSelected = option == self.selected
                local isHovered = optionIndex == self.hoveredIndex
                local textColor = isHovered and theme.Accent or theme.Text
                Drawing:Rect(x + 2, itemY, self.width - 4, self.rowHeight, theme.Dark, true, 0)
                if isSelected then
                    local r = theme.Text[1] + (theme.Accent[1] - theme.Text[1]) * pulseFactor
                    local g = theme.Text[2] + (theme.Accent[2] - theme.Text[2]) * pulseFactor
                    local b = theme.Text[3] + (theme.Accent[3] - theme.Text[3]) * pulseFactor
                    textColor = {r, g, b, 255}
                end
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
        self.scrollbarBounds = {
            x = scrollbarX,
            y = listY,
            width = 6,
            height = scrollbarHeight,
            thumbY = thumbY,
            thumbHeight = thumbHeight
        }
    else
        self.scrollbarBounds = nil
    end
end
function List:NeedsScrollbar()
    return #self.options > self.maxVisible
end
function List:HandleInput()
    if not self.visible or not self.enabled then
        return
    end
    if IsElementBehindPopup(self) then
        return
    end
    if not self:IsInActiveTab() then
        return
    end
    if not self:CanInteract() then
        return
    end
    if InputState.clickConsumed then
        return
    end
    Element.HandleInput(self)
    local x, y = self:GetAbsolutePos()
    local listY = y + self.headerHeight
    local listHeight = self.maxVisible * self.rowHeight
    local mouseX, mouseY = get_cursor_position()
    if self:NeedsScrollbar() and self.scrollbarBounds then
        if InputState.mouseClicked then
            if IsMouseInBounds(self.scrollbarBounds.x, self.scrollbarBounds.thumbY, self.scrollbarBounds.width,
                self.scrollbarBounds.thumbHeight) then
                self.scrollbarDragging = true
                self.scrollbarDragOffset = mouseY - self.scrollbarBounds.thumbY
                InputState.scrollbarActive = true
                ConsumeClick()
                return
            end
        end
        if self.scrollbarDragging then
            if InputState.mousePressed then
                local newThumbY = mouseY - self.scrollbarDragOffset
                local minThumbY = self.scrollbarBounds.y
                local maxThumbY = self.scrollbarBounds.y + self.scrollbarBounds.height -
                                      self.scrollbarBounds.thumbHeight
                newThumbY = math.max(minThumbY, math.min(maxThumbY, newThumbY))
                local thumbProgress = (newThumbY - minThumbY) / (maxThumbY - minThumbY)
                self.scrollOffset = math.floor(thumbProgress * (#self.options - self.maxVisible))
                self.scrollOffset = math.max(0, math.min(#self.options - self.maxVisible, self.scrollOffset))
            else
                self.scrollbarDragging = false
                InputState.scrollbarActive = false
            end
            return
        end
    end
    if IsMouseInBounds(x, listY, self.width, listHeight) then
        if utility.key_state(0x26) then
            self.scrollOffset = math.max(0, self.scrollOffset - 1)
        elseif utility.key_state(0x28) then
            self.scrollOffset = math.min(math.max(0, #self.options - self.maxVisible), self.scrollOffset + 1)
        end
        local relativeY = mouseY - listY
        self.hoveredIndex = math.floor(relativeY / self.rowHeight) + 1 + self.scrollOffset
        if InputState.mouseClicked then
            local itemIndex = math.floor(relativeY / self.rowHeight) + 1 + self.scrollOffset
            if itemIndex <= #self.options then
                local option = self.options[itemIndex]
                if option ~= "No configs found" then
                    self.selected = option
                    if self.callback then
                        self.callback(option)
                    end
                    self:RegisterInteraction()
                end
            end
        end
    else
        self.hoveredIndex = nil
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
        lastInteractionTime = 0,
        interactionCooldown = 100
    }
    setmetatable(element, self)
    return element
end
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
            break
        end
        visitedElements[current] = true
        totalX = totalX + current.x
        totalY = totalY + current.y
        current = current.parent
    end
    local scrollParent = self.parent
    while scrollParent do
        if scrollParent.__index == Section or scrollParent.__index == MultiSection then
            if scrollParent.enableScrollbars then
                if scrollParent.scrollY then
                    totalY = totalY - scrollParent.scrollY
                end
            end
            break
        end
        scrollParent = scrollParent.parent
    end
    return totalX, totalY
end
function Element:GetParentBounds()
    local current = self.parent
    while current do
        if current.__index == Window then
            local windowX, windowY = current:GetAbsolutePos()
            local contentY = windowY + current.headerHeight + current.tabHeight + 3
            local contentHeight = current.height - current.headerHeight - current.tabHeight - 6
            local contentWidth = current.width - 4
            if current.showVerticalScrollbar then
                contentWidth = contentWidth - current.scrollbarWidth
            end
            if current.showHorizontalScrollbar then
                contentHeight = contentHeight - current.scrollbarWidth
            end
            return {
                x = windowX + 2,
                y = contentY,
                width = contentWidth,
                height = contentHeight
            }
        elseif current.__index == Section or current.__index == MultiSection then
            local sectionX, sectionY = current:GetAbsolutePos()
            return {
                x = sectionX,
                y = sectionY + 22,
                width = current.width,
                height = current.height - 22
            }
        end
        current = current.parent
    end
    return nil
end
function Element:IsMouseOver()
    local ax, ay = self:GetAbsolutePos()
    return IsMouseInBounds(ax, ay, self.width, self.height)
end
function Element:IsInActiveTab()
    local current = self
    local foundWindow = nil
    local foundMultiSection = nil

    -- Find the parent window and MultiSection
    while current and current.parent do
        current = current.parent
        if current.__index == Window then
            foundWindow = current
        elseif current.__index == MultiSection then
            foundMultiSection = current
        end
    end

    -- If no window found, assume element is active
    if not foundWindow then
        return true
    end

    -- Check MultiSection page visibility first
    if foundMultiSection and self.pageIndex then
        if self.pageIndex ~= foundMultiSection.currentPage then
            return false
        end
    end

    -- Check if element belongs to the current active tab
    if foundWindow.currentTab then
        local elementTab = self
        while elementTab and elementTab.parent do
            elementTab = elementTab.parent
            if elementTab == foundWindow.currentTab then
                -- Element is in the active tab
                if foundWindow.pages and foundWindow.currentPage and self.pageIndex then
                    return self.pageIndex == foundWindow.currentPage
                end
                return true
            end
            if elementTab == foundWindow then
                break
            end
        end
        -- Element is not in the active tab
        return false
    end

    -- Check page-level visibility for multi-page elements
    if foundWindow.pages and foundWindow.currentPage and self.pageIndex then
        return self.pageIndex == foundWindow.currentPage
    end

    return true
end

function Element:HandleInput()
    if not self:IsEffectivelyVisible() or not self.enabled then
        return
    end
    if InputState.clickConsumed then
        return
    end
    if IsElementBehindPopup(self) then
        return
    end
    if not self:IsInActiveTab() then
        return
    end
    if InputState.scrollbarActive and
        not (self.__index == Window or self.__index == List or self.__index == MultiSelectDropdown or self.__index ==
            Graph) then
        return
    end
    local allowedElement = false
    if Library.PopupBlocking then
        for popupElement, _ in pairs(Library.ActivePopups) do
            if popupElement == self then
                allowedElement = true
                break
            end
            if popupElement.__index == Graph and popupElement.interpDropdown == self then
                allowedElement = true
                break
            end
            if popupElement.parent == self or self.parent == popupElement then
                allowedElement = true
                break
            end
        end
        if not allowedElement then
            return
        end
    end
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

function Element:OnMouseEnter()
end
function Element:OnMouseLeave()
end
function Element:OnMouseDown()
end
function Element:OnMouseUp()
end
function Element:OnClick()
end
function Element:OnRightClick()
end
function Element:Render()
end
function Element:IsEffectivelyVisible()
    if not self.visible then
        return false
    end

    -- Check if element is in the active tab first
    if not self:IsInActiveTab() then
        return false
    end

    -- Check parent visibility chain
    local current = self.parent
    while current do
        if not current.visible then
            return false
        end
        current = current.parent
    end

    -- Check bounds visibility
    local x, y = self:GetAbsolutePos()
    local parentBounds = self:GetParentBounds()
    if parentBounds then

        -- hack for multi sections --
        if self.parent.pages then
            if y < (parentBounds.y + 50 - self.height) and self.parent.pages then
                return false
            end
            if #self.parent.pages >= 1 and (self.__index == MultiSelectDropdown or self.__index == Dropdown) then
                if y < (parentBounds.y + 70 - self.height) and self.parent.pages[1].name == "Core Settings" then
                    return false
                end
            end
        end
        -----------------------------

        if x + self.width < parentBounds.x or x > parentBounds.x + parentBounds.width or y <
            (parentBounds.y + 22 - self.height) or y > parentBounds.y + (parentBounds.height - 30) then
            return false
        end
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
    keybind.keyCode = keyCode or 0x41
    keybind.mode = mode or "Toggle"
    keybind.callback = callback or function()
    end
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
    if not self.visible then
        return
    end
    local x, y = self:GetAbsolutePos()
    local theme = self:GetTheme()
    local fadeAlpha = self.fadeAlpha or 1.0
    local bgColor = theme.Mid
    if self.binding then
        bgColor = theme.Accent
    elseif self.hovered then
        bgColor = theme.Light
    end
    Drawing:Rect(x, y, self.width, self.height, ApplyFadeAlpha(bgColor, fadeAlpha), true, 2)
    Drawing:Rect(x, y, self.width, self.height, ApplyFadeAlpha(theme.Outer, fadeAlpha), false, 2)
    local displayText = self.binding and "..." or GetKeyName(self.keyCode)
    local textWidth, textHeight = render.measure_text(2, true, displayText)
    local textX = x + (self.width - textWidth) / 2
    local textY = y + (self.height - textHeight) / 2
    Drawing:Text(textX, textY, displayText, 2, true, ApplyFadeAlpha(theme.Text, fadeAlpha))
end
function Keybind:RenderPopup()
    if not self.menuOpen then
        return
    end
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
        self.optionBounds[i] = {
            x = menuX,
            y = optionY,
            width = menuWidth,
            height = 20,
            mode = option
        }
    end
end
function Keybind:HandleInput()
    local isInActiveTab = self:IsInActiveTab()
    if not self.visible or not self.enabled then
        return
    end

    -- Handle menu option clicks with higher priority
    if self.menuOpen and InputState.mouseClicked then
        local x, y = self:GetAbsolutePos()
        local menuWidth = 80
        local menuHeight = 60
        local menuX = x
        local menuY = y + self.height + 2
        local mouseX, mouseY = get_cursor_position()

        local options = {"Hold", "Toggle", "Always"}
        local clickedOption = false

        -- Check if clicking on any menu option
        for i, option in ipairs(options) do
            local optionY = menuY + (i - 1) * 20
            if IsMouseInBounds(menuX, optionY, menuWidth, 20) then
                self.mode = option
                self.menuOpen = false
                Library.OpenKeybindMenu = nil
                UnregisterPopup(self)
                self:RegisterInteraction()
                clickedOption = true
                ConsumeClick()
                break
            end
        end

        -- If didn't click option, check if clicked outside menu to close
        if not clickedOption then
            if not IsMouseInBounds(menuX, menuY, menuWidth, menuHeight) then
                self.menuOpen = false
                Library.OpenKeybindMenu = nil
                UnregisterPopup(self)
            end
        end
        return
    end

    if self.clickdebounce > 0 then
        self.clickdebounce = self.clickdebounce - 1
    end

    if self.binding and isInActiveTab and self.clickdebounce <= 0 then
        self.clickdebounce = 0
        for keyCode = 1, 255 do
            if utility.key_state(keyCode) then
                local oldKeyCode = self.keyCode
                self.keyCode = keyCode
                Library.KeyStates[keyCode] = false
                self.binding = false
                self:RegisterInteraction()
                if oldKeyCode and oldKeyCode ~= 0 and oldKeyCode ~= keyCode then
                    Library:CleanupUnusedKeys()
                end
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
            self:RegisterInteraction()
        end
        if self.clicked then
            self.binding = true
            self.clickdebounce = 100
            self:RegisterInteraction()
        end
    end
end
function Keybind:UpdateState()
    local keyPressed = Library.KeyStates[self.keyCode] or false
    local wasActive = self.currentState

    local isUIOpen = MainWindow and MainWindow.visible
    local isMenuKeybind = elements and elements.menu_keybind and self == elements.menu_keybind

    if isUIOpen and not isMenuKeybind then
        keyPressed = false
    end

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
    if self.callback and (self.currentState ~= wasActive) then
        self.callback(self.currentState)
    end
end

Keybind.RenderMenuPopup = Keybind.RenderPopup

function KeybindsList:new()
    local list = Element.new(self, 10, 200, 180, 22)
    list.visible = true
    list.keybinds = {}
    list.title = "[ Keybinds ]"
    return list
end
function KeybindsList:Render()
    if not self.visible then
        return
    end
    local x, y = self:GetAbsolutePos()
    local theme = Library.Theme.List[Library.Theme.Selected]
    local totalHeight = 22 + (#self.keybinds * 18)
    self.height = totalHeight

    -- Main container with rounded corners like TargetHUD
    Drawing:Rect(x, y, self.width, self.height, theme.Dark, true, 4)
    Drawing:Rect(x, y, self.width, self.height, theme.Accent, false, 4)

    -- Header with gradient background like TargetHUD
    Drawing:Rect(x + 1, y + 1, self.width - 2, 20, theme.Light, true, 0)
    Drawing:Gradient(x + 1, y + 1, self.width - 2, 20, theme.Light, theme.Mid, true)

    local titleWidth, titleHeight = render.measure_text(2, true, self.title)
    local titleX = x + (self.width - titleWidth) / 2
    Drawing:Text(titleX, y + 3, self.title, 2, true, theme.Header)
    local yOffset = 22
    for i, keybind in ipairs(self.keybinds) do
        local entryY = y + yOffset
        local entryX = x + 2
        local entryWidth = self.width - 4

        -- Cleaner entry background with subtle alternating rows
        if i % 2 == 0 then
            Drawing:Rect(entryX, entryY + 3, entryWidth, 18, theme.High, true, 0)
        else
            Drawing:Rect(entryX, entryY + 3, entryWidth, 18, theme.Mid, true, 0)
        end

        -- Keybind name
        Drawing:Text(entryX + 4, entryY + 3, keybind.name, 2, true, theme.Text)

        -- Keybind value with accent background
        local valueText = keybind.key
        local valueWidth, valueHeight = render.measure_text(2, true, valueText)
        local valueX = entryX + entryWidth - valueWidth - 6

        -- Small background for the key value
        Drawing:Rect(valueX - 2, entryY + 5, valueWidth + 4, 14, theme.Accent, true, 2)
        Drawing:Text(valueX, entryY + 3, valueText, 2, true, theme.MidLight)

        yOffset = yOffset + 18
    end
end
function KeybindsList:HandleInput()
end
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
    local screenX, screenY = get_window_size()
    self.x = 10
    self.y = (screenY * 0.4) - 100
end
local Watermark = {}
Watermark.__index = Watermark
function Watermark:new(info)
    local watermark = {
        info = info or {},
        visible = true,
        title = info.title or info.Title or info.name or info.Name or "Melatonin",
        template = info.template or "$TITLE | $PLAYER | FPS: $FPS",
        position = info.position or "top-right",
        x = 0,
        y = 0,
        width = 200,
        height = 35,
        lastUpdate = 0,
        updateInterval = 500,
        animatedWidth = 0,
        cachedText = "",
        lastFps = 0,
        lastPlayerName = "",
        needsRedraw = true,
        fpsUpdateThreshold = 10,
        -- Animation properties
        borderAnimTime = 0,
        borderAnimSpeed = 2.0,
        borderAnimOffset = 0,
        gradientOffset = 0,
        pulseIntensity = 0
    }
    setmetatable(watermark, self)

    watermark.lastPlayerName = "Loading..."
    Library.SharedData.playerName = "Loading..."
    Library.SharedData.fps = 60
    watermark:SafeInitialize()
    return watermark
end
function Watermark:SafeInitialize()
    pcall(function()
        self:UpdateSize()
        self:UpdatePosition()
    end)
end
function Watermark:GetTheme()
    return Library.Theme.List[Library.Theme.Selected]
end
function Watermark:UpdateSize()
    local processedText = self:ProcessTemplate()

    -- Always update if text changed or if we don't have cached text
    if processedText ~= self.cachedText or not self.cachedText then
        self.cachedText = processedText
        self.needsRedraw = true
    end

    if not self.needsRedraw then
        return
    end

    pcall(function()
        local textWidth, textHeight = render.measure_text(2, true, processedText)

        -- Add extra padding to prevent text overflow
        local horizontalPadding = 40 -- Increased from 28 to 40 (20px each side)
        local verticalPadding = 16 -- 8px each side

        -- Ensure minimum dimensions
        local minWidth = 120 -- Increased from 100
        local minHeight = 35

        -- Add extra buffer for text measurement accuracy
        local textBuffer = 10
        local targetWidth = math.max(minWidth, textWidth + horizontalPadding + textBuffer)
        local targetHeight = math.max(minHeight, textHeight + verticalPadding)

        -- Only update if dimensions actually changed
        if math.abs(self.width - targetWidth) > 1 or math.abs(self.height - targetHeight) > 1 then
            self.width = targetWidth
            self.height = targetHeight

            if Library.Settings.Tween then
                self.animatedWidth = Tween.animateValue("watermark_width", self.animatedWidth or self.width, self.width,
                    0.1)
            else
                self.animatedWidth = self.width
            end
        end
    end)

    self.needsRedraw = false
end
function Watermark:UpdatePosition()
    pcall(function()
        local screenWidth, screenHeight = get_window_size()
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
    return text
end
function Watermark:Update()
    local currentTime = utility.get_tickcount()
    if currentTime - self.lastUpdate < self.updateInterval then
        return
    end
    self.lastUpdate = currentTime
    local needsUpdate = false
    local deltaTime = utility.get_delta_time()
    if deltaTime > 0 and deltaTime < 1.0 then -- Sanity check for deltaTime
        local newFps = math.min(math.floor(1 / deltaTime), 999) -- Cap at 999 FPS
        if math.abs(newFps - self.lastFps) >= self.fpsUpdateThreshold then
            Library.SharedData.fps = newFps
            self.lastFps = newFps
            needsUpdate = true
        end
    elseif not Library.SharedData.fps or Library.SharedData.fps == 0 then
        Library.SharedData.fps = 60 -- Default fallback
    end
    local entities = get_entities()
    local localPlayer = nil
    for _, ent in ipairs(entities) do
        if ent.controller and memory.read_int64(ent.controller + offsets.dwLocalPlayerController) ~= 0 then
            localPlayer = ent
            break
        end
    end
    if localPlayer then
        local success, newName = pcall(function()
            return localPlayer:get_name() or "Unknown"
        end)
        if not success then
            newName = "Unknown"
        end
        if newName ~= self.lastPlayerName then
            Library.SharedData.playerName = newName
            self.lastPlayerName = newName
            needsUpdate = true
        end
    else
        if Library.SharedData.playerName ~= "Unknown" then
            Library.SharedData.playerName = "Unknown"
            self.lastPlayerName = "Unknown"
            needsUpdate = true
        end
    end
    if needsUpdate then
        self.needsRedraw = true
        self:UpdateSize()
        self:UpdatePosition()
    end
end
function Watermark:Render()
    if not self.visible then
        return
    end

    pcall(function()
        local theme = self:GetTheme()
        local x, y = self.x, self.y

        -- Get processed text and measure it fresh for rendering
        local processedText = self.cachedText
        if processedText == "" then
            processedText = self:ProcessTemplate()
        end

        local textWidth, textHeight = render.measure_text(2, true, processedText)

        -- Use proper dimensions - ensure width accommodates text properly
        local minPadding = 20 -- Minimum 10px on each side
        local actualMinWidth = textWidth + minPadding + 10 -- Extra buffer
        local width = math.max(self.animatedWidth or self.width, actualMinWidth)
        local height = math.max(self.height, textHeight + 16) -- Ensure height fits text + padding

        -- Update our dimensions if they changed
        if width ~= self.width or height ~= self.height then
            self.width = width
            self.height = height
            self:UpdatePosition() -- Recalculate position with new size
            x, y = self.x, self.y -- Update coordinates
        end

        local maxTextWidth = width - minPadding

        -- Handle text overflow with simple truncation
        if textWidth > maxTextWidth and maxTextWidth > 30 then
            local charCount = #processedText
            if charCount > 0 then
                local avgCharWidth = textWidth / charCount
                local maxChars = math.floor(maxTextWidth / avgCharWidth) - 3 -- Reserve space for "..."

                if maxChars > 0 then
                    processedText = string.sub(processedText, 1, maxChars) .. "..."
                    textWidth, textHeight = render.measure_text(2, true, processedText)
                end
            end
        end

        -- Simple, clean watermark design
        -- Main background
        Drawing:Rect(x, y, width, height, theme.Dark, true, 3)

        -- Border
        Drawing:Rect(x, y, width, height, theme.Accent, false, 3)

        -- Top accent line
        Drawing:Rect(x + 2, y + 2, width - 4, 2, theme.Accent, true, 0)

        -- Text background - properly sized to fit the text
        local textPadding = 4
        local textBgX = x + textPadding
        local textBgY = y + textPadding + 4 -- Below the accent line
        local textBgWidth = width - (textPadding * 2)
        local textBgHeight = height - (textPadding * 2) - 4 -- Account for accent line
        Drawing:Rect(textBgX, textBgY, textBgWidth, textBgHeight, theme.High, true, 1)

        -- Center the text properly
        local textX = x + (width - textWidth) / 2
        local textY = y + (height - textHeight) / 2

        -- Ensure text stays within the background bounds
        textX = math.max(textBgX + 2, math.min(textX, textBgX + textBgWidth - textWidth - 2))
        textY = math.max(textBgY + 2, math.min(textY, textBgY + textBgHeight - textHeight - 2))

        -- Render text with simple shadow
        Drawing:Text(textX + 1, textY + 1, processedText, 2, true, {0, 0, 0, 100})
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
function AttachedColorPicker:new(text, callback, defaultColor, flag)
    local picker = Element.new(self, 0, 0, 20, 15)
    picker.text = text or "Color"
    picker.callback = callback or function()
    end
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
        self.color = {color[1] or 255, color[2] or 255, color[3] or 255, color[4] or 255}
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
    if not self.visible then
        return
    end
    local x, y = self:GetAbsolutePos()
    local theme = self:GetTheme()
    local fadeAlpha = self.fadeAlpha or 1.0
    Drawing:Rect(x, y, self.width, self.height, ApplyFadeAlpha(self.color, fadeAlpha), true, 2)
    Drawing:Rect(x, y, self.width, self.height, ApplyFadeAlpha(theme.Outer, fadeAlpha), false, 2)
end
function AttachedColorPicker:RenderPopup()
    if not self.open then
        return
    end
    local x, y = self:GetAbsolutePos()
    local theme = self:GetTheme()
    local fadeAlpha = self.fadeAlpha or 1.0
    local pickerX = x - self.pickerWidth + self.width
    local pickerY = y + self.height + 5
    local screenWidth, screenHeight = get_window_size()
    if pickerX < 10 then
        pickerX = x + self.width + 5
    end
    if pickerY + self.pickerHeight > screenHeight - 10 then
        pickerY = y - self.pickerHeight - 5
    end
    Drawing:Rect(pickerX, pickerY, self.pickerWidth, self.pickerHeight, ApplyFadeAlpha(theme.Dark, fadeAlpha), true, 2)
    Drawing:Rect(pickerX, pickerY, self.pickerWidth, self.pickerHeight, ApplyFadeAlpha(theme.Outer, fadeAlpha), false, 2)
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
    Drawing:Rect(hueBarX - 2, hueY - 2, hueBarWidth + 4, 4, ApplyFadeAlpha(theme.Text, fadeAlpha), false, 0)
    local svAreaX = hueBarX + hueBarWidth + 10
    local svAreaY = hueBarY
    local svAreaWidth = 120
    local svAreaHeight = 120
    for i = 0, svAreaWidth do
        for j = 0, svAreaHeight do
            local s = i / svAreaWidth
            local v = 1 - (j / svAreaHeight)
            local r, g, b = self:HSVtoRGB(self.hue, s, v)
            render.rect(svAreaX + i, svAreaY + j, 1, 1, r * fadeAlpha, g * fadeAlpha, b * fadeAlpha, 255 * fadeAlpha)
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
            render.rect(alphaX + i, alphaY + j, math.min(8, alphaWidth - i), math.min(8, alphaHeight - j), color, color,
                color, 255)
        end
    end
    for i = 0, alphaWidth do
        local alpha = i / alphaWidth
        render.rect(alphaX + i, alphaY, 1, alphaHeight, self.color[1] * fadeAlpha, self.color[2] * fadeAlpha,
            self.color[3] * fadeAlpha, alpha * 255 * fadeAlpha)
    end
    Drawing:Rect(alphaX, alphaY, alphaWidth, alphaHeight, theme.Outer, false, 0)
    local alphaHandleX = alphaX + (self.color[4] / 255) * alphaWidth
    Drawing:Rect(alphaHandleX - 2, alphaY - 2, 4, alphaHeight + 4, theme.Text, false, 0)
    local previewX = pickerX + 5
    local previewY = pickerY + 155
    Drawing:Rect(previewX, previewY, 40, 20, self.color, true, 0)
    Drawing:Rect(previewX, previewY, 40, 20, theme.Outer, false, 0)
end
function AttachedColorPicker:HandleInput()
    if not self.visible or not self.enabled then
        return
    end
    if IsElementBehindPopup(self) and not self.open then
        return
    end
    if not self:IsInActiveTab() then
        return
    end
    if not self:CanInteract() then
        return
    end

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
        ConsumeClick()
    end
    if self.open and InputState.mousePressed then
        local pickerX = x - self.pickerWidth + self.width
        local pickerY = y + self.height + 5
        local screenWidth, screenHeight = get_window_size()
        if pickerX < 10 then
            pickerX = x + self.width + 5
        end
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
        local mouseX, mouseY = get_cursor_position()
        local dragging = false

        -- Allow continuous dragging on hue bar
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
            dragging = true
        end

        -- Allow continuous dragging on saturation/value area
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
            dragging = true
        end

        -- Allow continuous dragging on alpha bar
        if IsMouseInBounds(alphaX, alphaY, alphaWidth, 15) then
            local relX = math.max(0, math.min(1, (mouseX - alphaX) / alphaWidth))
            self.color[4] = relX * 255
            if self.callback then
                self.callback(self.color)
            end
            dragging = true
        end

        -- Only consume click if we started dragging, not continuously
        if dragging and InputState.mouseClicked then
            self:RegisterInteraction()
        end
    end
end
function Toggle:new(text, callback, defaultValue, flag)
    local toggle = Element.new(self, 0, 0, 100, 25)
    toggle.text = text or "Toggle"
    toggle.callback = callback or function()
    end
    toggle.value = defaultValue or false
    toggle.keybind = nil
    toggle.colorPicker = nil
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
    if not self.visible then
        return
    end
    local x, y = self:GetAbsolutePos()
    local theme = self:GetTheme()
    local fadeAlpha = self.fadeAlpha or 1.0
    local boxSize = 14
    local boxY = y + (self.height - boxSize) / 2
    Drawing:Rect(x, boxY, boxSize, boxSize, ApplyFadeAlpha(theme.Outer, fadeAlpha), false, 2)
    Drawing:Rect(x + 1, boxY + 1, boxSize - 2, boxSize - 2, ApplyFadeAlpha(theme.Mid, fadeAlpha), true, 1)
    if self.value then
        Drawing:Rect(x + 3, boxY + 3, boxSize - 6, boxSize - 6, ApplyFadeAlpha(theme.Accent, fadeAlpha), true, 0)
    end
    local rightElementsWidth = 0
    local elementSpacing = 5
    if self.colorPicker then
        rightElementsWidth = rightElementsWidth + self.colorPicker.width + elementSpacing
    end
    if self.keybind then
        rightElementsWidth = rightElementsWidth + 60 + elementSpacing
    end
    local textEndX = x + self.width - rightElementsWidth
    if self.colorPicker then
        self.colorPicker.x = self.width - self.colorPicker.width - (self.keybind and 65 or 0)
        self.colorPicker.y = (self.height - self.colorPicker.height) / 2
        self.colorPicker:Render()
    end
    if self.keybind then
        local keybindWidth = 60
        self.keybind.x = self.width - keybindWidth
        self.keybind.y = 0
        self.keybind.width = keybindWidth
        self.keybind:Render()
    end
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
    Drawing:Text(x + boxSize + 5, y + 2, displayText, 2, true, ApplyFadeAlpha(theme.Text, fadeAlpha))
end
function Toggle:HandleInput()
    if not self.visible or not self.enabled then
        return
    end
    if IsElementBehindPopup(self) then
        return
    end
    if not self:IsInActiveTab() then
        return
    end
    if not self:CanInteract() then
        return
    end
    if InputState.clickConsumed then
        return
    end
    Element.HandleInput(self)
    local x, y = self:GetAbsolutePos()
    local mouseX, mouseY = get_cursor_position()
    if self.clicked then
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
    -- Clean up existing keybind if one exists
    if self.keybind then
        -- Remove from KeybindsList display if it was active
        if self.keybind.currentState and Library.KeybindsList then
            Library.KeybindsList:RemoveKeybind(self.keybind.text)
        end

        -- Remove from AllKeybinds global list
        for i, kb in ipairs(Library.AllKeybinds or {}) do
            if kb == self.keybind then
                table.remove(Library.AllKeybinds, i)
                break
            end
        end

        -- Clear key state
        if self.keybind.keyCode and Library.KeyStates then
            Library.KeyStates[self.keybind.keyCode] = false
        end
    end

    local keybind = Keybind:new(self.text .. " Key", keyCode, mode, function(state)
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
    if not self.visible or not Library.ESPPreview.Enabled then
        return
    end
    local x, y = self:GetAbsolutePos()
    local theme = self:GetTheme()
    local fadeAlpha = self.fadeAlpha or 1.0
    Drawing:Rect(x, y, self.width, self.height, ApplyFadeAlpha(theme.Mid, fadeAlpha), true, 2)
    Drawing:Rect(x, y, self.width, self.height, ApplyFadeAlpha(theme.Outer, fadeAlpha), false, 2)
    Drawing:Rect(x + 1, y + 1, self.width - 2, 20, ApplyFadeAlpha(theme.Light, fadeAlpha), true, 0)
    Drawing:Text(x + 5, y + 4, "ESP Preview", 2, true, ApplyFadeAlpha(theme.Header, fadeAlpha))
    local previewX = x + 10
    local previewY = y + 30
    local previewWidth = self.width - 20
    local previewHeight = self.height - 40
    Drawing:Rect(previewX, previewY, previewWidth, previewHeight, ApplyFadeAlpha(theme.Dark, fadeAlpha), true, 2)
    Drawing:Rect(previewX, previewY, previewWidth, previewHeight, ApplyFadeAlpha(theme.Outer, fadeAlpha), false, 2)
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
    render.image(Library.Assets.Joeyy, playerX, playerY, playerWidth, playerHeight, 255 * fadeAlpha, 255 * fadeAlpha,
        255 * fadeAlpha, 255 * fadeAlpha)
    if Library.ESPPreview.Components.Box then
        local boxColor = Library.ESPPreview.Colors.Box
        Drawing:Rect(playerX, playerY, playerWidth, playerHeight, ApplyFadeAlpha({0, 0, 0, 255}, fadeAlpha), false, 0)
        Drawing:Rect(playerX + 1, playerY + 1, playerWidth - 2, playerHeight - 2, ApplyFadeAlpha(boxColor, fadeAlpha),
            false, 0)
    end
    if Library.ESPPreview.Components.HealthBar then
        local healthBarX = playerX - 8
        local healthBarY = playerY
        local healthBarWidth = 4
        local healthBarHeight = playerHeight
        Drawing:Rect(healthBarX, healthBarY, healthBarWidth, healthBarHeight, ApplyFadeAlpha({0, 0, 0, 255}, fadeAlpha),
            true, 0)
        local healthFillHeight = (healthBarHeight - 2) * (currentHealth / 100)
        local healthPercent = currentHealth / 100
        local healthColor = {math.floor((1 - healthPercent) * 255), math.floor(healthPercent * 255), 0, 255}
        Drawing:Rect(healthBarX + 1, healthBarY + healthBarHeight - healthFillHeight - 1, healthBarWidth - 2,
            healthFillHeight, ApplyFadeAlpha(healthColor, fadeAlpha), true, 0)
        local healthText = tostring(math.floor(currentHealth))
        Drawing:Text(healthBarX - 15, healthBarY + healthBarHeight / 2, healthText, 1, true,
            ApplyFadeAlpha(healthColor, fadeAlpha))
    end
    if Library.ESPPreview.Components.Name then
        local nameColor = Library.ESPPreview.Colors.Name
        Drawing:Text(playerX + playerWidth / 2, playerY - 15, "Joeyy", 2, true, ApplyFadeAlpha(nameColor, fadeAlpha))
    end
    if Library.ESPPreview.Components.Distance then
        local distanceColor = Library.ESPPreview.Colors.Distance
        Drawing:Text(playerX + playerWidth / 2, playerY + playerHeight + 5, "25m", 2, true,
            ApplyFadeAlpha(distanceColor, fadeAlpha))
    end
    if Library.ESPPreview.Components.Weapon then
        local weaponColor = Library.ESPPreview.Colors.Weapon
        Drawing:Text(playerX + playerWidth / 2, playerY + playerHeight + 20, "Fent", 2, true,
            ApplyFadeAlpha(weaponColor, fadeAlpha))
    end
    if Library.ESPPreview.Components.Flags then
        local flagColor = Library.ESPPreview.Colors.Flags
        Drawing:Text(playerX + playerWidth + 5, playerY + 5, "ESP", 1, true, ApplyFadeAlpha(flagColor, fadeAlpha))
        Drawing:Text(playerX + playerWidth + 5, playerY + 20, "VIS", 1, true, ApplyFadeAlpha(flagColor, fadeAlpha))
    end
    if Library.ESPPreview.Components.Skeleton then
        local skeletonColor = Library.ESPPreview.Colors.Skeleton
        local centerX = playerX + playerWidth / 2
        local headY = playerY + 35
        local shoulderY = playerY + 50
        local waistY = playerY + 90
        local pelvisY = playerY + 120
        local feetY = playerY + playerHeight - 20
        Drawing:Line(centerX, headY, centerX, shoulderY, ApplyFadeAlpha(skeletonColor, fadeAlpha), 2)
        Drawing:Line(centerX - 20, shoulderY, centerX + 20, shoulderY, ApplyFadeAlpha(skeletonColor, fadeAlpha), 2)
        Drawing:Line(centerX, shoulderY, centerX, pelvisY, ApplyFadeAlpha(skeletonColor, fadeAlpha), 2)
        Drawing:Line(centerX - 8, pelvisY, centerX + 8, pelvisY, ApplyFadeAlpha(skeletonColor, fadeAlpha), 2)
        Drawing:Line(centerX - 20, shoulderY, centerX - 25, shoulderY + 25, ApplyFadeAlpha(skeletonColor, fadeAlpha), 2)
        Drawing:Line(centerX - 25, shoulderY + 25, centerX - 30, shoulderY + 45,
            ApplyFadeAlpha(skeletonColor, fadeAlpha), 2)
        Drawing:Line(centerX + 20, shoulderY, centerX + 25, shoulderY + 25, ApplyFadeAlpha(skeletonColor, fadeAlpha), 2)
        Drawing:Line(centerX + 25, shoulderY + 25, centerX + 30, shoulderY + 45,
            ApplyFadeAlpha(skeletonColor, fadeAlpha), 2)
        Drawing:Line(centerX - 4, pelvisY, centerX - 15, feetY, ApplyFadeAlpha(skeletonColor, fadeAlpha), 2)
        Drawing:Line(centerX + 4, pelvisY, centerX + 15, feetY, ApplyFadeAlpha(skeletonColor, fadeAlpha), 2)
    end
    if Library.ESPPreview.Components.Chams then
        local chamsColor = Library.ESPPreview.Colors.Chams
        chamsColor[4] = 100
        Drawing:Rect(playerX + 5, playerY + 5, playerWidth - 10, playerHeight - 10,
            ApplyFadeAlpha(chamsColor, fadeAlpha), true, 0)
    end
end
function ESPPreview:HandleInput()
    if not self.visible or not self.enabled then
        return
    end
    if IsElementBehindPopup(self) then
        return
    end
    if not self:IsInActiveTab() then
        return
    end
    Element.HandleInput(self)
end
function EntityESPPreview:new(name, parent, x, y, width, height)
    local preview = Element.new(self, x or 10, y or 60, width or 250, height or 350)
    preview.name = name
    preview.parent = parent
    return preview
end
function EntityESPPreview:GetTheme()
    local current = self
    while current and current.parent do
        current = current.parent
        if current and current.theme then
            return current.theme
        end
    end
    return Library.Theme.List[Library.Theme.Selected]
end
function EntityESPPreview:Render()
    if not self.visible or not Library.EntityESPPreview.Enabled then
        return
    end
    local x, y = self:GetAbsolutePos()
    local theme = self:GetTheme()
    local fadeAlpha = self.fadeAlpha or 1.0
    Drawing:Rect(x, y, self.width, self.height, ApplyFadeAlpha(theme.Mid, fadeAlpha), true, 2)
    Drawing:Rect(x, y, self.width, self.height, ApplyFadeAlpha(theme.Outer, fadeAlpha), false, 2)
    Drawing:Rect(x + 1, y + 1, self.width - 2, 20, ApplyFadeAlpha(theme.Light, fadeAlpha), true, 0)
    Drawing:Text(x + 5, y + 4, "World ESP Preview", 2, true, ApplyFadeAlpha(theme.Header, fadeAlpha))
    local previewX = x + 10
    local previewY = y + 30
    local previewWidth = self.width - 20
    local previewHeight = self.height - 40
    Drawing:Rect(previewX, previewY, previewWidth, previewHeight, ApplyFadeAlpha(theme.Dark, fadeAlpha), true, 2)
    Drawing:Rect(previewX, previewY, previewWidth, previewHeight, ApplyFadeAlpha(theme.Outer, fadeAlpha), false, 2)
    -- Make entity the same size as player ESP
    local entityX = previewX + previewWidth / 2 - 57.5 -- Half of player width (115/2)
    local entityY = previewY + 20
    local entityWidth = 115 -- Same as player width
    local entityHeight = 250 -- Same as player height
    -- Draw a simple World entity representation (humanoid figure)
    Drawing:Rect(entityX + 35, entityY + 10, 45, 60, ApplyFadeAlpha({100, 100, 100, 255}, fadeAlpha), true, 2) -- Head
    Drawing:Rect(entityX + 20, entityY + 75, 75, 100, ApplyFadeAlpha({120, 120, 120, 255}, fadeAlpha), true, 2) -- Body
    Drawing:Rect(entityX + 5, entityY + 85, 15, 70, ApplyFadeAlpha({110, 110, 110, 255}, fadeAlpha), true, 2) -- Left arm
    Drawing:Rect(entityX + 95, entityY + 85, 15, 70, ApplyFadeAlpha({110, 110, 110, 255}, fadeAlpha), true, 2) -- Right arm
    Drawing:Rect(entityX + 30, entityY + 175, 25, 70, ApplyFadeAlpha({100, 100, 100, 255}, fadeAlpha), true, 2) -- Left leg
    Drawing:Rect(entityX + 60, entityY + 175, 25, 70, ApplyFadeAlpha({100, 100, 100, 255}, fadeAlpha), true, 2) -- Right leg
    if Library.EntityESPPreview.Components.Box then
        local boxColor = Library.EntityESPPreview.Colors.Box
        Drawing:Rect(entityX, entityY, entityWidth, entityHeight, ApplyFadeAlpha({0, 0, 0, 255}, fadeAlpha), false, 0)
        Drawing:Rect(entityX + 1, entityY + 1, entityWidth - 2, entityHeight - 2, ApplyFadeAlpha(boxColor, fadeAlpha),
            false, 0)
    end
    if Library.EntityESPPreview.Components.Name then
        local nameColor = Library.EntityESPPreview.Colors.Name
        Drawing:Text(entityX + entityWidth / 2, entityY - 15, "World", 2, true, ApplyFadeAlpha(nameColor, fadeAlpha))
    end
    if Library.EntityESPPreview.Components.Distance then
        local distanceColor = Library.EntityESPPreview.Colors.Distance
        Drawing:Text(entityX + entityWidth / 2, entityY + entityHeight + 5, "25m", 2, true,
            ApplyFadeAlpha(distanceColor, fadeAlpha))
    end
    if Library.EntityESPPreview.Components.Flags then
        local flagColor = Library.EntityESPPreview.Colors.Flags
        Drawing:Text(entityX + entityWidth + 5, entityY + 5, "ESP", 1, true, ApplyFadeAlpha(flagColor, fadeAlpha))
        Drawing:Text(entityX + entityWidth + 5, entityY + 20, "World", 1, true, ApplyFadeAlpha(flagColor, fadeAlpha))
    end
end
function EntityESPPreview:HandleInput()
    if not self.visible or not self.enabled then
        return
    end
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
    playerList.failedImages = {}
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
    if not self.selectedPlayerName then
        return nil
    end
    for _, player in ipairs(self.players) do
        if player.name == self.selectedPlayerName then
            return player
        end
    end
    return nil
end
function PlayerList:GetPlayerTeam(playerName)
    return "ASD"
end
function PlayerList:Render()
    if not self.visible then
        return
    end
    local x, y = self:GetAbsolutePos()
    local theme = self:GetTheme()
    local fadeAlpha = self.fadeAlpha or 1.0
    Drawing:Rect(x, y, self.width, self.height, ApplyFadeAlpha(theme.Mid, fadeAlpha), true, 2)
    Drawing:Rect(x, y, self.width, self.height, ApplyFadeAlpha(theme.Outer, fadeAlpha), false, 2)
    Drawing:Rect(x + 1, y + 1, self.width - 2, 20, ApplyFadeAlpha(theme.Light, fadeAlpha), true, 0)
    Drawing:Text(x + 5, y + 4, self.name .. " - " .. #self.players .. " Players", 2, true,
        ApplyFadeAlpha(theme.Header, fadeAlpha))
    local listX = x + 4
    local listY = y + 24
    local listWidth = self.width - 8
    local listHeight = self.maxVisiblePlayers * self.rowHeight
    Drawing:Rect(listX, listY, listWidth, listHeight, ApplyFadeAlpha(theme.Dark, fadeAlpha), true, 0)
    Drawing:Rect(listX, listY, listWidth, listHeight, ApplyFadeAlpha(theme.Outer, fadeAlpha), false, 0)
    local colWidth = listWidth / 3
    Drawing:Text(listX + 4, listY + 2, "Username", 1, true, ApplyFadeAlpha(theme.Text, fadeAlpha))
    Drawing:Text(listX + colWidth + 4, listY + 2, "Team", 1, true, ApplyFadeAlpha(theme.Text, fadeAlpha))
    Drawing:Text(listX + colWidth * 2 + 4, listY + 2, "Status", 1, true, ApplyFadeAlpha(theme.Text, fadeAlpha))
    Drawing:Line(listX + colWidth, listY, listX + colWidth, listY + listHeight, ApplyFadeAlpha(theme.Outer, fadeAlpha),
        1)
    Drawing:Line(listX + colWidth * 2, listY, listX + colWidth * 2, listY + listHeight,
        ApplyFadeAlpha(theme.Outer, fadeAlpha), 1)
    for i = 1, self.maxVisiblePlayers do
        local playerIndex = i + self.scrollOffset
        local player = self.players[playerIndex]
        if player then
            local rowY = listY + (i - 1) * self.rowHeight + 18
            local isSelected = player.name == self.selectedPlayerName
            player.clickY = rowY
            if isSelected then
                Drawing:Rect(listX + 1, rowY, listWidth - 2, self.rowHeight, ApplyFadeAlpha(theme.Accent, fadeAlpha),
                    true, 0)
            elseif i % 2 == 0 then
                Drawing:Rect(listX + 1, rowY, listWidth - 2, self.rowHeight, ApplyFadeAlpha(theme.High, fadeAlpha),
                    true, 0)
            end
            if i < self.maxVisiblePlayers then
                Drawing:Line(listX + 3, rowY + self.rowHeight, listX + listWidth - 3, rowY + self.rowHeight,
                    ApplyFadeAlpha(theme.Outer, fadeAlpha), 1)
            end
            local textColor = isSelected and ApplyFadeAlpha({255, 255, 255, 255}, fadeAlpha) or
                                  ApplyFadeAlpha(theme.Text, fadeAlpha)
            local displayName = player.name
            if self.sessionFlags[player.name] then
                displayName = displayName .. " [" .. self.sessionFlags[player.name] .. "]"
            end
            Drawing:Text(listX + 4, rowY + 4, displayName, 2, true, textColor)
            Drawing:Text(listX + colWidth + 4, rowY + 4, player.team, 2, true, textColor)
            local statusColor = textColor
            if player.status == "Enemy" then
                statusColor = ApplyFadeAlpha({255, 55, 55, 255}, fadeAlpha)
            elseif player.status == "Friend" then
                statusColor = ApplyFadeAlpha({55, 255, 55, 255}, fadeAlpha)
            elseif player.status == "Local Player" then
                statusColor = ApplyFadeAlpha({200, 55, 200, 255}, fadeAlpha)
            elseif player.status == "Priority" then
                statusColor = ApplyFadeAlpha({255, 165, 0, 255}, fadeAlpha)
            elseif player.status == "Moderator" then
                statusColor = ApplyFadeAlpha({250, 143, 12, 255}, fadeAlpha)
            end
            Drawing:Text(listX + colWidth * 2 + 4, rowY + 4, player.status, 2, true, statusColor)
        end
    end
    if #self.players > self.maxVisiblePlayers then
        local scrollbarX = x + self.width - 12
        local scrollbarY = listY + 18
        local scrollbarHeight = listHeight - 18
        Drawing:Rect(scrollbarX, scrollbarY, 8, scrollbarHeight, ApplyFadeAlpha(theme.Dark, fadeAlpha), true, 0)
        local thumbHeight = math.max(20, scrollbarHeight * (self.maxVisiblePlayers / #self.players))
        local thumbY = scrollbarY + (scrollbarHeight - thumbHeight) *
                           (self.scrollOffset / (#self.players - self.maxVisiblePlayers))
        Drawing:Rect(scrollbarX + 1, thumbY, 6, thumbHeight, ApplyFadeAlpha(theme.Accent, fadeAlpha), true, 0)
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
        Drawing:Rect(listX, infoY, listWidth, infoHeight, ApplyFadeAlpha(theme.Dark, fadeAlpha), true, 0)
        Drawing:Rect(listX, infoY, listWidth, infoHeight, ApplyFadeAlpha(theme.Outer, fadeAlpha), false, 0)
        local avatarSize = 60
        local avatarX = listX + 10
        local avatarY = infoY + 10
        Drawing:Rect(avatarX, avatarY, avatarSize, avatarSize, ApplyFadeAlpha(theme.High, fadeAlpha), true, 0)
        Drawing:Rect(avatarX, avatarY, avatarSize, avatarSize, ApplyFadeAlpha(theme.Outer, fadeAlpha), false, 0)
        local playerId = selectedPlayer.userId or selectedPlayer.name
        if self.avatarCache[playerId] then
            render.image(self.avatarCache[playerId], avatarX + 2, avatarY + 2, avatarSize - 4, avatarSize - 4,
                255 * fadeAlpha, 255 * fadeAlpha, 255 * fadeAlpha, 255 * fadeAlpha)
        else
            if selectedPlayer.userId and self.failedImages[playerId] then
                local currentTime = utility.get_tickcount()
                if currentTime - self.failedImages[playerId] > 5000 then
                    self.failedImages[playerId] = nil
                    self:LoadAvatarsForUserIds({tostring(selectedPlayer.userId)})
                end
            end
            Drawing:Text(avatarX + avatarSize / 2, avatarY + avatarSize / 2, "...", 2, true,
                ApplyFadeAlpha(theme.Text, fadeAlpha))
        end
        local infoText = string.format("Selected: %s\nTeam: %s\nStatus: %s\nUser ID: %s", selectedPlayer.name,
            selectedPlayer.team, selectedPlayer.status, selectedPlayer.userId or "N/A")
        Drawing:Text(avatarX + avatarSize + 10, infoY + 10, infoText, 2, true, ApplyFadeAlpha(theme.Text, fadeAlpha))
        local buttonY = infoY + 75
        local buttonWidth = 120
        local buttonHeight = 25
        local buttonSpacing = 5
        local buttonsStartX = avatarX + avatarSize + 10
        if not self.statusDropdown then
            self.statusDropdown = Dropdown:new("", {"None", "Friend", "Enemy", "Priority"}, function(selected)
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
        if self.statusDropdown then
            self.statusDropdown:Render()
        end
        if self.addFlagButton then
            self.addFlagButton:Render()
        end
        if self.removeFlagButton then
            self.removeFlagButton:Render()
        end
    end
end
function PlayerList:HandleInput()
    if not self.visible or not self.enabled then
        return
    end
    if IsElementBehindPopup(self) then
        return
    end
    if not self:IsInActiveTab() then
        return
    end
    Element.HandleInput(self)
    local x, y = self:GetAbsolutePos()
    local listX = x + 4
    local listY = y + 24
    local listHeight = self.maxVisiblePlayers * self.rowHeight
    if self.scrollbarBounds and #self.players > self.maxVisiblePlayers then
        local mouseX, mouseY = get_cursor_position()
        if InputState.mouseClicked then
            if IsMouseInBounds(self.scrollbarBounds.x, self.scrollbarBounds.thumbY, self.scrollbarBounds.width,
                self.scrollbarBounds.thumbHeight) then
                if IsPopupActive() then
                    CloseAllPopups()
                end
                self.scrollbarDragging = true
                self.scrollbarDragOffset = mouseY - self.scrollbarBounds.thumbY
            end
        end
        if self.scrollbarDragging then
            if InputState.mousePressed then
                local newThumbY = mouseY - self.scrollbarDragOffset
                local minThumbY = self.scrollbarBounds.y
                local maxThumbY = self.scrollbarBounds.y + self.scrollbarBounds.height -
                                      self.scrollbarBounds.thumbHeight
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
        local mouseX, mouseY = get_cursor_position()
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
        if self.statusDropdown then
            self.statusDropdown:HandleInput()
        end
        if self.addFlagButton then
            self.addFlagButton:HandleInput()
        end
        if self.removeFlagButton then
            self.removeFlagButton:HandleInput()
        end
    end
end
function PlayerList:AddPlayer(name, team, status, userId)
    local player = {
        name = name or "Unknown",
        team = team or "None",
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
function PlayerList:LoadAvatarsForUserIds(userIds)
    if #userIds == 0 then
        return
    end
    local userIdsString = table.concat(userIds, ",")
    local thumbnailUrl = string.format(
        "https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds=%s&size=352x352&format=Png&isCircular=false",
        userIdsString)
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
                                    self.failedImages[userData.targetId] = nil
                                else
                                    self.failedImages[userData.targetId] = utility.get_tickcount()
                                end
                            else
                                self.failedImages[userData.targetId] = utility.get_tickcount()
                            end
                        end)
                    else
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
    if self.avatarsInitialized then
        return
    end
    local userIdsToLoad = {}
    local entities = get_entities()
    if entities then
        for _, player in pairs(entities) do
            if player:is_alive() then
                local userId = player:get_steamid()
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
    local entities = get_entities()
    local localPlayer = nil
    for _, ent in ipairs(entities) do
        if ent.controller and memory.read_int64(ent.controller + offsets.dwLocalPlayerController) ~= 0 then
            localPlayer = ent
            break
        end
    end
    if localPlayer then
        local userId = nil
        local entities = get_entities()
        local gameLocalPlayer = nil
        for _, ent in ipairs(entities) do
            if ent.controller and memory.read_int64(ent.controller + offsets.dwLocalPlayerController) ~= 0 then
                gameLocalPlayer = ent
                break
            end
        end
        if gameLocalPlayer then
            userId = gameLocalPlayer:get_steamid()
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
    if not userId then
        return
    end
    if self.avatarCache[userId] then
        return
    end
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
    local entities = get_entities()
    if entities then
        for _, player in pairs(entities) do
            if player:is_alive() then
                local userId = player:get_steamid()
                currentPlayers[player:get_name()] = {
                    name = player:get_name(),
                    userId = userId,
                    present = true
                }
            end
        end
    end
    local entities = get_entities()
    local localPlayer = get_local_player()
    if localPlayer then
        local userId = nil
        local entities = get_entities()

        if localPlayer then
            userId = localPlayer:get_steamid()
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
function PlayerList:UpdatePlayers()

    self:CheckForPlayerChanges()
    local previousSelection = self.selectedPlayerName
    local previousManualChanges = {}
    for name, status in pairs(self.manualStatusChanges) do
        previousManualChanges[name] = status
    end
    self.players = {}
    local localPlayerAdded = nil
    local entities = get_entities()
    local localPlayer = get_local_player()

    local localPlayerData = nil
    if localPlayer then
        local localTeam = localPlayer:get_team()
        localPlayerData = self:AddPlayer(localPlayer:get_name(), "Team " .. tostring(localTeam), "Local Player",
            localPlayer:get_steamid())
    end
    localPlayerAdded = localPlayerData
    if entities then
        for _, player in pairs(entities) do
            if player:is_alive() and not player:is_local_player() then
                local playerName = player:get_name()
                local status = "None"
                if previousManualChanges[playerName] then
                    status = previousManualChanges[playerName]
                    self.manualStatusChanges[playerName] = status
                else
                    if player:is_enemy() then
                        status = "Enemy"
                    else
                        status = "Teammate"
                    end
                end
                local userId = player:get_steamid()
                local teamName = "Team " .. tostring(player:get_team())
                self:AddPlayer(playerName, teamName, status, userId)
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
    button.callback = callback or function()
    end
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
    if not self.visible then
        return
    end
    local x, y = self:GetAbsolutePos()
    local theme = self:GetTheme()
    local fadeAlpha = self.fadeAlpha or 1.0
    local bgColor1, bgColor2
    if self.pressed then
        bgColor1 = theme.Dark
        bgColor2 = theme.High
    elseif self.hovered then
        bgColor1 = theme.Light
        bgColor2 = theme.Accent
    else
        bgColor1 = theme.Mid
        bgColor2 = theme.Light
    end
    Drawing:Gradient(x, y, self.width, self.height, ApplyFadeAlpha(bgColor1, fadeAlpha),
        ApplyFadeAlpha(bgColor2, fadeAlpha), true)
    Drawing:Rect(x, y, self.width, self.height, ApplyFadeAlpha(theme.Outer, fadeAlpha), false, 2)
    local textWidth, textHeight = render.measure_text(2, true, self.text)
    local textX = x + (self.width - textWidth) / 2
    local textY = y + (self.height - textHeight) / 2
    Drawing:Text(textX, textY, self.text, 2, true, ApplyFadeAlpha(theme.Text, fadeAlpha))
end
function Button:OnClick()
    if self.callback then
        self.callback()
    end
end
function Button:HandleInput()
    if not self.visible or not self.enabled then
        return
    end
    if IsElementBehindPopup(self) then
        return
    end
    if not self:IsInActiveTab() then
        return
    end
    if not self:CanInteract() then
        return
    end
    if InputState.clickConsumed then
        return
    end
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
    slider.callback = callback or function()
    end
    slider.dragging = false
    slider.animatedValue = slider.value
    slider.flag = flag
    slider.textZones = {}
    if flag and not Library.Flags[flag] then
        Library.Flags[flag] = slider
    end
    return slider
end

function Slider:AddTextZone(threshold, text, condition)
    table.insert(self.textZones, {
        threshold = threshold,
        text = text,
        condition = condition or ">="
    })
    return self
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
    pcall(function()
        self.value = math.max(self.min, math.min(self.max, value))
        if self.callback then
            self.callback(self.value)
        end
    end)
end
function Slider:Render()
    if not self.visible then
        return
    end
    local x, y = self:GetAbsolutePos()
    local theme = self:GetTheme()
    local fadeAlpha = self.fadeAlpha or 1.0
    if Library.Settings.Tween then
        self.animatedValue = Tween.animateValue("slider_" .. tostring(self), self.animatedValue, self.value, 0.2)
    else
        self.animatedValue = self.value
    end
    Drawing:Text(x, y, self.text, 2, true, ApplyFadeAlpha(theme.Text, fadeAlpha))
    local trackY = y + 18
    local trackHeight = 12
    Drawing:Rect(x, trackY, self.width, trackHeight, ApplyFadeAlpha(theme.Outer, fadeAlpha), false, 1)
    Drawing:Rect(x + 1, trackY + 1, self.width - 2, trackHeight - 2, ApplyFadeAlpha(theme.Dark, fadeAlpha), true, 0)
    local percent = (self.animatedValue - self.min) / (self.max - self.min)
    local fillWidth = (self.width - 2) * percent
    Drawing:Rect(x + 1, trackY + 1, fillWidth, trackHeight - 2, ApplyFadeAlpha(theme.Accent, fadeAlpha), true, 0)
    local fillWidth = (self.width - 2) * percent
    if fillWidth > 0 then
        Drawing:Gradient(x + 1, trackY + 1, fillWidth, trackHeight - 2, ApplyFadeAlpha(theme.Accent, fadeAlpha),
            ApplyFadeAlpha(theme.AccentLight, fadeAlpha), true)
    end
    local valueText = string.format("%.1f", self.value)

    -- Check text zones
    for _, zone in ipairs(self.textZones) do
        local matches = false
        if zone.condition == ">=" and self.value >= zone.threshold then
            matches = true
        elseif zone.condition == ">" and self.value > zone.threshold then
            matches = true
        elseif zone.condition == "<=" and self.value <= zone.threshold then
            matches = true
        elseif zone.condition == "<" and self.value < zone.threshold then
            matches = true
        elseif zone.condition == "==" and math.abs(self.value - zone.threshold) < 0.01 then
            matches = true
        end

        if matches then
            valueText = zone.text
            break
        end
    end

    local textWidth, textHeight = render.measure_text(2, true, valueText)
    local textX = x + (self.width - textWidth) / 2
    local textY = trackY + (trackHeight - textHeight) / 2
    Drawing:Text(textX, textY, valueText, 2, true, ApplyFadeAlpha(theme.Text, fadeAlpha))
end
function Slider:HandleInput()
    if not self.visible or not self.enabled then
        return
    end
    if IsElementBehindPopup(self) then
        return
    end
    if not self:IsInActiveTab() then
        return
    end
    if not self:CanInteract() then
        return
    end
    if InputState.scrollbarActive then
        return
    end
    if InputState.clickConsumed then
        return
    end
    Element.HandleInput(self)
    local x, y = self:GetAbsolutePos()
    local trackY = y + 18
    local trackBounds = IsMouseInBounds(x, trackY, self.width, 12)
    if InputState.mousePressed and trackBounds and not InputState.clickConsumed then
        local mouseX, mouseY = get_cursor_position()
        local percent = math.max(0, math.min(1, (mouseX - x) / self.width))
        local newValue = self.min + (self.max - self.min) * percent
        if math.abs(newValue - self.value) > 0.01 then
            self.value = newValue
            if self.callback then
                self.callback(self.value)
            end
            self:RegisterInteraction()
        end
    end
end
function Graph:new(text, callback, defaultNodes, interpolationType, flag, width, height)
    local graph = Element.new(self, 0, 0, 180, 60)
    graph.text = text or "Graph"
    graph.callback = callback or function()
    end
    graph.nodes = defaultNodes or {{
        x = 0,
        y = 0,
        interpolationType = "Linear"
    }, {
        x = 100,
        y = 100,
        interpolationType = "Linear"
    }}
    graph.interpolationType = interpolationType or "Linear"
    graph.flag = flag
    graph.popupOpen = false
    graph.selectedNode = nil
    graph.draggingNode = false
    graph.hoverPos = {
        x = 0,
        y = 0
    }
    graph.showCrosshair = false
    graph.dragOffset = {
        x = 0,
        y = 0
    }
    graph.interpDropdown = nil
    graph.displayWidth = width or 280
    graph.displayHeight = height or 35
    graph.displayOffsetX = 0
    graph.displayOffsetY = 20
    graph.popupWidth = 500
    graph.popupHeight = 300
    graph.popupGraphWidth = 160
    graph.popupGraphHeight = 100
    graph.popupGraphOffsetX = 120
    graph.popupGraphOffsetY = 40
    graph.popupBounds = {
        popup = {
            x = 0,
            y = 0,
            width = 0,
            height = 0
        },
        graph = {
            x = 0,
            y = 0,
            width = 0,
            height = 0
        },
        addButton = {
            x = 0,
            y = 0,
            width = 0,
            height = 0
        },
        removeButton = {
            x = 0,
            y = 0,
            width = 0,
            height = 0
        }
    }
    for i, node in ipairs(graph.nodes) do
        if not node.interpolationType then
            node.interpolationType = interpolationType or "Linear"
        end
    end
    if flag and not Library.Flags[flag] then
        Library.Flags[flag] = graph
    end
    return graph
end
function Graph:IsEffectivelyVisible()
    if not self.visible then
        return false
    end
    local current = self.parent
    while current do
        if not current.visible then
            return false
        end
        current = current.parent
    end
    local x, y = self:GetAbsolutePos()
    local parentBounds = self:GetParentBounds()
    if parentBounds then
        local elementBottom = y + self.height
        local elementRight = x + self.width
        local parentBottom = parentBounds.y + parentBounds.height
        local parentRight = parentBounds.x + parentBounds.width
        if x + self.width < parentBounds.x or x > parentRight or y + self.height < parentBounds.y or y > parentBottom then
            return false
        end
        if elementBottom > parentBottom or elementRight > parentRight then
            return false
        end
    end
    return true
end
function Graph:GetTheme()
    local current = self
    while current and current.parent do
        current = current.parent
        if current and current.theme then
            return current.theme
        end
    end
    return Library.Theme.List[Library.Theme.Selected]
end
function Graph:Set(nodes, interpolationType)
    if type(nodes) == "table" then
        self.nodes = nodes
        for i, node in ipairs(self.nodes) do
            if not node.interpolationType then
                node.interpolationType = interpolationType or "Linear"
            end
        end
    end
    if interpolationType then
        self.interpolationType = interpolationType
    end
    if self.callback then
        self.callback(self.nodes, self.interpolationType)
    end
end
function Graph:WorldToGraph(worldX, worldY, usePopup)
    local graphWidth = usePopup and self.popupGraphWidth or self.displayWidth
    local graphHeight = usePopup and self.popupGraphHeight or self.displayHeight
    local offsetX = usePopup and self.popupGraphOffsetX or self.displayOffsetX
    local offsetY = usePopup and self.popupGraphOffsetY or self.displayOffsetY
    local graphX = ((worldX - offsetX) / graphWidth) * 100
    local graphY = ((worldY - offsetY) / graphHeight) * 100
    graphY = 100 - graphY
    return math.max(0, math.min(100, graphX)), math.max(0, math.min(100, graphY))
end
function Graph:GraphToWorld(graphX, graphY, usePopup)
    local graphWidth = usePopup and self.popupGraphWidth or self.displayWidth
    local graphHeight = usePopup and self.popupGraphHeight or self.displayHeight
    local offsetX = usePopup and self.popupGraphOffsetX or self.displayOffsetX
    local offsetY = usePopup and self.popupGraphOffsetY or self.displayOffsetY
    local worldX = (graphX / 100) * graphWidth + offsetX
    local worldY = ((100 - graphY) / 100) * graphHeight + offsetY
    return worldX, worldY
end
function Graph:GetNodeAt(x, y, usePopup)
    for i, node in ipairs(self.nodes) do
        local nodeX, nodeY = self:GraphToWorld(node.x, node.y, usePopup)
        local distance = math.sqrt((x - nodeX) ^ 2 + (y - nodeY) ^ 2)
        if distance <= 6 then
            return i
        end
    end
    return nil
end
function Graph:InterpolateValue(t)
    if #self.nodes < 2 then
        return 0
    end
    local sortedNodes = {}
    for _, node in ipairs(self.nodes) do
        table.insert(sortedNodes, {
            x = node.x,
            y = node.y,
            interpolationType = node.interpolationType or "Linear"
        })
    end
    table.sort(sortedNodes, function(a, b)
        return a.x < b.x
    end)
    local inputX = t * 100
    for i = 1, #sortedNodes - 1 do
        local node1 = sortedNodes[i]
        local node2 = sortedNodes[i + 1]
        if inputX >= node1.x and inputX <= node2.x then
            local localT = (inputX - node1.x) / (node2.x - node1.x)
            local interpType = node2.interpolationType or "Linear"
            if interpType == "Circular" then
                localT = 0.5 * (1 - math.cos(localT * math.pi))
            elseif interpType == "Cubic" then
                localT = localT * localT * (3 - 2 * localT)
            elseif interpType == "Quadratic" then
                localT = localT * localT
            elseif interpType == "Exponential" then
                localT = localT == 0 and 0 or math.pow(2, 10 * (localT - 1))
            end
            return (node1.y + (node2.y - node1.y) * localT) / 100
        end
    end
    if inputX <= sortedNodes[1].x then
        return sortedNodes[1].y / 100
    else
        return sortedNodes[#sortedNodes].y / 100
    end
end
function Graph:InterpolateValueWithNodes(t, sortedNodes)
    if #sortedNodes < 2 then
        return 0
    end
    local inputX = t * 100
    for i = 1, #sortedNodes - 1 do
        local node1 = sortedNodes[i]
        local node2 = sortedNodes[i + 1]
        if inputX >= node1.x and inputX <= node2.x then
            local localT = (inputX - node1.x) / (node2.x - node1.x)
            local interpType = node2.interpolationType or "Linear"
            if interpType == "Circular" then
                localT = 0.5 * (1 - math.cos(localT * math.pi))
            end
            return (node1.y + (node2.y - node1.y) * localT) / 100
        end
    end
    if inputX <= sortedNodes[1].x then
        return sortedNodes[1].y / 100
    else
        return sortedNodes[#sortedNodes].y / 100
    end
end
function Graph:DrawCurve(x, y, graphWidth, graphHeight, offsetX, offsetY)
    local theme = self:GetTheme()
    if #self.nodes < 2 then
        return
    end
    local sortedNodes = {}
    for _, node in ipairs(self.nodes) do
        table.insert(sortedNodes, {
            x = node.x,
            y = node.y,
            interpolationType = node.interpolationType or "Linear"
        })
    end
    table.sort(sortedNodes, function(a, b)
        return a.x < b.x
    end)
    local lastX, lastY = nil, nil
    for i = 0, graphWidth, 2 do
        local t = i / graphWidth
        local curveY = self:InterpolateValueWithNodes(t, sortedNodes)
        local worldX = x + offsetX + i
        local worldY = y + offsetY + (1 - curveY) * graphHeight
        if lastX and lastY then
            Drawing:Line(lastX, lastY, worldX, worldY, theme.Accent, 2)
        end
        lastX, lastY = worldX, worldY
    end
end
function Graph:GraphToWorldInArea(graphX, graphY, areaWidth, areaHeight, offsetX, offsetY)
    local worldX = (graphX / 100) * areaWidth + offsetX
    local worldY = ((100 - graphY) / 100) * areaHeight + offsetY
    return worldX, worldY
end
function Graph:DrawCurveInArea(x, y, areaWidth, areaHeight, offsetX, offsetY)
    local theme = self:GetTheme()
    if #self.nodes < 2 then
        return
    end
    local lastX, lastY = nil, nil
    for i = 0, areaWidth, 2 do
        local t = i / areaWidth
        local curveY = self:InterpolateValue(t)
        local worldX = x + offsetX + i
        local worldY = y + offsetY + (1 - curveY) * areaHeight
        if lastX and lastY then
            Drawing:Line(lastX, lastY, worldX, worldY, theme.Accent, 2)
        end
        lastX, lastY = worldX, worldY
    end
end
function Graph:Render()
    if not self.visible then
        return
    end
    if self.popupOpen then
        self:RenderPopup()
    end
    if not self:IsEffectivelyVisible() then
        return
    end
    local x, y = self:GetAbsolutePos()
    local theme = self:GetTheme()
    local fadeAlpha = self.fadeAlpha or 1.0
    Drawing:Text(x, y, self.text, 2, true, ApplyFadeAlpha(theme.Text, fadeAlpha))
    local displayX = x + self.displayOffsetX
    local displayY = y + self.displayOffsetY
    Drawing:Rect(displayX, displayY, self.displayWidth, self.displayHeight, ApplyFadeAlpha(theme.Dark, fadeAlpha), true,
        2)
    Drawing:Rect(displayX, displayY, self.displayWidth, self.displayHeight, ApplyFadeAlpha(theme.Outer, fadeAlpha),
        false, 2)
    local innerPadding = 3
    local innerX = displayX + innerPadding
    local innerY = displayY + innerPadding
    local innerWidth = self.displayWidth - (innerPadding * 2)
    local innerHeight = self.displayHeight - (innerPadding * 2)
    for i = 1, 3 do
        local gridX = innerX + (i / 4) * innerWidth
        local gridY = innerY + (i / 4) * innerHeight
        Drawing:Line(gridX, innerY, gridX, innerY + innerHeight, ApplyFadeAlpha(theme.Mid, fadeAlpha), 1)
        Drawing:Line(innerX, gridY, innerX + innerWidth, gridY, ApplyFadeAlpha(theme.Mid, fadeAlpha), 1)
    end
    local mouseX, mouseY = get_cursor_position()
    local isHovering = IsMouseInBounds(displayX, displayY, self.displayWidth, self.displayHeight)
    self:DrawCurveInArea(x, y, innerWidth, innerHeight, self.displayOffsetX + innerPadding,
        self.displayOffsetY + innerPadding)
    if isHovering then
        local relativeX = mouseX - innerX
        local normalizedX = math.max(0, math.min(1, relativeX / innerWidth))
        local curveY = self:InterpolateValue(normalizedX)
        local snapY = innerY + (1 - curveY) * innerHeight
        Drawing:Line(mouseX, innerY, mouseX, innerY + innerHeight, ApplyFadeAlpha(theme.Text, fadeAlpha), 1)
        Drawing:Line(innerX, snapY, innerX + innerWidth, snapY, ApplyFadeAlpha(theme.Text, fadeAlpha), 1)
        local coordX = normalizedX * 100
        local coordY = curveY * 100
        local coordText = string.format("%.1f:%.1f", coordX, coordY)
        Drawing:Text(innerX + 5, innerY + 5, coordText, 1, true, ApplyFadeAlpha(theme.Text, fadeAlpha))
    end
    for i, node in ipairs(self.nodes) do
        local nodeX, nodeY = self:GraphToWorldInArea(node.x, node.y, innerWidth, innerHeight,
            self.displayOffsetX + innerPadding, self.displayOffsetY + innerPadding)
        nodeX = nodeX + x
        nodeY = nodeY + y
        if nodeX >= innerX and nodeX <= innerX + innerWidth and nodeY >= innerY and nodeY <= innerY + innerHeight then
            Drawing:Rect(nodeX - 2, nodeY - 2, 4, 4, ApplyFadeAlpha(theme.Accent, fadeAlpha), true, 1)
        end
    end
    local triangleX = displayX + self.displayWidth - 8
    local triangleY = displayY + 3
    Drawing:Line(triangleX, triangleY, triangleX + 5, triangleY, ApplyFadeAlpha(theme.Text, fadeAlpha), 1)
    Drawing:Line(triangleX + 5, triangleY, triangleX + 5, triangleY + 5, ApplyFadeAlpha(theme.Text, fadeAlpha), 1)
    Drawing:Line(triangleX + 5, triangleY + 5, triangleX, triangleY, ApplyFadeAlpha(theme.Text, fadeAlpha), 1)
    self.clickArea = {
        x = displayX,
        y = displayY,
        width = self.displayWidth,
        height = self.displayHeight
    }
end
function Graph:RenderPopup()
    if not self.popupOpen then
        return
    end
    local x, y = self:GetAbsolutePos()
    local theme = self:GetTheme()
    local popupWidth = 500
    local popupHeight = 280
    local popupX = x - 50
    local popupY = y - popupHeight - 10
    local screenWidth, screenHeight = get_window_size()
    if popupX < 10 then
        popupX = x + self.width + 5
    end
    if popupY < 10 then
        popupY = y + self.height + 5
    end
    if popupX + popupWidth > screenWidth - 10 then
        popupX = screenWidth - popupWidth - 10
    end
    if popupY + popupHeight > screenHeight - 10 then
        popupY = screenHeight - popupHeight - 10
    end
    ZIndexCounter = ZIndexCounter + 1000
    self.zIndex = ZIndexCounter
    Drawing:Rect(popupX, popupY, popupWidth, popupHeight, theme.Dark, true, 4)
    Drawing:Rect(popupX, popupY, popupWidth, popupHeight, theme.Accent, false, 4)
    Drawing:Text(popupX + 10, popupY + 5, self.text .. " Editor", 2, true, theme.Header)
    local graphWidth = popupWidth - 4
    local graphHeight = 180
    local graphX = popupX + 2
    local graphY = popupY + 40
    Drawing:Rect(graphX, graphY, graphWidth, graphHeight, theme.High, true, 2)
    Drawing:Rect(graphX, graphY, graphWidth, graphHeight, theme.Outer, false, 2)
    local innerPadding = 4
    local innerGraphX = graphX + innerPadding
    local innerGraphY = graphY + innerPadding
    local innerGraphWidth = graphWidth - (innerPadding * 2)
    local innerGraphHeight = graphHeight - (innerPadding * 2)
    for i = 0, 4 do
        local gridX = innerGraphX + (i / 4) * innerGraphWidth
        local gridY = innerGraphY + (i / 4) * innerGraphHeight
        Drawing:Line(gridX, innerGraphY, gridX, innerGraphY + innerGraphHeight, theme.Mid, 1)
        Drawing:Line(innerGraphX, gridY, innerGraphX + innerGraphWidth, gridY, theme.Mid, 1)
    end
    Drawing:Text(innerGraphX + 5, innerGraphY + innerGraphHeight - 15, "0", 1, true, theme.Secondary)
    Drawing:Text(innerGraphX + innerGraphWidth - 15, innerGraphY + innerGraphHeight - 15, "100", 1, true,
        theme.Secondary)
    Drawing:Text(innerGraphX + 5, innerGraphY + innerGraphHeight - 5, "0", 1, true, theme.Secondary)
    Drawing:Text(innerGraphX + 5, innerGraphY + 5, "100", 1, true, theme.Secondary)
    self:DrawCurveInPopup(popupX, popupY, innerGraphWidth, innerGraphHeight, 2 + innerPadding, 40 + innerPadding)
    for i, node in ipairs(self.nodes) do
        local nodeX, nodeY = self:GraphToWorldInPopup(node.x, node.y, innerGraphWidth, innerGraphHeight,
            2 + innerPadding, 40 + innerPadding)
        nodeX = nodeX + popupX
        nodeY = nodeY + popupY
        if nodeX >= innerGraphX and nodeX <= innerGraphX + innerGraphWidth and nodeY >= innerGraphY and nodeY <=
            innerGraphY + innerGraphHeight then
            local nodeColor = theme.Accent
            if self.selectedNode == i then
                nodeColor = theme.Warning
            end
            Drawing:Rect(nodeX - 4, nodeY - 4, 8, 8, nodeColor, true, 1)
            Drawing:Rect(nodeX - 4, nodeY - 4, 8, 8, theme.Text, false, 1)
        end
    end
    if self.showCrosshair then
        local crossX = popupX + self.hoverPos.x
        local crossY = popupY + self.hoverPos.y
        if crossX >= innerGraphX and crossX <= innerGraphX + innerGraphWidth and crossY >= innerGraphY and crossY <=
            innerGraphY + innerGraphHeight then
            local relativeX = (crossX - innerGraphX) / innerGraphWidth
            local curveY = self:InterpolateValue(relativeX)
            local snapY = innerGraphY + (1 - curveY) * innerGraphHeight
            Drawing:Line(crossX, innerGraphY, crossX, innerGraphY + innerGraphHeight, theme.Text, 1)
            Drawing:Line(innerGraphX, snapY, innerGraphX + innerGraphWidth, snapY, theme.Text, 1)
            local coordX = relativeX * 100
            local coordY = curveY * 100
            local coordText = string.format("%.1f:%.1f", coordX, coordY)
            Drawing:Text(innerGraphX + 5, innerGraphY + 5, coordText, 1, true, theme.Text)
        end
    end
    local controlY = popupY + popupHeight - 60
    local buttonWidth = 60
    local buttonHeight = 25
    local buttonSpacing = 10
    local addButtonX = popupX + 10
    local addButtonY = controlY + 15
    Drawing:Rect(addButtonX, addButtonY, buttonWidth, buttonHeight, theme.Mid, true, 2)
    Drawing:Rect(addButtonX, addButtonY, buttonWidth, buttonHeight, theme.Outer, false, 2)
    local addTextWidth, addTextHeight = render.measure_text(2, true, "Add")
    Drawing:Text(addButtonX + (buttonWidth - addTextWidth) / 2, addButtonY + (buttonHeight - addTextHeight) / 2, "Add",
        2, true, theme.Text)
    local removeButtonX = addButtonX + buttonWidth + buttonSpacing
    local removeButtonY = addButtonY
    Drawing:Rect(removeButtonX, removeButtonY, buttonWidth, buttonHeight, theme.Mid, true, 2)
    Drawing:Rect(removeButtonX, removeButtonY, buttonWidth, buttonHeight, theme.Outer, false, 2)
    local removeTextWidth, removeTextHeight = render.measure_text(2, true, "Remove")
    Drawing:Text(removeButtonX + (buttonWidth - removeTextWidth) / 2,
        removeButtonY + (buttonHeight - removeTextHeight) / 2, "Remove", 2, true, theme.Text)
    self.popupBounds = {
        popup = {
            x = popupX,
            y = popupY,
            width = popupWidth,
            height = popupHeight
        },
        graph = {
            x = innerGraphX,
            y = innerGraphY,
            width = innerGraphWidth,
            height = innerGraphHeight
        },
        addButton = {
            x = addButtonX,
            y = addButtonY,
            width = buttonWidth,
            height = buttonHeight
        },
        removeButton = {
            x = removeButtonX,
            y = removeButtonY,
            width = buttonWidth,
            height = buttonHeight
        }
    }
    if self.selectedNode and self.nodes[self.selectedNode] then
        if not self.interpDropdown then
            self.interpDropdown = Dropdown:new("", {"Linear", "Circular", "Cubic", "Quadratic", "Exponential"},
                function(selected)
                    if self.selectedNode and self.nodes[self.selectedNode] then
                        self.nodes[self.selectedNode].interpolationType = selected
                        if self.callback then
                            self.callback(self.nodes, self.interpolationType)
                        end
                    end
                end, self.nodes[self.selectedNode].interpolationType or "Linear")
            self.interpDropdown.parent = self
            self.interpDropdown.width = 100
            self.interpDropdown.height = 45
            self.interpDropdown.maxVisible = 5
        end
        local baseZ = self.baseZIndex or self.zIndex or ZIndexCounter
        self.interpDropdown.zIndex = baseZ + 10
        local dropdownX = removeButtonX + buttonWidth + buttonSpacing
        local dropdownY = removeButtonY
        self.interpDropdown.popupX = dropdownX
        self.interpDropdown.popupY = dropdownY
        self.interpDropdown.x = dropdownX - popupX
        self.interpDropdown.y = dropdownY - popupY
        self.interpDropdown.value = self.nodes[self.selectedNode].interpolationType or "Linear"
        local originalGetAbsolutePos = self.interpDropdown.GetAbsolutePos
        self.interpDropdown.GetAbsolutePos = function()
            return dropdownX, dropdownY
        end
        self.interpDropdown:Render()
        if self.interpDropdown.open then
            self.interpDropdown:RenderPopup()
        end
        self.interpDropdown.GetAbsolutePos = originalGetAbsolutePos
    end
end
function Graph:GraphToWorldInPopup(graphX, graphY, areaWidth, areaHeight, offsetX, offsetY)
    local worldX = (graphX / 100) * areaWidth + offsetX
    local worldY = ((100 - graphY) / 100) * areaHeight + offsetY
    return worldX, worldY
end
function Graph:WorldToGraphInPopup(worldX, worldY, areaWidth, areaHeight, offsetX, offsetY)
    local graphX = ((worldX - offsetX) / areaWidth) * 100
    local graphY = ((worldY - offsetY) / areaHeight) * 100
    graphY = 100 - graphY
    return math.max(0, math.min(100, graphX)), math.max(0, math.min(100, graphY))
end
function Graph:DrawCurveInPopup(x, y, areaWidth, areaHeight, offsetX, offsetY)
    local theme = self:GetTheme()
    if #self.nodes < 2 then
        return
    end
    local lastX, lastY = nil, nil
    for i = 0, areaWidth, 2 do
        local t = i / areaWidth
        local curveY = self:InterpolateValue(t)
        local worldX = x + offsetX + i
        local worldY = y + offsetY + (1 - curveY) * areaHeight
        if lastX and lastY then
            Drawing:Line(lastX, lastY, worldX, worldY, theme.Accent, 2)
        end
        lastX, lastY = worldX, worldY
    end
end
function Graph:GetNodeAtInPopup(x, y, areaWidth, areaHeight, offsetX, offsetY)
    for i, node in ipairs(self.nodes) do
        local nodeX, nodeY = self:GraphToWorldInPopup(node.x, node.y, areaWidth, areaHeight, offsetX, offsetY)
        local distance = math.sqrt((x - nodeX) ^ 2 + (y - nodeY) ^ 2)
        if distance <= 6 then
            return i
        end
    end
    return nil
end
function Graph:HandleInput()
    if not self.visible or not self.enabled then
        return
    end
    if self.popupOpen then
        if not self:IsEffectivelyVisible() then
            self.popupOpen = false
            self.selectedNode = nil
            self.showCrosshair = false
            UnregisterPopup(self)
            return
        end
        local mouseX, mouseY = get_cursor_position()
        if not self.popupBounds then
            return
        end
        local popupBounds = self.popupBounds.popup
        local graphBounds = self.popupBounds.graph
        if IsMouseInBounds(graphBounds.x, graphBounds.y, graphBounds.width, graphBounds.height) then
            self.hoverPos.x = mouseX - popupBounds.x
            self.hoverPos.y = mouseY - popupBounds.y
            self.showCrosshair = true
        else
            self.showCrosshair = false
        end
        if self.interpDropdown then
            local dropdownX = self.interpDropdown.popupX or 0
            local dropdownY = self.interpDropdown.popupY or 0
            local dropdownWidth = self.interpDropdown.width or 100
            local dropdownHeight = self.interpDropdown.height or 25
            local originalGetAbsolutePos = self.interpDropdown.GetAbsolutePos
            self.interpDropdown.GetAbsolutePos = function()
                return dropdownX, dropdownY
            end
            if self.interpDropdown.open then
                self.interpDropdown:HandleInput()
                self.interpDropdown.GetAbsolutePos = originalGetAbsolutePos
                if InputState.clickConsumed then
                    return
                end
            else
                if InputState.mouseClicked and IsMouseInBounds(dropdownX, dropdownY, dropdownWidth, dropdownHeight) then
                    InputState.clickConsumed = true
                    self.interpDropdown.open = true
                    Library.OpenDropdown = self.interpDropdown
                    self.interpDropdown.GetAbsolutePos = originalGetAbsolutePos
                    return
                end
                self.interpDropdown.GetAbsolutePos = originalGetAbsolutePos
            end
        end
        if InputState.mouseClicked and not InputState.clickConsumed then
            local clickHandled = false
            if IsMouseInBounds(self.popupBounds.addButton.x, self.popupBounds.addButton.y,
                self.popupBounds.addButton.width, self.popupBounds.addButton.height) then
                local centerX = graphBounds.x + graphBounds.width / 2
                local centerY = graphBounds.y + graphBounds.height / 2
                local relativeX = (centerX - graphBounds.x) / graphBounds.width
                local relativeY = (centerY - graphBounds.y) / graphBounds.height
                local newX = relativeX * 100
                local newY = (1 - relativeY) * 100
                table.insert(self.nodes, {
                    x = newX,
                    y = newY,
                    interpolationType = "Linear"
                })
                table.sort(self.nodes, function(a, b)
                    return a.x < b.x
                end)
                if self.callback then
                    self.callback(self.nodes, self.interpolationType)
                end
                clickHandled = true
                ConsumeClick()
            elseif IsMouseInBounds(self.popupBounds.removeButton.x, self.popupBounds.removeButton.y,
                self.popupBounds.removeButton.width, self.popupBounds.removeButton.height) then
                if self.selectedNode and #self.nodes > 2 then
                    table.remove(self.nodes, self.selectedNode)
                    self.selectedNode = nil
                    if self.callback then
                        self.callback(self.nodes, self.interpolationType)
                    end
                end
                clickHandled = true
                ConsumeClick()
            elseif IsMouseInBounds(graphBounds.x, graphBounds.y, graphBounds.width, graphBounds.height) then
                local relativeX = mouseX - graphBounds.x
                local relativeY = mouseY - graphBounds.y
                local bestNode = nil
                local bestDistance = math.huge
                for i, node in ipairs(self.nodes) do
                    local nodeX, nodeY = self:GraphToWorldInPopup(node.x, node.y, graphBounds.width, graphBounds.height,
                        0, 0)
                    local distance = math.sqrt((relativeX - nodeX) ^ 2 + (relativeY - nodeY) ^ 2)
                    if distance <= 8 and distance < bestDistance then
                        bestNode = i
                        bestDistance = distance
                    end
                end
                if bestNode then
                    self.selectedNode = bestNode
                    self.draggingNode = true
                    local nodeX, nodeY = self:GraphToWorldInPopup(self.nodes[bestNode].x, self.nodes[bestNode].y,
                        graphBounds.width, graphBounds.height, 0, 0)
                    self.dragOffset.x = relativeX - nodeX
                    self.dragOffset.y = relativeY - nodeY
                else
                    self.selectedNode = nil
                end
                clickHandled = true
                ConsumeClick()
            end
            if not clickHandled then
                local clickInsideExtendedBounds = false
                if IsMouseInBounds(popupBounds.x, popupBounds.y, popupBounds.width, popupBounds.height) then
                    clickInsideExtendedBounds = true
                end
                if self.interpDropdown then
                    local dropdownX = self.interpDropdown.popupX or 0
                    local dropdownY = self.interpDropdown.popupY or 0
                    local dropdownWidth = self.interpDropdown.width or 100
                    local dropdownHeight = self.interpDropdown.height or 25
                    if IsMouseInBounds(dropdownX, dropdownY, dropdownWidth, dropdownHeight) then
                        clickInsideExtendedBounds = true
                    end
                    if self.interpDropdown.open then
                        local visibleOptions = math.min(#self.interpDropdown.options,
                            self.interpDropdown.maxVisible or 5)
                        local popupHeight = visibleOptions * (self.interpDropdown.optionHeight or 22)
                        local popupY = dropdownY + dropdownHeight
                        local screenWidth, screenHeight = get_window_size()
                        if popupY + popupHeight > screenHeight - 20 then
                            popupY = dropdownY - popupHeight
                        end
                        if IsMouseInBounds(dropdownX, popupY, dropdownWidth, popupHeight) then
                            clickInsideExtendedBounds = true
                        end
                    end
                end
                if not clickInsideExtendedBounds then
                    self.popupOpen = false
                    self.selectedNode = nil
                    self.showCrosshair = false
                    if self.interpDropdown then
                        self.interpDropdown.open = false
                    end
                    UnregisterPopup(self)
                    ConsumeClick()
                    return
                end
            end
        end
        if self.draggingNode and InputState.mousePressed and self.selectedNode then
            local relativeX = mouseX - graphBounds.x - self.dragOffset.x
            local relativeY = mouseY - graphBounds.y - self.dragOffset.y
            local graphCoordX, graphCoordY = self:WorldToGraphInPopup(relativeX, relativeY, graphBounds.width,
                graphBounds.height, 0, 0)
            self.nodes[self.selectedNode].x = graphCoordX
            self.nodes[self.selectedNode].y = graphCoordY
            if self.callback then
                self.callback(self.nodes, self.interpolationType)
            end
        elseif not InputState.mousePressed then
            self.draggingNode = false
        end
        return
    end
    if IsElementBehindPopup(self) then
        return
    end
    if not self:IsInActiveTab() then
        return
    end
    if not self:CanInteract() then
        return
    end
    Element.HandleInput(self)
    if InputState.mouseClicked and not InputState.clickConsumed and self.clickArea then
        if IsMouseInBounds(self.clickArea.x, self.clickArea.y, self.clickArea.width, self.clickArea.height) then
            self.popupOpen = true
            self.selectedNode = nil
            RegisterPopup(self)
            BringToFront(self)
            self:RegisterInteraction()
            ConsumeClick()
        end
    end
end
function Section:AddGraph(text, callback, defaultNodes, interpolationType, flag)
    local graph = Graph:new(text, callback, defaultNodes, interpolationType, flag)
    return self:AddElement(graph)
end
function MultiSection:AddGraph(text, callback, defaultNodes, interpolationType, flag, pageIndex)
    local graph = Graph:new(text, callback, defaultNodes, interpolationType, flag)
    return self:AddElement(graph, pageIndex)
end
function Dropdown:new(text, options, callback, defaultValue, flag)
    local dropdown = Element.new(self, 0, 0, 100, 45)
    dropdown.text = text or "Dropdown"
    dropdown.options = options or {}
    dropdown.callback = callback or function()
    end
    dropdown.value = defaultValue or (options and options[1]) or nil
    dropdown.open = false
    dropdown.optionHeight = 22
    dropdown.maxVisible = 8
    dropdown.scrollOffset = 0
    dropdown.scrollbarDragging = false
    dropdown.scrollbarDragOffset = 0
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
    if not self.visible then
        return
    end
    local x, y = self:GetAbsolutePos()
    local theme = self:GetTheme()
    local fadeAlpha = self.fadeAlpha or 1.0
    local offset_y, takeoff, t_offset, a_offset = 15, 20, 18, 5
    if #self.text < 1 then
        offset_y = 0
        t_offset = 5
        takeoff = 20
        a_offset = -10
    end
    if self.text then
        Drawing:Text(x, y - 5, self.text, 2, true, ApplyFadeAlpha(theme.Text, fadeAlpha))
    end
    local bgColor1, bgColor2
    if self.open then
        bgColor1 = theme.Light
        bgColor2 = theme.Accent
    else
        bgColor1 = theme.Mid
        bgColor2 = theme.Light
    end
    Drawing:Gradient(x, y + offset_y, self.width, self.height - takeoff, ApplyFadeAlpha(bgColor1, fadeAlpha),
        ApplyFadeAlpha(bgColor2, fadeAlpha), true)
    Drawing:Rect(x, y + offset_y, self.width, self.height - takeoff, ApplyFadeAlpha(theme.Outer, fadeAlpha), false, 2)
    local displayText = self.value or "Select..."
    Drawing:Text(x + 5, y + t_offset, displayText, 2, true, ApplyFadeAlpha(theme.Text, fadeAlpha))
    local arrowSize = 6
    local arrowX = x + self.width - 15
    local arrowY = y + (self.height - arrowSize) / 2 + a_offset
    Drawing:Line(arrowX, arrowY, arrowX + arrowSize, arrowY, ApplyFadeAlpha(theme.Text, fadeAlpha), 1)
    Drawing:Line(arrowX + arrowSize, arrowY, arrowX + arrowSize / 2, arrowY + arrowSize,
        ApplyFadeAlpha(theme.Text, fadeAlpha), 1)
end
function Dropdown:RenderPopup()
    if not self.open then
        return
    end
    local x, y = self:GetAbsolutePos()
    local theme = self:GetTheme()
    local visibleOptions = math.min(#self.options, self.maxVisible)
    local popupHeight = visibleOptions * self.optionHeight
    local popupY = y + self.height
    local screenWidth, screenHeight = get_window_size()

    -- Allow dropdown popups to leak out of window bounds rather than constraining to parent
    -- Only constrain to screen boundaries as fallback

    local isGraphDropdown = self.parent and self.parent.__index == Graph
    local drawZIndex = self.zIndex or 0
    if isGraphDropdown then
        drawZIndex = (self.parent.baseZIndex or self.parent.zIndex or 0) + 20
        popupY = popupY - 20
    end
    ZIndexCounter = math.max(ZIndexCounter, drawZIndex + 1)
    local fadeAlpha = self.fadeAlpha or 1.0
    Drawing:Rect(x - 1, popupY - 1, self.width + 2, popupHeight + 2, ApplyFadeAlpha(theme.Accent, fadeAlpha), false, 2)
    Drawing:Rect(x, popupY, self.width, popupHeight, ApplyFadeAlpha(theme.Dark, fadeAlpha), true, 2)
    Drawing:Rect(x, popupY, self.width, popupHeight, ApplyFadeAlpha(theme.Outer, fadeAlpha), false, 2)
    for i = 1, visibleOptions do
        local optionIndex = i + (self.scrollOffset or 0)
        local option = self.options[optionIndex]
        if option then
            local optionY = popupY + (i - 1) * self.optionHeight
            local isHovered = IsMouseInBounds(x, optionY, self.width, self.optionHeight)
            local bgColor = isHovered and theme.Mid or theme.Dark
            Drawing:Rect(x, optionY, self.width, self.optionHeight, ApplyFadeAlpha(bgColor, fadeAlpha), true, 0)
            local textColor = theme.Text
            Drawing:Text(x + 5, optionY + 3, option, 2, true, ApplyFadeAlpha(textColor, fadeAlpha))
        end
    end
    if #self.options > self.maxVisible then
        local scrollbarX = x + self.width - 8
        local scrollbarY = popupY
        local scrollbarHeight = popupHeight
        Drawing:Rect(scrollbarX, scrollbarY, 6, scrollbarHeight, ApplyFadeAlpha(theme.Mid, fadeAlpha), true, 0)
        local thumbHeight = math.max(20, scrollbarHeight * (self.maxVisible / #self.options))
        local maxScroll = #self.options - self.maxVisible
        local thumbY = scrollbarY + (scrollbarHeight - thumbHeight) * (self.scrollOffset / maxScroll)
        Drawing:Rect(scrollbarX, thumbY, 6, thumbHeight, ApplyFadeAlpha(theme.Accent, fadeAlpha), true, 0)
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
function Dropdown:HandleInput()
    if not self.visible or not self.enabled then
        return
    end
    local isGraphDropdown = self.parent and self.parent.__index == Graph
    if not isGraphDropdown and IsElementBehindPopup(self) and not self.open then
        return
    end
    if not isGraphDropdown and not self:IsInActiveTab() and not self.open then
        return
    end

    if not self:CanInteract() then
        return
    end

    Element.HandleInput(self)
    if self.clicked and not InputState.scrollbarActive then
        self.open = not self.open
        if self.open then
            Library.OpenDropdown = self
            if not isGraphDropdown then
                RegisterPopup(self)
            end
            BringToFront(self)
        else
            Library.OpenDropdown = nil
            if not isGraphDropdown then
                UnregisterPopup(self)
            end
        end
        self:RegisterInteraction()
        ConsumeClick()
    end
    if self.open and InputState.mouseClicked and not InputState.clickConsumed then
        if self.scrollbarBounds and #self.options > (self.maxVisible or 8) then
            local mouseX, mouseY = get_cursor_position()
            if IsMouseInBounds(self.scrollbarBounds.x, self.scrollbarBounds.thumbY, self.scrollbarBounds.width,
                self.scrollbarBounds.thumbHeight) then
                self.scrollbarDragging = true
                self.scrollbarDragOffset = mouseY - self.scrollbarBounds.thumbY
                InputState.scrollbarActive = true
                ConsumeClick()
                return
            end
        end
        local x, y = self:GetAbsolutePos()
        local visibleOptions = math.min(#self.options, self.maxVisible or 8)
        local popupHeight = visibleOptions * self.optionHeight
        local popupY = y + self.height

        -- Apply the same offset as in RenderPopup for graph dropdowns
        if isGraphDropdown then
            popupY = popupY - 20
        end

        local screenWidth, screenHeight = get_window_size()
        if popupY + popupHeight > screenHeight - 20 then
            popupY = y - popupHeight - 5
            if isGraphDropdown then
                popupY = popupY - 20
            end
            if popupY < 20 then
                popupY = math.max(20, screenHeight - popupHeight - 20)
            end
        end
        if x + self.width > screenWidth - 20 then
            x = screenWidth - self.width - 20
        end
        if x < 20 then
            x = 20
        end
        for i = 1, visibleOptions do
            local optionIndex = i + (self.scrollOffset or 0)
            local option = self.options[optionIndex]
            if option then
                local optionY = popupY + (i - 1) * self.optionHeight
                if IsMouseInBounds(x, optionY, self.width, self.optionHeight) then
                    self.value = option
                    self.open = false
                    Library.OpenDropdown = nil
                    if not isGraphDropdown then
                        UnregisterPopup(self)
                    end
                    if self.callback then
                        self.callback(option)
                    end
                    self:RegisterInteraction()
                    ConsumeClick()
                    return
                end
            end
        end
        if not IsMouseInBounds(x, popupY, self.width, popupHeight) and
            not IsMouseInBounds(x, y, self.width, self.height) then
            self.open = false
            Library.OpenDropdown = nil
            if not isGraphDropdown then
                UnregisterPopup(self)
            end
        end
    end
    if self.scrollbarDragging and InputState.mousePressed then
        if self.scrollbarBounds and (self.maxVisible or 8) < #self.options then
            local mouseX, mouseY = get_cursor_position()
            local newThumbY = mouseY - self.scrollbarDragOffset
            local minThumbY = self.scrollbarBounds.y
            local maxThumbY = self.scrollbarBounds.y + self.scrollbarBounds.height - self.scrollbarBounds.thumbHeight
            newThumbY = math.max(minThumbY, math.min(maxThumbY, newThumbY))
            local thumbProgress = (newThumbY - minThumbY) / (maxThumbY - minThumbY)
            self.scrollOffset = math.floor(thumbProgress * (#self.options - (self.maxVisible or 8)))
            self.scrollOffset = math.max(0, math.min(#self.options - (self.maxVisible or 8), self.scrollOffset))
        end
    elseif not InputState.mousePressed then
        self.scrollbarDragging = false
    end
end
function MultiSelectDropdown:new(text, options, callback, defaultSelected, flag)
    local dropdown = Element.new(self, 0, 0, 100, 45)
    dropdown.text = text or "Multi-Select"
    dropdown.options = options or {}
    dropdown.callback = callback or function()
    end
    dropdown.selectedOptions = {}
    dropdown.open = false
    dropdown.optionHeight = 22
    dropdown.maxVisible = 8
    dropdown.scrollOffset = 0
    dropdown.flag = flag
    dropdown.selectAllMode = false
    dropdown.scrollbarDragging = false
    dropdown.scrollbarDragOffset = 0
    if not dropdown.options then
        dropdown.options = {}
    end
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
    for _, option in pairs(self.options) do
        self.selectedOptions[option] = true
    end
    if self.callback then
        self.callback(self:GetSelected())
    end
end
function MultiSelectDropdown:DeselectAll()
    for option, isSelected in pairs(self.selectedOptions) do
        self.selectedOptions[option] = false
    end
    if self.callback then
        self.callback(self:GetSelected())
    end
end
function MultiSelectDropdown:Render()
    if not self.visible then
        return
    end
    local x, y = self:GetAbsolutePos()
    local theme = self:GetTheme()
    local fadeAlpha = self.fadeAlpha or 1.0
    if self.text then
        Drawing:Text(x, y - 2, self.text, 2, true, ApplyFadeAlpha(theme.Text, fadeAlpha))
    end
    local bgColor1, bgColor2
    if self.open then
        bgColor1 = theme.Light
        bgColor2 = theme.Accent
    else
        bgColor1 = theme.Mid
        bgColor2 = theme.Light
    end
    Drawing:Gradient(x, y + 15, self.width, self.height - 20, ApplyFadeAlpha(bgColor1, fadeAlpha),
        ApplyFadeAlpha(bgColor2, fadeAlpha), true)
    Drawing:Rect(x, y + 15, self.width, self.height - 20, ApplyFadeAlpha(theme.Outer, fadeAlpha), false, 2)
    local selectedCount = self:GetSelectedCount()
    local displayText
    if selectedCount == 0 then
        displayText = "None selected"
    elseif selectedCount == 1 then
        for option, isSelected in pairs(self.selectedOptions) do
            if isSelected then
                displayText = option
                break
            end
        end
    else
        displayText = selectedCount .. " selected"
    end
    local availableWidth = self.width - 25
    local textWidth = render.measure_text(2, true, displayText)
    if textWidth > availableWidth then
        local charWidth = textWidth / #displayText
        local maxChars = math.floor(availableWidth / charWidth) - 3
        if maxChars > 0 then
            displayText = string.sub(displayText, 1, maxChars) .. "..."
        end
    end
    Drawing:Text(x + 5, y + 20, displayText, 2, true, ApplyFadeAlpha(theme.Text, fadeAlpha))
    local arrowSize = 6
    local arrowX = x + self.width - 15
    local arrowY = y + (self.height - arrowSize) / 2 + 5
    if self.open then
        Drawing:Line(arrowX, arrowY + arrowSize, arrowX + arrowSize, arrowY + arrowSize,
            ApplyFadeAlpha(theme.Text, fadeAlpha), 1)
        Drawing:Line(arrowX + arrowSize, arrowY + arrowSize, arrowX + arrowSize / 2, arrowY,
            ApplyFadeAlpha(theme.Text, fadeAlpha), 1)
    else
        Drawing:Line(arrowX, arrowY, arrowX + arrowSize, arrowY, ApplyFadeAlpha(theme.Text, fadeAlpha), 1)
        Drawing:Line(arrowX + arrowSize, arrowY, arrowX + arrowSize / 2, arrowY + arrowSize,
            ApplyFadeAlpha(theme.Text, fadeAlpha), 1)
    end
end

function MultiSelectDropdown:RenderPopup()
    if not self.open then
        return
    end
    local x, y = self:GetAbsolutePos()
    local theme = self:GetTheme()
    local fadeAlpha = self.fadeAlpha or 1.0
    local visibleOptions = math.min(#self.options + 1, self.maxVisible + 1)
    local popupHeight = visibleOptions * self.optionHeight
    local popupY = y + self.height
    local screenWidth, screenHeight = get_window_size()

    Drawing:Rect(x, popupY, self.width, popupHeight, ApplyFadeAlpha(theme.Dark, fadeAlpha), true, 2)
    Drawing:Rect(x, popupY, self.width, popupHeight, ApplyFadeAlpha(theme.Outer, fadeAlpha), false, 2)
    Drawing:Rect(x - 1, popupY - 1, self.width + 2, popupHeight + 2, ApplyFadeAlpha(theme.Accent, fadeAlpha), false, 2)
    local currentY = popupY
    local selectAllText = self.selectAllMode and "Deselect All" or "Select All"
    -- Calculate clickable width for Select All hover detection (exclude scrollbar if present)
    local selectAllHoverWidth = self.width
    if #self.options > self.maxVisible then
        selectAllHoverWidth = self.width - 8 -- Exclude scrollbar area
    end
    local selectAllHovered = IsMouseInBounds(x, currentY, selectAllHoverWidth, self.optionHeight)
    local selectAllBg = selectAllHovered and theme.Mid or theme.Dark
    Drawing:Rect(x, currentY, self.width, self.optionHeight, ApplyFadeAlpha(selectAllBg, fadeAlpha), true, 0)
    Drawing:Text(x + 5, currentY + 4, selectAllText, 2, true, ApplyFadeAlpha(theme.Accent, fadeAlpha))
    Drawing:Line(x + 2, currentY + self.optionHeight, x + self.width - 2, currentY + self.optionHeight,
        ApplyFadeAlpha(theme.Outer, fadeAlpha), 1)
    currentY = currentY + self.optionHeight
    -- Calculate clickable width for Select All (exclude scrollbar if present)
    local selectAllClickWidth = self.width
    if #self.options > self.maxVisible then
        selectAllClickWidth = self.width - 8 -- Exclude scrollbar area to match option click areas
    end
    self.selectAllBounds = {
        x = x,
        y = popupY,
        width = selectAllClickWidth,
        height = self.optionHeight
    }
    self.optionBounds = {}
    local maxOptionsToShow = math.min(#self.options, self.maxVisible)
    for i = 1, maxOptionsToShow do
        local optionIndex = i + (self.scrollOffset or 0)
        local option = self.options[optionIndex]
        if option then
            local isSelected = self:IsSelected(option)
            -- Calculate clickable width (exclude scrollbar if present)
            local optionClickWidth = self.width
            if #self.options > self.maxVisible then
                optionClickWidth = self.width - 8 -- Exclude scrollbar area (8 pixels from right + 6 width = 14 total, but we use 8 to be safe)
            end
            local optionHovered = IsMouseInBounds(x, currentY, optionClickWidth, self.optionHeight)
            local optionBg = theme.Dark
            if optionHovered then
                optionBg = theme.Mid
            end
            Drawing:Rect(x, currentY, self.width, self.optionHeight, ApplyFadeAlpha(optionBg, fadeAlpha), true, 0)
            local checkboxSize = 13
            local checkboxX = x + 5
            local checkboxY = currentY + (self.optionHeight - checkboxSize) / 2
            Drawing:Rect(checkboxX, checkboxY, checkboxSize, checkboxSize, ApplyFadeAlpha(theme.Outer, fadeAlpha),
                false, 1)
            Drawing:Rect(checkboxX + 1, checkboxY + 1, checkboxSize - 2, checkboxSize - 2,
                ApplyFadeAlpha(theme.High, fadeAlpha), true, 0)
            if isSelected then
                Drawing:Rect(checkboxX + 3, checkboxY + 3, checkboxSize - 6, checkboxSize - 6,
                    ApplyFadeAlpha(theme.Accent, fadeAlpha), true, 0)
            end
            local textColor = isSelected and theme.Accent or theme.Text
            Drawing:Text(checkboxX + checkboxSize + 8, currentY + 4, option, 2, true,
                ApplyFadeAlpha(textColor, fadeAlpha))
            table.insert(self.optionBounds, {
                x = x,
                y = currentY,
                width = optionClickWidth, -- Use consistent clickable width
                height = self.optionHeight,
                option = option,
                index = optionIndex
            })
            currentY = currentY + self.optionHeight
        end

    end
    if #self.options > self.maxVisible then
        local scrollbarX = x + self.width - 8
        local scrollbarY = popupY + self.optionHeight
        local scrollbarHeight = self.maxVisible * self.optionHeight
        local thumbHeight = math.max(20, scrollbarHeight * (self.maxVisible / #self.options))
        local maxScroll = #self.options - self.maxVisible
        local thumbY = scrollbarY + (scrollbarHeight - thumbHeight) * (self.scrollOffset / maxScroll)
        Drawing:Rect(scrollbarX, thumbY, 6, thumbHeight, ApplyFadeAlpha(theme.Accent, fadeAlpha), true, 0)
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

function MultiSelectDropdown:HandleInput()
    if not self.visible or not self.enabled then
        return
    end
    if IsElementBehindPopup(self) and not self.open then
        return
    end
    if not self:IsInActiveTab() and not self.open then
        return
    end
    if not self:CanInteract() then
        return
    end
    Element.HandleInput(self)
    if self.clicked then
        self.open = not self.open
        if self.open then
            Library.OpenDropdown = self
            RegisterPopup(self)
            BringToFront(self)
        else
            Library.OpenDropdown = nil
            UnregisterPopup(self)
        end
        self:RegisterInteraction()
        ConsumeClick()
        return
    end
    if not self.open then
        return
    end
    if InputState.mouseClicked and not InputState.clickConsumed then
        local mouseX, mouseY = get_cursor_position()
        local x, y = self:GetAbsolutePos()
        local popupY = y + self.height

        -- Handle scrollbar first (exclude scrollbar area from option clicks)
        if self.scrollbarBounds and #self.options > self.maxVisible then
            if IsMouseInBounds(self.scrollbarBounds.x, self.scrollbarBounds.thumbY, self.scrollbarBounds.width,
                self.scrollbarBounds.thumbHeight) then
                self.scrollbarDragging = true
                self.scrollbarDragOffset = mouseY - self.scrollbarBounds.thumbY
                InputState.scrollbarActive = true
                ConsumeClick()
                return
            end
        end

        -- Calculate click area width (exclude scrollbar if present)
        local clickWidth = self.width
        if #self.options > self.maxVisible then
            clickWidth = self.width - 8 -- Exclude scrollbar area (8 pixels from right + 6 width, use 8 to be safe)
        end
        -- Handle "Select All" button click
        if IsMouseInBounds(x, popupY, clickWidth, self.optionHeight) then
            if self.selectAllMode then
                self:DeselectAll()
                self.selectAllMode = false
            else
                self:SelectAll()
                self.selectAllMode = true
            end
            self:RegisterInteraction()
            ConsumeClick()
            return
        end

        -- Handle individual option clicks
        local currentY = popupY + self.optionHeight -- Start after Select All button
        local maxOptionsToShow = math.min(#self.options, self.maxVisible)

        for i = 1, maxOptionsToShow do
            local optionIndex = i + (self.scrollOffset or 0)
            local option = self.options[optionIndex]
            if option then
                if IsMouseInBounds(x, currentY, clickWidth, self.optionHeight) then
                    self.selectedOptions[option] = not self.selectedOptions[option]
                    if not self.selectedOptions[option] then
                        self.selectedOptions[option] = nil
                    end
                    if self.callback then
                        self.callback(self:GetSelected())
                    end
                    self:RegisterInteraction()
                    ConsumeClick()
                    return
                end
                currentY = currentY + self.optionHeight
            end
        end

        -- Check if clicked outside popup to close it
        local maxOptionsToShow = math.min(#self.options, self.maxVisible)
        local totalPopupHeight = (maxOptionsToShow + 1) * self.optionHeight

        -- Check if clicked outside popup to close it - use full width for outside detection
        if not IsMouseInBounds(x, popupY, self.width, totalPopupHeight) then
            self.open = false
            Library.OpenDropdown = nil
            UnregisterPopup(self)
            return
        end
    end

    if self.scrollbarDragging then
        if InputState.mousePressed then
            local mouseX, mouseY = get_cursor_position()
            local newThumbY = mouseY - self.scrollbarDragOffset
            local minThumbY = self.scrollbarBounds.y
            local maxThumbY = self.scrollbarBounds.y + self.scrollbarBounds.height - self.scrollbarBounds.thumbHeight
            newThumbY = math.max(minThumbY, math.min(maxThumbY, newThumbY))
            local thumbProgress = (newThumbY - minThumbY) / (maxThumbY - minThumbY)
            self.scrollOffset = math.floor(thumbProgress * (self.scrollbarBounds.maxScroll or 0))
            self.scrollOffset = math.max(0, math.min((self.scrollbarBounds.maxScroll or 0), self.scrollOffset))
        else
            self.scrollbarDragging = false
        end
    end

    if not self.scrollbarDragging and #self.options > self.maxVisible then
        local x, y = self:GetAbsolutePos()
        local popupY = y + self.height
        local popupHeight = self.maxVisible * self.optionHeight
        if IsMouseInBounds(x, popupY + self.optionHeight, self.width - 8, popupHeight) then
            if utility.key_state(0x26) then
                self.scrollOffset = math.max(0, self.scrollOffset - 1)
            elseif utility.key_state(0x28) then
                self.scrollOffset = math.min(#self.options - self.maxVisible, self.scrollOffset + 1)
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
function MultiSection:AddLabel(text, fontSize, color, centered, pageIndex)
    local label = Label:new(text, fontSize, color, centered)
    return self:AddElement(label, pageIndex)
end
function Section:AddLabel(text, fontSize, color, centered)
    local label = Label:new(text, fontSize, color, centered)
    return self:AddElement(label)
end
function ColorPicker:new(text, callback, defaultColor, flag)
    local picker = Element.new(self, 0, 0, 25, 10)
    picker.text = text or "Color Picker"
    picker.callback = callback or function()
    end
    picker.color = defaultColor or {255, 255, 255, 255}
    picker.open = false
    picker.pickerWidth = 200
    picker.pickerHeight = 180
    picker.hue = 0
    picker.saturation = 1
    picker.value = 1
    picker.flag = flag
    if flag then
        Library.Flags[flag] = picker
        Library.ConfigData[flag] = picker.color
    end
    return picker
end
function ColorPicker:Set(color)
    if type(color) == "table" and #color >= 3 then
        self.color = {color[1] or 255, color[2] or 255, color[3] or 255, color[4] or 255}
        if self.flag then
            Library.ConfigData[self.flag] = self.color
        end
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
    if not self.visible then
        return
    end
    local x, y = self:GetAbsolutePos()
    local theme = self.parent.parent.parent.theme
    local fadeAlpha = self.fadeAlpha or 1.0
    local previewSize = 15
    Drawing:Rect(x, y + 2, previewSize, self.height, ApplyFadeAlpha(self.color, fadeAlpha), true, 2)
    Drawing:Rect(x, y + 2, previewSize, self.height, ApplyFadeAlpha(theme.Outer, fadeAlpha), false, 2)
    Drawing:Text(x + previewSize + 5, y, self.text, 2, true, ApplyFadeAlpha(theme.Text, fadeAlpha))
end
function ColorPicker:RenderPopup()
    if not self.open then
        return
    end
    local x, y = self:GetAbsolutePos()
    local theme = self.parent.parent.parent.theme
    local fadeAlpha = 1.0 -- Add missing fadeAlpha variable
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
            render.rect(alphaX + i, alphaY + j, math.min(8, alphaWidth - i), math.min(8, alphaHeight - j), color, color,
                color, 255)
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
    if not self.visible or not self.enabled then
        return
    end
    if IsElementBehindPopup(self) and not self.open then
        return
    end
    if not self:IsInActiveTab() then
        return
    end
    if not self:CanInteract() then
        return
    end
    if InputState.clickConsumed and not self.open then
        return
    end
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
        local mouseX, mouseY = get_cursor_position()
        if IsMouseInBounds(hueBarX, hueBarY, hueBarWidth, hueBarHeight) then
            local relY = math.max(0, math.min(1, (mouseY - hueBarY) / hueBarHeight))
            self.hue = relY * 360
            local r, g, b = self:HSVtoRGB(self.hue, self.saturation, self.value)
            self.color[1] = r
            self.color[2] = g
            self.color[3] = b
            if self.flag then
                Library.ConfigData[self.flag] = self.color
            end
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
            if self.flag then
                Library.ConfigData[self.flag] = self.color
            end
            if self.callback then
                self.callback(self.color)
            end
            self:RegisterInteraction()
        end
        if IsMouseInBounds(alphaX, alphaY, alphaWidth, 15) then
            local relX = math.max(0, math.min(1, (mouseX - alphaX) / alphaWidth))
            self.color[4] = relX * 255
            if self.flag then
                Library.ConfigData[self.flag] = self.color
            end
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
    window.fadeOut = false
    window.fadeIn = false
    window.fadeAlpha = 1.0
    window.fadeStartTime = 0
    window.nextTab = nil
    window.indicatorTargetX = 0
    window.indicatorCurrentX = 0
    window.titleGradientTime = 0
    window.titleGradientSpeed = 1.0
    window.titleGradientOffset = 0
    window.titleGradientEnabled = true
    return window
end

function Window:DrawGradientText(x, y, text, font, scale, fadeAlpha)
    if not self.titleGradientEnabled then
        local theme = self.theme
        Drawing:Text(x, y, text, font, scale, ApplyFadeAlpha(theme.Header, fadeAlpha))
        return
    end

    -- Update gradient animation time
    local currentTime = utility.get_tickcount() / 1000.0
    self.titleGradientTime = currentTime * self.titleGradientSpeed

    -- Get theme colors for gradient
    local theme = self.theme
    local color1 = theme.Accent
    local color2 = theme.Header
    local color3 = theme.Warning

    -- Calculate text metrics
    local textWidth, textHeight = render.measure_text(font, scale, text)

    -- Get animation type
    local animationType = Library.Settings.TitleAnimationType or "Letter by Letter"

    if animationType == "Split Gradient" then
        -- Split text in half - one side gradient, other normal, animated
        local halfPoint = math.floor(#text / 2)
        local splitPos = (math.sin(self.titleGradientTime * 2) * 0.5 + 0.5) * #text

        local currentX = x
        for i = 1, #text do
            local char = string.sub(text, i, i)
            local charX = currentX

            if i < #text then
                local charWidth, _ = render.measure_text(font, scale, char)
                currentX = currentX + charWidth
            end

            local finalColor
            if i <= splitPos then
                -- Gradient side
                local gradientPos = (i - 1) / math.max(1, splitPos - 1)
                local waveOffset = math.sin(gradientPos * math.pi * 2 + self.titleGradientTime * 3) * 0.5 + 0.5
                local r = color1[1] * (1 - waveOffset) + color2[1] * waveOffset
                local g = color1[2] * (1 - waveOffset) + color2[2] * waveOffset
                local b = color1[3] * (1 - waveOffset) + color2[3] * waveOffset
                local a = color1[4] * (1 - waveOffset) + color2[4] * waveOffset
                finalColor = ApplyFadeAlpha({r, g, b, a}, fadeAlpha)
            else
                -- Normal side
                finalColor = ApplyFadeAlpha(theme.Header, fadeAlpha)
            end

            Drawing:Text(charX, y, char, font, scale, finalColor)
        end

    elseif animationType == "Wave Effect" then
        -- Wave-like gradient animation flowing across text
        local currentX = x
        for i = 1, #text do
            local char = string.sub(text, i, i)
            local charX = currentX

            if i < #text then
                local charWidth, _ = render.measure_text(font, scale, char)
                currentX = currentX + charWidth
            end

            local wavePhase = (i / #text) * math.pi * 2 - self.titleGradientTime * 4
            local waveIntensity = math.sin(wavePhase) * 0.5 + 0.5
            local waveIntensity2 = math.cos(wavePhase + math.pi * 0.5) * 0.5 + 0.5

            local r = color1[1] * waveIntensity + color2[1] * waveIntensity2 + color3[1] *
                          (1 - waveIntensity - waveIntensity2)
            local g = color1[2] * waveIntensity + color2[2] * waveIntensity2 + color3[2] *
                          (1 - waveIntensity - waveIntensity2)
            local b = color1[3] * waveIntensity + color2[3] * waveIntensity2 + color3[3] *
                          (1 - waveIntensity - waveIntensity2)
            local a = color1[4] * waveIntensity + color2[4] * waveIntensity2 + color3[4] *
                          (1 - waveIntensity - waveIntensity2)

            local finalColor = ApplyFadeAlpha({r, g, b, a}, fadeAlpha)
            Drawing:Text(charX, y, char, font, scale, finalColor)
        end

    elseif animationType == "Pulse" then
        -- Pulsing gradient effect
        local pulseIntensity = math.sin(self.titleGradientTime * 3) * 0.5 + 0.5
        local pulseIntensity2 = math.cos(self.titleGradientTime * 2.5 + math.pi * 0.3) * 0.5 + 0.5

        local currentX = x
        for i = 1, #text do
            local char = string.sub(text, i, i)
            local charX = currentX

            if i < #text then
                local charWidth, _ = render.measure_text(font, scale, char)
                currentX = currentX + charWidth
            end

            local charPulse = pulseIntensity + (pulseIntensity2 * (i / #text)) * 0.3
            charPulse = math.min(1, math.max(0, charPulse))

            local r = color2[1] * (1 - charPulse) + color1[1] * charPulse
            local g = color2[2] * (1 - charPulse) + color1[2] * charPulse
            local b = color2[3] * (1 - charPulse) + color1[3] * charPulse
            local a = color2[4] * (1 - charPulse) + color1[4] * charPulse

            local finalColor = ApplyFadeAlpha({r, g, b, a}, fadeAlpha)
            Drawing:Text(charX, y, char, font, scale, finalColor)
        end

    else
        -- Default "Letter by Letter" animation - true sequential character animation
        local currentX = x
        local animationDuration = 0.8 -- Duration for each character animation
        local characterDelay = 0.15 -- Delay between character animations
        local totalAnimationTime = (#text - 1) * characterDelay + animationDuration

        -- Loop the animation cycle
        local cycleTime = (self.titleGradientTime % (totalAnimationTime + 1.0))

        for i = 1, #text do
            local char = string.sub(text, i, i)
            local charX = currentX

            if i < #text then
                local charWidth, _ = render.measure_text(font, scale, char)
                currentX = currentX + charWidth
            end

            -- Calculate when this character should start animating
            local characterStartTime = (i - 1) * characterDelay
            local characterAnimTime = cycleTime - characterStartTime

            local finalColor
            if characterAnimTime <= 0 then
                -- Character hasn't started animating yet - use default color
                finalColor = ApplyFadeAlpha(theme.Header, fadeAlpha)
            elseif characterAnimTime >= animationDuration then
                -- Character animation is complete - use accent color
                finalColor = ApplyFadeAlpha(color1, fadeAlpha)
            else
                -- Character is currently animating
                local localAnimProgress = characterAnimTime / animationDuration
                local easedProgress = localAnimProgress * localAnimProgress * (3 - 2 * localAnimProgress) -- Smooth curve

                -- Animate through gradient sequence
                local r, g, b, a
                if easedProgress < 0.5 then
                    local t = easedProgress * 2
                    r = theme.Header[1] * (1 - t) + color2[1] * t
                    g = theme.Header[2] * (1 - t) + color2[2] * t
                    b = theme.Header[3] * (1 - t) + color2[3] * t
                    a = theme.Header[4] * (1 - t) + color2[4] * t
                else
                    local t = (easedProgress - 0.5) * 2
                    r = color2[1] * (1 - t) + color1[1] * t
                    g = color2[2] * (1 - t) + color1[2] * t
                    b = color2[3] * (1 - t) + color1[3] * t
                    a = color2[4] * (1 - t) + color1[4] * t
                end

                finalColor = ApplyFadeAlpha({r, g, b, a}, fadeAlpha)
            end

            Drawing:Text(charX, y, char, font, scale, finalColor)
        end
    end
end

function Window:Render()
    if not self.visible then
        return
    end
    if Library.Settings.Tween then
        self.x = Tween.animateValue("window_x_" .. tostring(self), self.x, self.targetX)
        self.y = Tween.animateValue("window_y_" .. tostring(self), self.y, self.targetY)
    end

    -- Handle menu transitions FIRST, before any drawing
    if Library.Settings.MenuFade and self.fadeOut then
        local currentTime = utility.get_tickcount()
        local elapsed = (currentTime - self.fadeStartTime) / 1000.0
        local fadeProgress = elapsed / 0.25 -- Quarter second for fade out

        if fadeProgress >= 1.0 then
            -- Switch to fade in
            self.fadeOut = false
            self.fadeIn = true
            self.fadeStartTime = currentTime
            self.currentTab = self.nextTab
            self.nextTab = nil
            self.fadeAlpha = 0.0
        else
            self.fadeAlpha = 1.0 - fadeProgress
        end
    elseif Library.Settings.MenuFade and self.fadeIn then
        local currentTime = utility.get_tickcount()
        local elapsed = (currentTime - self.fadeStartTime) / 1000.0
        local fadeProgress = elapsed / 0.25 -- Quarter second for fade in

        if fadeProgress >= 1.0 then
            self.fadeIn = false
            self.fadeAlpha = 1.0
        else
            self.fadeAlpha = fadeProgress
        end
    elseif self.slideTransition then
        local currentTime = utility.get_tickcount()
        local elapsed = (currentTime - self.slideStartTime) / 1000.0
        local transitionProgress = elapsed / 0.25 -- Half second total (0.25 for each phase)

        if self.slidePhase == "out" then
            if transitionProgress >= 1.0 then
                -- Switch to slide in phase
                self.slidePhase = "in"
                self.slideStartTime = currentTime
                self.currentTab = self.nextTab
                self.nextTab = nil
                self.slideOffset = 15 -- Start elements below their normal position
                self.slideAlpha = 0.0
            else
                -- Slide up and fade out current tab
                self.slideOffset = -transitionProgress * 15 -- Move up by 15 pixels
                self.slideAlpha = 1.0 - transitionProgress
            end
        elseif self.slidePhase == "in" then
            if transitionProgress >= 1.0 then
                -- Complete transition
                self.slideTransition = false
                self.slidePhase = nil
                self.slideOffset = 0
                self.slideAlpha = 1.0
                self.fadeAlpha = 1.0
            else
                -- Slide down and fade in new tab
                self.slideOffset = (1.0 - transitionProgress) * 15 -- Move down from 15 pixels to 0
                self.slideAlpha = transitionProgress
                self.fadeAlpha = transitionProgress
            end
        end
    else
        -- Ensure fadeAlpha is always 1.0 when transitions are disabled or not active
        self.fadeAlpha = 1.0
        self.slideAlpha = 1.0
        self.slideOffset = 0
    end

    local x, y = self:GetAbsolutePos()
    local theme = self.theme
    local fadeAlpha = self.fadeAlpha or 1.0

    -- Apply fade alpha to all window drawing operations
    Drawing:Rect(x, y, self.width, self.height, theme.Dark, true, 4)
    Drawing:Rect(x, y, self.width, self.height, theme.Accent, false, 4)
    Drawing:Rect(x + 1, y + 1, self.width - 2, self.headerHeight, ApplyFadeAlpha(theme.Light, fadeAlpha), true, 0)
    Drawing:Gradient(x + 1, y + 1, self.width - 2, self.headerHeight, ApplyFadeAlpha(theme.Light, fadeAlpha),
        ApplyFadeAlpha(theme.Mid, fadeAlpha), true)
    self:DrawGradientText(x + 8, y + 6, self.title, 2, true, fadeAlpha)
    local tabY = y + self.headerHeight + 1
    if #self.tabs > 0 then
        local tabWidth = math.floor((self.width - 4) / #self.tabs)
        for i, tab in ipairs(self.tabs) do
            local tabX = x + 2 + (i - 1) * tabWidth
            local isActive = tab == self.currentTab
            local tabColor1, tabColor2
            if isActive then
                tabColor1 = theme.High
                tabColor2 = theme.Accent
            else
                tabColor1 = theme.Mid
                tabColor2 = theme.Light
            end
            Drawing:Gradient(tabX, tabY, tabWidth, self.tabHeight, ApplyFadeAlpha(tabColor1, fadeAlpha),
                ApplyFadeAlpha(tabColor2, fadeAlpha), true)
            Drawing:Rect(tabX, tabY, tabWidth, self.tabHeight, theme.Outer, false, 0)
            -- Update indicator target position when active tab changes
            if isActive then
                local lineWidth = math.floor(tabWidth * 0.4) -- 40% of tab width
                local lineX = tabX + (tabWidth - lineWidth) / 2 -- Center the line
                self.indicatorTargetX = lineX
                self.indicatorWidth = lineWidth
            end
            local textWidth, textHeight = render.measure_text(2, true, tab.name)
            local textX = tabX + (tabWidth - textWidth) / 2
            local textY = tabY + (self.tabHeight - textHeight) / 2
            Drawing:Text(textX, textY, tab.name, 2, true, theme.Text)
            tab.clickX = tabX
            tab.clickY = tabY
            tab.clickWidth = tabWidth
            tab.clickHeight = self.tabHeight
        end
        -- Render animated tab indicator with easing
        if self.indicatorWidth then
            self.indicatorCurrentX = Tween.animateValue("tab_indicator_" .. tostring(self),
                self.indicatorCurrentX or self.indicatorTargetX, self.indicatorTargetX)
            local lineY = tabY + self.tabHeight - 1 -- Bottom of tab
            local lineColor = {theme.Accent[1], theme.Accent[2], theme.Accent[3], theme.Accent[4]}
            Drawing:Line(self.indicatorCurrentX, lineY, self.indicatorCurrentX + self.indicatorWidth, lineY, lineColor,
                2)
        end
    end
    local contentY = tabY + self.tabHeight + 2
    local contentHeight = self.height - self.headerHeight - self.tabHeight - 6
    local contentWidth = self.width - 4
    Drawing:Rect(x + 2, contentY, contentWidth, contentHeight, ApplyFadeAlpha(theme.High, fadeAlpha), true, 0)
    Drawing:Rect(x + 2, contentY, contentWidth, contentHeight, ApplyFadeAlpha(theme.Outer, fadeAlpha), false, 0)
    if self.currentTab then
        -- Apply transition effects
        if Library.Settings.MenuFade and (self.fadeOut or self.fadeIn) then
            self.currentTab.fadeAlpha = self.fadeAlpha or 1.0
            self.currentTab.slideOffset = 0
        elseif self.slideTransition then
            self.currentTab.fadeAlpha = self.slideAlpha or 1.0
            self.currentTab.slideOffset = self.slideOffset or 0
        else
            self.currentTab.fadeAlpha = 1.0
            self.currentTab.slideOffset = 0
        end
        self.currentTab:Render()
    end
end
function Window:HandleInput()
    if not self.visible then
        return
    end
    if not self:CanInteract() then
        return
    end
    Element.HandleInput(self)
    local mouseX, mouseY = get_cursor_position()
    if InputState.mouseClicked then
        if not IsPopupActive() and not InputState.clickConsumed then
            for i, tab in ipairs(self.tabs) do
                if tab.clickX and IsMouseInBounds(tab.clickX, tab.clickY, tab.clickWidth, tab.clickHeight) then
                    self:SetCurrentTab(i)
                    self:RegisterInteraction()
                    InputState.clickConsumed = true
                    break
                end
            end
        end
    end
    local contentArea = {
        x = self.x + 2,
        y = self.y + self.headerHeight + self.tabHeight + 3,
        width = self.width - 4,
        height = self.height - self.headerHeight - self.tabHeight - 6
    }
    local headerArea = IsMouseInBounds(self.x, self.y, self.width, self.headerHeight)
    if headerArea and InputState.mousePressed and not self.dragging and not IsPopupActive() and
        not InputState.clickConsumed then
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
        -- Initialize indicator position for first tab
        if #self.tabs == 1 then
            local tabWidth = math.floor((self.width - 4) / #self.tabs)
            local tabX = 2 + (1 - 1) * tabWidth
            local lineWidth = math.floor(tabWidth * 0.4)
            local lineX = tabX + (tabWidth - lineWidth) / 2
            self.indicatorTargetX = lineX
            self.indicatorCurrentX = lineX
            self.indicatorWidth = lineWidth
        end
    end
    return tab
end
function Window:SetCurrentTab(index)
    if self.tabs[index] and self.tabs[index] ~= self.currentTab then
        CloseAllPopups() -- Close all popups when switching tabs to prevent click falling
        local transitionType = Library.Settings.TabTransitionType or "Fade"

        if Library.Settings.MenuFade and transitionType == "Fade" then
            self.fadeOut = true
            self.fadeAlpha = 1.0
            self.fadeStartTime = utility.get_tickcount()
            self.nextTab = self.tabs[index]
        elseif transitionType == "Slide Up/Down" then
            self.slideTransition = true
            self.slidePhase = "out" -- Start with slide out phase
            self.slideAlpha = 1.0
            self.slideOffset = 0
            self.slideStartTime = utility.get_tickcount()
            self.nextTab = self.tabs[index]
        else
            self.currentTab = self.tabs[index]
        end
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
    if not self.visible then
        return
    end

    -- Apply fade alpha and slide offset to all sections
    local fadeAlpha = self.fadeAlpha or 1.0
    local slideOffset = self.slideOffset or 0

    local scrollX = self.scrollX or 0
    local scrollY = self.scrollY or 0
    for _, section in ipairs(self.sections) do
        if section and section.Render then
            local originalX, originalY = section.x, section.y
            section.x = section.x - scrollX
            section.y = section.y - scrollY + slideOffset -- Apply slide offset

            -- Pass fade alpha to section
            section.fadeAlpha = fadeAlpha

            if section:IsEffectivelyVisible() then
                section:Render()
            end
            section.x = originalX
            section.y = originalY
        end
    end
end
function Tab:HandleInput()
    local scrollX = self.scrollX or 0
    local scrollY = self.scrollY or 0
    for _, section in ipairs(self.sections) do
        if section and section.HandleInput then
            local originalX, originalY = section.x, section.y
            section.x = section.x - scrollX
            section.y = section.y - scrollY
            section:HandleInput()
            section.x = originalX
            section.y = originalY
        end
    end
end
function Tab:AddSection(name, x, y, width, height, enableScrollbars)
    local section = Section:new(name, self, x, y, width, height, enableScrollbars)
    table.insert(self.sections, section)
    return section
end
function Tab:AddMultiSection(name, pages, x, y, width, height, enableScrollbars)
    local multiSection = MultiSection:new(name, pages, self, x, y, width, height, enableScrollbars)
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
function Tab:AddEntityESPPreview(name, x, y, width, height)
    local entityEspPreview = EntityESPPreview:new(name, self, x, y, width, height)
    table.insert(self.sections, entityEspPreview)
    return entityEspPreview
end
function Section:new(name, parent, x, y, width, height, enableScrollbars)
    local section = Element.new(self, x or 10, y or 60, width or 200, height or 150)
    section.name = name
    section.parent = parent
    section.elements = {}
    section.elementY = 25
    section.enableScrollbars = enableScrollbars or false
    section.scrollY = 0
    section.maxScrollY = 0
    section.contentHeight = 0
    section.scrollbarWidth = 6
    section.scrollbarDragging = false
    section.scrollbarDragOffset = 0
    section.zIndex = 5
    return section
end
function Section:CalculateContentBounds()
    if not self.enableScrollbars then
        return
    end
    local availableHeight = self.height - 22
    local actualMaxY = 0
    for _, element in ipairs(self.elements) do
        if element and element.visible then
            local elementBottom = element.y + element.height
            actualMaxY = math.max(actualMaxY, elementBottom)
        end
    end
    self.contentHeight = actualMaxY
    if self.contentHeight > availableHeight then
        self.maxScrollY = self.contentHeight - availableHeight
    else
        self.maxScrollY = 0
    end
    self.scrollY = math.max(0, math.min(self.maxScrollY, self.scrollY))
end
function Section:RenderScrollbar(x, y, width, height)
    if not self.enableScrollbars or self.maxScrollY <= 0 then
        return
    end
    local mouseX, mouseY = get_cursor_position()
    local isHovering = IsMouseInBounds(x, y, width, height)
    if not isHovering and not self.scrollbarDragging then
        return
    end
    local theme = Library.Theme.List[Library.Theme.Selected]
    if self.parent and self.parent.parent and self.parent.parent.theme then
        theme = self.parent.parent.theme
    end
    local scrollbarX = x + width - self.scrollbarWidth
    local scrollbarY = y + 22
    local scrollbarHeight = height - 22
    local thumbHeight = math.max(20, math.floor(scrollbarHeight * (scrollbarHeight / self.contentHeight)))
    local thumbY = scrollbarY + math.floor((scrollbarHeight - thumbHeight) * (self.scrollY / self.maxScrollY))
    local fadeAlpha = self.fadeAlpha or 1.0
    Drawing:Gradient(scrollbarX + 1, thumbY, self.scrollbarWidth - 2, thumbHeight,
        ApplyFadeAlpha(theme.Accent, fadeAlpha), ApplyFadeAlpha(theme.AccentLight, fadeAlpha), true)
    Drawing:Rect(scrollbarX + 1, thumbY, self.scrollbarWidth - 2, thumbHeight, ApplyFadeAlpha(theme.Outer, fadeAlpha),
        false, 1)
    self.scrollbarBounds = {
        x = scrollbarX,
        y = scrollbarY,
        width = self.scrollbarWidth,
        height = scrollbarHeight,
        thumbY = thumbY,
        thumbHeight = thumbHeight
    }
end
function Section:Render()
    if not self.visible or not self:IsEffectivelyVisible() then
        return
    end
    if self.enableScrollbars then
        self:CalculateContentBounds()
    end
    local x, y = self:GetAbsolutePos()
    local theme = Library.Theme.List[Library.Theme.Selected]
    if self.parent and self.parent.parent and self.parent.parent.theme then
        theme = self.parent.parent.theme
    end

    local fadeAlpha = self.fadeAlpha or 1.0

    Drawing:Rect(x, y, self.width, self.height, ApplyFadeAlpha(theme.Mid, fadeAlpha), true, 2)
    Drawing:Rect(x, y, self.width, self.height, ApplyFadeAlpha(theme.Outer, fadeAlpha), false, 2)
    Drawing:Rect(x + 1, y + 1, self.width - 2, 20, ApplyFadeAlpha(theme.Light, fadeAlpha), true, 0)
    Drawing:Text(x + 5, y + 4, self.name, 2, true, ApplyFadeAlpha(theme.Header, fadeAlpha))
    if self.enableScrollbars then
        self:RenderScrollbar(x, y, self.width, self.height)
    end
    for _, element in ipairs(self.elements) do
        if element and element.Render and element:IsEffectivelyVisible() then
            -- Pass fade alpha to child elements
            element.fadeAlpha = fadeAlpha
            element:Render()
        end
    end
end
function Section:HandleInput()
    if self.enableScrollbars and self.maxScrollY > 0 then
        local mouseX, mouseY = get_cursor_position()
        if InputState.mouseClicked then
            if self.scrollbarBounds and
                IsMouseInBounds(self.scrollbarBounds.x, self.scrollbarBounds.thumbY, self.scrollbarBounds.width,
                    self.scrollbarBounds.thumbHeight) then
                if IsPopupActive() then
                    CloseAllPopups()
                end
                self.scrollbarDragging = true
                self.scrollbarDragOffset = mouseY - self.scrollbarBounds.thumbY
                InputState.scrollbarActive = true
                InputState.clickConsumed = true
            end
        end
        if self.scrollbarDragging and InputState.mousePressed then
            InputState.scrollbarActive = true
            if self.scrollbarBounds and self.maxScrollY > 0 then
                local newThumbY = mouseY - self.scrollbarDragOffset
                local minY = self.scrollbarBounds.y
                local maxY = self.scrollbarBounds.y + self.scrollbarBounds.height - self.scrollbarBounds.thumbHeight
                if maxY > minY then
                    newThumbY = math.max(minY, math.min(maxY, newThumbY))
                    local progress = (newThumbY - minY) / (maxY - minY)
                    self.scrollY = math.floor(progress * self.maxScrollY)
                end
            end
        end
        if not InputState.mousePressed then
            self.scrollbarDragging = false
        end
        local x, y = self:GetAbsolutePos()
        if IsMouseInBounds(x, y + 22, self.width, self.height - 22) then
            if utility.key_state(0x26) then
                self.scrollY = math.max(0, self.scrollY - 25)
            elseif utility.key_state(0x28) then
                self.scrollY = math.min(self.maxScrollY, self.scrollY + 25)
            end
        end
    end
    for _, element in ipairs(self.elements) do
        if element and element.HandleInput then
            element:HandleInput()
        end
    end
end
function Section:AddDivider(text)
    local divider = Divider:new(text)
    return self:AddElement(divider)
end
function Section:AddSeparator(text)
    local separator = Separator:new(text)
    return self:AddElement(separator)
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
function MultiSection:new(name, pages, parent, x, y, width, height, enableScrollbars)
    local multiSection = Section.new(self, name, parent, x, y, width, height, enableScrollbars)
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
function MultiSection:CalculateContentBounds()
    if not self.enableScrollbars then
        return
    end

    local currentPage = self.pages[self.currentPage]
    if not currentPage then
        self.contentHeight = 0
        self.maxScrollY = 0
        return
    end

    -- Calculate content height based on current page elements
    local contentHeight = 0
    for _, element in ipairs(currentPage.elements) do
        if element and element.visible ~= false then
            local elementBottom = element.y + element.height
            contentHeight = math.max(contentHeight, elementBottom)
        end
    end

    -- Account for both section header (22px) and page tabs (pageHeight)
    local availableHeight = self.height - 22 - self.pageHeight
    self.contentHeight = contentHeight
    self.maxScrollY = math.max(0, contentHeight - availableHeight)
end
function MultiSection:Render()
    if not self.visible or not self:IsEffectivelyVisible() then
        return
    end
    if self.enableScrollbars then
        self:CalculateContentBounds()
    end
    local x, y = self:GetAbsolutePos()
    local theme = self.parent.parent.theme
    local fadeAlpha = self.fadeAlpha or 1.0
    Drawing:Rect(x, y, self.width, self.height, ApplyFadeAlpha(theme.Mid, fadeAlpha), true, 2)
    Drawing:Rect(x, y, self.width, self.height, ApplyFadeAlpha(theme.Outer, fadeAlpha), false, 2)
    Drawing:Rect(x + 1, y + 1, self.width - 2, 20, ApplyFadeAlpha(theme.Light, fadeAlpha), true, 0)
    Drawing:Text(x + 5, y + 4, self.name, 2, true, ApplyFadeAlpha(theme.Header, fadeAlpha))
    if self.enableScrollbars then
        self:RenderScrollbar(x, y, self.width, self.height)
    end
    if #self.pages > 0 then
        local tabWidth = math.floor((self.width - 4) / #self.pages)
        local tabY = y + 22
        for i, page in ipairs(self.pages) do
            local tabX = x + 2 + (i - 1) * tabWidth
            local isActive = i == self.currentPage
            local tabColor1, tabColor2
            if isActive then
                tabColor1 = ApplyFadeAlpha(theme.High, fadeAlpha)
                tabColor2 = ApplyFadeAlpha(theme.Accent, fadeAlpha)
            else
                tabColor1 = ApplyFadeAlpha(theme.Dark, fadeAlpha)
                tabColor2 = ApplyFadeAlpha(theme.Mid, fadeAlpha)
            end
            Drawing:Gradient(tabX, tabY, tabWidth, self.pageHeight, tabColor1, tabColor2, true)
            Drawing:Rect(tabX, tabY, tabWidth, self.pageHeight, ApplyFadeAlpha(theme.Outer, fadeAlpha), false, 0)
            local textWidth, textHeight = render.measure_text(1, true, page.name)
            local textX = tabX + (tabWidth - textWidth) / 2
            local textY = tabY + (self.pageHeight - textHeight) / 2
            Drawing:Text(textX, textY, page.name, 1, true, ApplyFadeAlpha(theme.Text, fadeAlpha))
            page.clickX = tabX
            page.clickY = tabY
            page.clickWidth = tabWidth
            page.clickHeight = self.pageHeight
        end
    end
    if self.pages[self.currentPage] then
        for _, element in ipairs(self.pages[self.currentPage].elements) do
            if element and element.Render and element:IsEffectivelyVisible() then
                -- Pass fade alpha to child elements
                element.fadeAlpha = fadeAlpha
                element:Render()
            end
        end
    end
end
function MultiSection:HandleInput()
    if not self:CanInteract() then
        return
    end

    -- Handle scrollbar input if enabled
    if self.enableScrollbars then
        local x, y = self:GetAbsolutePos()
        local scrollbarX = x + self.width - self.scrollbarWidth
        local scrollbarY = y + 22 + self.pageHeight -- Account for header and tabs
        local scrollbarHeight = self.height - 22 - self.pageHeight
        local cursor_x, cursor_y = get_cursor_position()
        -- Mouse wheel scrolling

        -- Scrollbar drag handling
        if InputState.mouseClicked and IsMouseInBounds(scrollbarX, scrollbarY, self.scrollbarWidth, scrollbarHeight) then
            if self.maxScrollY > 0 then
                local thumbHeight = math.max(20, math.floor(scrollbarHeight * (scrollbarHeight / self.contentHeight)))
                local thumbY = scrollbarY + (self.scrollY / self.maxScrollY) * (scrollbarHeight - thumbHeight)

                if IsMouseInBounds(scrollbarX, thumbY, self.scrollbarWidth, thumbHeight) then
                    self.scrollbarDragging = true
                    self.scrollbarDragOffset = cursor_y - thumbY
                    self:RegisterInteraction()
                end
            end
        end

        if self.scrollbarDragging then
            if InputState.mousePressed then

                local scrollbarHeight = self.height - 22 - self.pageHeight
                local thumbHeight = math.max(20, math.floor(scrollbarHeight * (scrollbarHeight / self.contentHeight)))
                local newThumbY = cursor_y - self.scrollbarDragOffset
                local newScrollProgress = (newThumbY - (y + 22 + self.pageHeight)) / (scrollbarHeight - thumbHeight)
                self.scrollY = math.max(0, math.min(self.maxScrollY, newScrollProgress * self.maxScrollY))
            else
                self.scrollbarDragging = false
            end
        end

        -- Keyboard scrolling
        if InputState.keyPressed then
            if InputState.keyPressed == 0x26 then -- Up arrow
                self.scrollY = math.max(0, self.scrollY - 25)
                self:RegisterInteraction()
            elseif InputState.keyPressed == 0x28 then -- Down arrow
                self.scrollY = math.min(self.maxScrollY, self.scrollY + 25)
                self:RegisterInteraction()
            end
        end
    end

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
            if element and element.HandleInput and element:IsInActiveTab() then
                element:HandleInput()
            end
        end
    end
end
function MultiSection:AddElement(element, pageIndex)
    pageIndex = pageIndex or self.currentPage
    if not self.pages[pageIndex] then
        return
    end
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
    if self.Closed then
        return
    end
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
    if self.Closed then
        return
    end
    local theme = Library.Theme.List[Library.Theme.Selected]
    local x, y = self:GetPosition()
    local alpha = math.floor(255 * self.AnimProgress)
    local animProgress = self.AnimProgress
    local easedProgress = easeOutQuad(animProgress)
    local animWidth = self.Width * easedProgress
    local alpha = math.floor(255 * easedProgress)
    Drawing:Rect(x, y, animWidth, self.Height, theme.Dark, true, 4)
    Drawing:Rect(x, y, animWidth, self.Height, theme.Outer, false, 4)
    local accentColor = theme.Accent
    if self.Type == "warning" then
        accentColor = theme.Warning
    elseif self.Type == "error" then
        accentColor = theme.Error
    end
    Drawing:Rect(x, y, 5, self.Height, accentColor, true, 0)

    if not self.Closing then
        Drawing:Text(x + 15, y + 10, self.Title, 2, true, theme.Header)
        Drawing:Text(x + 15, y + 30, self.Message, 1, true, theme.Text)
        local closeSize = 12
        local closeX = x + self.Width - closeSize - 8
        local closeY = y + 10
        local closeHovered = IsMouseInBounds(closeX, closeY, closeSize, closeSize)
        Drawing:Rect(closeX, closeY, closeSize, closeSize, closeHovered and theme.Accent or theme.Outer, true, 0)
        Drawing:Line(closeX + 3, closeY + 3, closeX + closeSize - 3, closeY + closeSize - 3, theme.Text, 1)
        Drawing:Line(closeX + closeSize - 3, closeY + 3, closeX + 3, closeY + closeSize - 3, theme.Text, 1)
        return closeHovered
    end

    return false
end

function Notification:GetPosition()
    local screenWidth, screenHeight = get_window_size()
    local index = self:GetIndex()
    if Library.Notifications.Position == "top-right" then
        return screenWidth - self.Width - 20, 20 + (self.Height + Library.Notifications.Spacing) * index
    elseif Library.Notifications.Position == "top-left" then
        return 20, 20 + (self.Height + Library.Notifications.Spacing) * index
    elseif Library.Notifications.Position == "bottom-right" then
        return screenWidth - self.Width - 20,
            screenHeight - self.Height - 20 - (self.Height + Library.Notifications.Spacing) * index
    else
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
function Library.Notify(title, message, type, duration)
    local notif = Notification:new(title, message, type, duration)
    table.insert(Library.Notifications.List, 1, notif)
    if #Library.Notifications.List > Library.Notifications.MaxVisible + 2 then
        for i = Library.Notifications.MaxVisible + 2, #Library.Notifications.List do
            Library.Notifications.List[i].Closing = true
        end
    end
end
function Library.Notifications:UpdateAll()
    for i = #self.List, 1, -1 do
        local notif = self.List[i]
        notif:Update()
        if notif.Closed then
            table.remove(self.List, i)
        end
    end
end
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
        for _, tab in ipairs(window.tabs) do
            for _, section in ipairs(tab.sections) do
                section.theme = theme
            end
        end
    end
end
function Library.CreateWatermark(info)
    if Library.Watermark then
        if info.title then
            Library.Watermark.title = info.title
        end
        if info.template then
            Library.Watermark:SetTemplate(info.template)
        end
        if info.position then
            Library.Watermark:SetPosition(info.position)
        end
    else
        Library.Watermark = Watermark:new(info)
    end
    return Library.Watermark
end
function Library.Init(args)
    args = args or {}
    local title = args.Title or args.title or Library.Title
    local theme = args.Theme or args.theme or "Default"
    Library.Theme.Selected = theme
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

function Library.SetCursor(args)
    args = args or {}

    Library.CustomCursor = {
        enabled = args.enabled ~= false,
        size = args.size or 16,
        thickness = args.thickness or 1.5,
        gradient = args.gradient ~= false,
        trail = args.trail ~= false,
        trailLength = args.trailLength or 8,
        trailPositions = {},
        lastUpdate = 0
    }

    return Library
end

local UI = Library.Init({
    Title = "tyrisware",
    Theme = "Onetap",
    Watermark = {
        title = "tyrisware",
        template = "$TITLE | $PLAYER | $FPS FPS",
        position = "top-right"
    }
})
local MainWindow = Library.Window({
    Title = "tyrisware",
    X = 100,
    Y = 100,
    Width = 630,
    Height = 610
})

--[[
UI:SetCursor({
    enabled = true,        -- Enable/disable custom cursor
    size = 16,            -- Triangle size (default: 16)
    thickness = 1.5,      -- Border thickness (default: 1.5)
    gradient = true,      -- Gradient fill effect (default: true)
    trail = true,         -- Mouse trail effect (default: true)
    trailLength = 8       -- Trail segments (default: 8)
})
]] --
local boneMap = {
    ["Head"] = 6,
    ["Neck"] = 5,
    ["Chest"] = 4,
    ["Stomach"] = 2,
    ["Pelvis"] = 0,
    ["LeftShoulder"] = 8,
    ["LeftElbow"] = 9,
    ["LeftHand"] = 10,
    ["RightShoulder"] = 13,
    ["RightElbow"] = 14,
    ["RightHand"] = 15,
    ["LeftThigh"] = 22,
    ["LeftKnee"] = 23,
    ["LeftFoot"] = 24,
    ["RightThigh"] = 25,
    ["RightKnee"] = 26,
    ["RightFoot"] = 27
}
local elements = {}
local sections = {}
local tabs = {}
local multiSections = {}
local AimbotConfig = {
    activeWeapon = "Default",
    selectedWeapon = "Default",
    overrideWeapon = false,
    configWeapon = "Default",
    globalKeybind = {
        key = 0x41,
        mode = "Hold",
        active = false
    },
    weapons = {
        ["Default"] = {
            enabled = true,
            mode = "mouse",
            visible = false,
            overrideWeapon = false,
            targets = {"Players"},
            sticky = false,
            targetSelection = "Closest to crosshair",
            hitboxes = {"Head", "Pelvis"},
            fov = 60,
            visualizeFOV = false,
            visualizeFOVColor = {255, 255, 255, 255},
            fovCircleFilled = false,
            fovCircleFilledColor = {255, 255, 255, 100},
            mouseMovement = "Linear",
            maxDistance = 1000,
            visualizeTarget = false,
            targetColor = {255, 0, 0, 255},
            speedMultiplier = 3.0,
            targetSwitchDelay = 100,
            speedCurveEnabled = true,
            distanceCurveEnabled = true,
            transitionCurveEnabled = true,
            speedCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            distanceCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 0,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            transitionCurve = {
                nodes = {{
                    x = 0,
                    y = 0,
                    interpolationType = "Linear"
                }, {
                    x = 25,
                    y = 80,
                    interpolationType = "Circular"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Circular"
                }},
                interpolationType = "Circular"
            },
            triggerbot = {
                enabled = false,
                keybind = {
                    key = 0x0,
                    mode = "Hold",
                    active = false
                },
                delay = 50,
                magnet = false,
                teamCheck = true,
                mode = "Hold"
            },
            rcs = {
                enabled = false,
                horizontal = 50,
                vertical = 50,
                last_kickback = {x = 0, y = 0, z = 0}
            }
        },
        ["Desert Eagle"] = {
            mode = "mouse",
            visible = false,
            overrideWeapon = false,
            targets = {"Players"},
            sticky = false,
            targetSelection = "Closest to crosshair",
            hitboxes = {"Head", "Pelvis"},
            fov = 60,
            visualizeFOV = false,
            visualizeFOVColor = {255, 255, 255, 255},
            fovCircleFilled = false,
            fovCircleFilledColor = {255, 255, 255, 100},
            mouseMovement = "Linear",
            maxDistance = 1000,
            visualizeTarget = false,
            targetColor = {255, 0, 0, 255},
            speedMultiplier = 3.0,
            targetSwitchDelay = 100,
            speedCurveEnabled = true,
            distanceCurveEnabled = true,
            transitionCurveEnabled = true,
            speedCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            distanceCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 0,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            transitionCurve = {
                nodes = {{
                    x = 0,
                    y = 0,
                    interpolationType = "Linear"
                }, {
                    x = 25,
                    y = 80,
                    interpolationType = "Circular"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Circular"
                }},
                interpolationType = "Circular"
            },
            triggerbot = {
                enabled = false,
                keybind = {
                    key = 0x0,
                    mode = "Hold",
                    active = false
                },
                delay = 50,
                magnet = false,
                teamCheck = true,
                mode = "Hold"
            },
            rcs = {
                enabled = false,
                horizontal = 50,
                vertical = 50,
                last_kickback = {x = 0, y = 0, z = 0}
            }
        },
        ["Dual Berettas"] = {
            mode = "mouse",
            visible = false,
            overrideWeapon = false,
            targets = {"Players"},
            sticky = false,
            targetSelection = "Closest to crosshair",
            hitboxes = {"Head", "Pelvis"},
            fov = 60,
            visualizeFOV = false,
            visualizeFOVColor = {255, 255, 255, 255},
            fovCircleFilled = false,
            fovCircleFilledColor = {255, 255, 255, 100},
            mouseMovement = "Linear",
            maxDistance = 1000,
            visualizeTarget = false,
            targetColor = {255, 0, 0, 255},
            speedMultiplier = 3.0,
            targetSwitchDelay = 100,
            speedCurveEnabled = true,
            distanceCurveEnabled = true,
            transitionCurveEnabled = true,
            speedCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            distanceCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 0,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            transitionCurve = {
                nodes = {{
                    x = 0,
                    y = 0,
                    interpolationType = "Linear"
                }, {
                    x = 25,
                    y = 80,
                    interpolationType = "Circular"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Circular"
                }},
                interpolationType = "Circular"
            },
            triggerbot = {
                enabled = false,
                keybind = {
                    key = 0x0,
                    mode = "Hold",
                    active = false
                },
                delay = 50,
                magnet = false,
                teamCheck = true,
                mode = "Hold"
            },
            rcs = {
                enabled = false,
                horizontal = 50,
                vertical = 50,
                last_kickback = {x = 0, y = 0, z = 0}
            }
        },
        ["Five-SeveN"] = {
            mode = "mouse",
            visible = false,
            overrideWeapon = false,
            targets = {"Players"},
            sticky = false,
            targetSelection = "Closest to crosshair",
            hitboxes = {"Head", "Pelvis"},
            fov = 60,
            visualizeFOV = false,
            visualizeFOVColor = {255, 255, 255, 255},
            fovCircleFilled = false,
            fovCircleFilledColor = {255, 255, 255, 100},
            mouseMovement = "Linear",
            maxDistance = 1000,
            visualizeTarget = false,
            targetColor = {255, 0, 0, 255},
            speedMultiplier = 3.0,
            targetSwitchDelay = 100,
            speedCurveEnabled = true,
            distanceCurveEnabled = true,
            transitionCurveEnabled = true,
            speedCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            distanceCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 0,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            transitionCurve = {
                nodes = {{
                    x = 0,
                    y = 0,
                    interpolationType = "Linear"
                }, {
                    x = 25,
                    y = 80,
                    interpolationType = "Circular"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Circular"
                }},
                interpolationType = "Circular"
            },
            triggerbot = {
                enabled = false,
                keybind = {
                    key = 0x0,
                    mode = "Hold",
                    active = false
                },
                delay = 50,
                magnet = false,
                teamCheck = true,
                mode = "Hold"
            },
            rcs = {
                enabled = false,
                horizontal = 50,
                vertical = 50,
                last_kickback = {x = 0, y = 0, z = 0}
            }
        },
        ["Glock"] = {
            mode = "mouse",
            visible = false,
            overrideWeapon = false,
            targets = {"Players"},
            sticky = false,
            targetSelection = "Closest to crosshair",
            hitboxes = {"Head", "Pelvis"},
            fov = 60,
            visualizeFOV = false,
            visualizeFOVColor = {255, 255, 255, 255},
            fovCircleFilled = false,
            fovCircleFilledColor = {255, 255, 255, 100},
            mouseMovement = "Linear",
            maxDistance = 1000,
            visualizeTarget = false,
            targetColor = {255, 0, 0, 255},
            speedMultiplier = 3.0,
            targetSwitchDelay = 100,
            speedCurveEnabled = true,
            distanceCurveEnabled = true,
            transitionCurveEnabled = true,
            speedCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            distanceCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 0,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            transitionCurve = {
                nodes = {{
                    x = 0,
                    y = 0,
                    interpolationType = "Linear"
                }, {
                    x = 25,
                    y = 80,
                    interpolationType = "Circular"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Circular"
                }},
                interpolationType = "Circular"
            },
            triggerbot = {
                enabled = false,
                keybind = {
                    key = 0x0,
                    mode = "Hold",
                    active = false
                },
                delay = 50,
                magnet = false,
                teamCheck = true,
                mode = "Hold"
            },
            rcs = {
                enabled = false,
                horizontal = 50,
                vertical = 50,
                last_kickback = {x = 0, y = 0, z = 0}
            }
        },
        ["R8 Revolver"] = {
            mode = "mouse",
            visible = false,
            overrideWeapon = false,
            targets = {"Players"},
            sticky = false,
            targetSelection = "Closest to crosshair",
            hitboxes = {"Head", "Pelvis"},
            fov = 60,
            visualizeFOV = false,
            visualizeFOVColor = {255, 255, 255, 255},
            fovCircleFilled = false,
            fovCircleFilledColor = {255, 255, 255, 100},
            mouseMovement = "Linear",
            maxDistance = 1000,
            visualizeTarget = false,
            targetColor = {255, 0, 0, 255},
            speedMultiplier = 3.0,
            targetSwitchDelay = 100,
            speedCurveEnabled = true,
            distanceCurveEnabled = true,
            transitionCurveEnabled = true,
            speedCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            distanceCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 0,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            transitionCurve = {
                nodes = {{
                    x = 0,
                    y = 0,
                    interpolationType = "Linear"
                }, {
                    x = 25,
                    y = 80,
                    interpolationType = "Circular"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Circular"
                }},
                interpolationType = "Circular"
            },
            triggerbot = {
                enabled = false,
                keybind = {
                    key = 0x0,
                    mode = "Hold",
                    active = false
                },
                delay = 50,
                magnet = false,
                teamCheck = true,
                mode = "Hold"
            },
            rcs = {
                enabled = false,
                horizontal = 50,
                vertical = 50,
                last_kickback = {x = 0, y = 0, z = 0}
            }
        },
        ["P2000"] = {
            mode = "mouse",
            visible = false,
            overrideWeapon = false,
            targets = {"Players"},
            sticky = false,
            targetSelection = "Closest to crosshair",
            hitboxes = {"Head", "Pelvis"},
            fov = 60,
            visualizeFOV = false,
            visualizeFOVColor = {255, 255, 255, 255},
            fovCircleFilled = false,
            fovCircleFilledColor = {255, 255, 255, 100},
            mouseMovement = "Linear",
            maxDistance = 1000,
            visualizeTarget = false,
            targetColor = {255, 0, 0, 255},
            speedMultiplier = 3.0,
            targetSwitchDelay = 100,
            speedCurveEnabled = true,
            distanceCurveEnabled = true,
            transitionCurveEnabled = true,
            speedCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            distanceCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 0,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            transitionCurve = {
                nodes = {{
                    x = 0,
                    y = 0,
                    interpolationType = "Linear"
                }, {
                    x = 25,
                    y = 80,
                    interpolationType = "Circular"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Circular"
                }},
                interpolationType = "Circular"
            },
            triggerbot = {
                enabled = false,
                keybind = {
                    key = 0x0,
                    mode = "Hold",
                    active = false
                },
                delay = 50,
                magnet = false,
                teamCheck = true,
                mode = "Hold"
            },
            rcs = {
                enabled = false,
                horizontal = 50,
                vertical = 50,
                last_kickback = {x = 0, y = 0, z = 0}
            }
        },
        ["P250"] = {
            mode = "mouse",
            visible = false,
            overrideWeapon = false,
            targets = {"Players"},
            sticky = false,
            targetSelection = "Closest to crosshair",
            hitboxes = {"Head", "Pelvis"},
            fov = 60,
            visualizeFOV = false,
            visualizeFOVColor = {255, 255, 255, 255},
            fovCircleFilled = false,
            fovCircleFilledColor = {255, 255, 255, 100},
            mouseMovement = "Linear",
            maxDistance = 1000,
            visualizeTarget = false,
            targetColor = {255, 0, 0, 255},
            speedMultiplier = 3.0,
            targetSwitchDelay = 100,
            speedCurveEnabled = true,
            distanceCurveEnabled = true,
            transitionCurveEnabled = true,
            speedCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            distanceCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 0,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            transitionCurve = {
                nodes = {{
                    x = 0,
                    y = 0,
                    interpolationType = "Linear"
                }, {
                    x = 25,
                    y = 80,
                    interpolationType = "Circular"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Circular"
                }},
                interpolationType = "Circular"
            },
            triggerbot = {
                enabled = false,
                keybind = {
                    key = 0x0,
                    mode = "Hold",
                    active = false
                },
                delay = 50,
                magnet = false,
                teamCheck = true,
                mode = "Hold"
            },
            rcs = {
                enabled = false,
                horizontal = 50,
                vertical = 50,
                last_kickback = {x = 0, y = 0, z = 0}
            }
        },
        ["USP-S"] = {
            mode = "mouse",
            visible = false,
            overrideWeapon = false,
            targets = {"Players"},
            sticky = false,
            targetSelection = "Closest to crosshair",
            hitboxes = {"Head", "Pelvis"},
            fov = 60,
            visualizeFOV = false,
            visualizeFOVColor = {255, 255, 255, 255},
            fovCircleFilled = false,
            fovCircleFilledColor = {255, 255, 255, 100},
            mouseMovement = "Linear",
            maxDistance = 1000,
            visualizeTarget = false,
            targetColor = {255, 0, 0, 255},
            speedMultiplier = 3.0,
            targetSwitchDelay = 100,
            speedCurveEnabled = true,
            distanceCurveEnabled = true,
            transitionCurveEnabled = true,
            speedCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            distanceCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 0,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            transitionCurve = {
                nodes = {{
                    x = 0,
                    y = 0,
                    interpolationType = "Linear"
                }, {
                    x = 25,
                    y = 80,
                    interpolationType = "Circular"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Circular"
                }},
                interpolationType = "Circular"
            },
            triggerbot = {
                enabled = false,
                keybind = {
                    key = 0x0,
                    mode = "Hold",
                    active = false
                },
                delay = 50,
                magnet = false,
                teamCheck = true,
                mode = "Hold"
            },
            rcs = {
                enabled = false,
                horizontal = 50,
                vertical = 50,
                last_kickback = {x = 0, y = 0, z = 0}
            }
        },
        ["Tec-9"] = {
            mode = "mouse",
            visible = false,
            overrideWeapon = false,
            targets = {"Players"},
            sticky = false,
            targetSelection = "Closest to crosshair",
            hitboxes = {"Head", "Pelvis"},
            fov = 60,
            visualizeFOV = false,
            visualizeFOVColor = {255, 255, 255, 255},
            fovCircleFilled = false,
            fovCircleFilledColor = {255, 255, 255, 100},
            mouseMovement = "Linear",
            maxDistance = 1000,
            visualizeTarget = false,
            targetColor = {255, 0, 0, 255},
            speedMultiplier = 3.0,
            targetSwitchDelay = 100,
            speedCurveEnabled = true,
            distanceCurveEnabled = true,
            transitionCurveEnabled = true,
            speedCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            distanceCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 0,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            transitionCurve = {
                nodes = {{
                    x = 0,
                    y = 0,
                    interpolationType = "Linear"
                }, {
                    x = 25,
                    y = 80,
                    interpolationType = "Circular"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Circular"
                }},
                interpolationType = "Circular"
            },
            triggerbot = {
                enabled = false,
                keybind = {
                    key = 0x0,
                    mode = "Hold",
                    active = false
                },
                delay = 50,
                magnet = false,
                teamCheck = true,
                mode = "Hold"
            },
            rcs = {
                enabled = false,
                horizontal = 50,
                vertical = 50,
                last_kickback = {x = 0, y = 0, z = 0}
            }
        },
        ["CZ75-Auto"] = {
            mode = "mouse",
            visible = false,
            overrideWeapon = false,
            targets = {"Players"},
            sticky = false,
            targetSelection = "Closest to crosshair",
            hitboxes = {"Head", "Pelvis"},
            fov = 60,
            visualizeFOV = false,
            visualizeFOVColor = {255, 255, 255, 255},
            fovCircleFilled = false,
            fovCircleFilledColor = {255, 255, 255, 100},
            mouseMovement = "Linear",
            maxDistance = 1000,
            visualizeTarget = false,
            targetColor = {255, 0, 0, 255},
            speedMultiplier = 3.0,
            targetSwitchDelay = 100,
            speedCurveEnabled = true,
            distanceCurveEnabled = true,
            transitionCurveEnabled = true,
            speedCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            distanceCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 0,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            transitionCurve = {
                nodes = {{
                    x = 0,
                    y = 0,
                    interpolationType = "Linear"
                }, {
                    x = 25,
                    y = 80,
                    interpolationType = "Circular"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Circular"
                }},
                interpolationType = "Circular"
            },
            triggerbot = {
                enabled = false,
                keybind = {
                    key = 0x0,
                    mode = "Hold",
                    active = false
                },
                delay = 50,
                magnet = false,
                teamCheck = true,
                mode = "Hold"
            },
            rcs = {
                enabled = false,
                horizontal = 50,
                vertical = 50,
                last_kickback = {x = 0, y = 0, z = 0}
            }
        },
        ["MAC-10"] = {
            mode = "mouse",
            visible = false,
            overrideWeapon = false,
            targets = {"Players"},
            sticky = false,
            targetSelection = "Closest to crosshair",
            hitboxes = {"Head", "Pelvis"},
            fov = 60,
            visualizeFOV = false,
            visualizeFOVColor = {255, 255, 255, 255},
            fovCircleFilled = false,
            fovCircleFilledColor = {255, 255, 255, 100},
            mouseMovement = "Linear",
            maxDistance = 1000,
            visualizeTarget = false,
            targetColor = {255, 0, 0, 255},
            speedMultiplier = 3.0,
            targetSwitchDelay = 100,
            speedCurveEnabled = true,
            distanceCurveEnabled = true,
            transitionCurveEnabled = true,
            speedCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            distanceCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 0,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            transitionCurve = {
                nodes = {{
                    x = 0,
                    y = 0,
                    interpolationType = "Linear"
                }, {
                    x = 25,
                    y = 80,
                    interpolationType = "Circular"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Circular"
                }},
                interpolationType = "Circular"
            },
            triggerbot = {
                enabled = false,
                keybind = {
                    key = 0x0,
                    mode = "Hold",
                    active = false
                },
                delay = 50,
                magnet = false,
                teamCheck = true,
                mode = "Hold"
            },
            rcs = {
                enabled = false,
                horizontal = 50,
                vertical = 50,
                last_kickback = {x = 0, y = 0, z = 0}
            }
        },
        ["UMP-45"] = {
            mode = "mouse",
            visible = false,
            overrideWeapon = false,
            targets = {"Players"},
            sticky = false,
            targetSelection = "Closest to crosshair",
            hitboxes = {"Head", "Pelvis"},
            fov = 60,
            visualizeFOV = false,
            visualizeFOVColor = {255, 255, 255, 255},
            fovCircleFilled = false,
            fovCircleFilledColor = {255, 255, 255, 100},
            mouseMovement = "Linear",
            maxDistance = 1000,
            visualizeTarget = false,
            targetColor = {255, 0, 0, 255},
            speedMultiplier = 3.0,
            targetSwitchDelay = 100,
            speedCurveEnabled = true,
            distanceCurveEnabled = true,
            transitionCurveEnabled = true,
            speedCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            distanceCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 0,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            transitionCurve = {
                nodes = {{
                    x = 0,
                    y = 0,
                    interpolationType = "Linear"
                }, {
                    x = 25,
                    y = 80,
                    interpolationType = "Circular"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Circular"
                }},
                interpolationType = "Circular"
            },
            triggerbot = {
                enabled = false,
                keybind = {
                    key = 0x0,
                    mode = "Hold",
                    active = false
                },
                delay = 50,
                magnet = false,
                teamCheck = true,
                mode = "Hold"
            },
            rcs = {
                enabled = false,
                horizontal = 50,
                vertical = 50,
                last_kickback = {x = 0, y = 0, z = 0}
            }
        },
        ["PP-Bizon"] = {
            mode = "mouse",
            visible = false,
            overrideWeapon = false,
            targets = {"Players"},
            sticky = false,
            targetSelection = "Closest to crosshair",
            hitboxes = {"Head", "Pelvis"},
            fov = 60,
            visualizeFOV = false,
            visualizeFOVColor = {255, 255, 255, 255},
            fovCircleFilled = false,
            fovCircleFilledColor = {255, 255, 255, 100},
            mouseMovement = "Linear",
            maxDistance = 1000,
            visualizeTarget = false,
            targetColor = {255, 0, 0, 255},
            speedMultiplier = 3.0,
            targetSwitchDelay = 100,
            speedCurveEnabled = true,
            distanceCurveEnabled = true,
            transitionCurveEnabled = true,
            speedCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            distanceCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 0,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            transitionCurve = {
                nodes = {{
                    x = 0,
                    y = 0,
                    interpolationType = "Linear"
                }, {
                    x = 25,
                    y = 80,
                    interpolationType = "Circular"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Circular"
                }},
                interpolationType = "Circular"
            },
            triggerbot = {
                enabled = false,
                keybind = {
                    key = 0x0,
                    mode = "Hold",
                    active = false
                },
                delay = 50,
                magnet = false,
                teamCheck = true,
                mode = "Hold"
            },
            rcs = {
                enabled = false,
                horizontal = 50,
                vertical = 50,
                last_kickback = {x = 0, y = 0, z = 0}
            }
        },
        ["MP7"] = {
            mode = "mouse",
            visible = false,
            overrideWeapon = false,
            targets = {"Players"},
            sticky = false,
            targetSelection = "Closest to crosshair",
            hitboxes = {"Head", "Pelvis"},
            fov = 60,
            visualizeFOV = false,
            visualizeFOVColor = {255, 255, 255, 255},
            fovCircleFilled = false,
            fovCircleFilledColor = {255, 255, 255, 100},
            mouseMovement = "Linear",
            maxDistance = 1000,
            visualizeTarget = false,
            targetColor = {255, 0, 0, 255},
            speedMultiplier = 3.0,
            targetSwitchDelay = 100,
            speedCurveEnabled = true,
            distanceCurveEnabled = true,
            transitionCurveEnabled = true,
            speedCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            distanceCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 0,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            transitionCurve = {
                nodes = {{
                    x = 0,
                    y = 0,
                    interpolationType = "Linear"
                }, {
                    x = 25,
                    y = 80,
                    interpolationType = "Circular"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Circular"
                }},
                interpolationType = "Circular"
            },
            triggerbot = {
                enabled = false,
                keybind = {
                    key = 0x0,
                    mode = "Hold",
                    active = false
                },
                delay = 50,
                magnet = false,
                teamCheck = true,
                mode = "Hold"
            },
            rcs = {
                enabled = false,
                horizontal = 50,
                vertical = 50,
                last_kickback = {x = 0, y = 0, z = 0}
            }
        },
        ["MP9"] = {
            mode = "mouse",
            visible = false,
            overrideWeapon = false,
            targets = {"Players"},
            sticky = false,
            targetSelection = "Closest to crosshair",
            hitboxes = {"Head", "Pelvis"},
            fov = 60,
            visualizeFOV = false,
            visualizeFOVColor = {255, 255, 255, 255},
            fovCircleFilled = false,
            fovCircleFilledColor = {255, 255, 255, 100},
            mouseMovement = "Linear",
            maxDistance = 1000,
            visualizeTarget = false,
            targetColor = {255, 0, 0, 255},
            speedMultiplier = 3.0,
            targetSwitchDelay = 100,
            speedCurveEnabled = true,
            distanceCurveEnabled = true,
            transitionCurveEnabled = true,
            speedCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            distanceCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 0,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            transitionCurve = {
                nodes = {{
                    x = 0,
                    y = 0,
                    interpolationType = "Linear"
                }, {
                    x = 25,
                    y = 80,
                    interpolationType = "Circular"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Circular"
                }},
                interpolationType = "Circular"
            },
            triggerbot = {
                enabled = false,
                keybind = {
                    key = 0x0,
                    mode = "Hold",
                    active = false
                },
                delay = 50,
                magnet = false,
                teamCheck = true,
                mode = "Hold"
            },
            rcs = {
                enabled = false,
                horizontal = 50,
                vertical = 50,
                last_kickback = {x = 0, y = 0, z = 0}
            }
        },
        ["P90"] = {
            mode = "mouse",
            visible = false,
            overrideWeapon = false,
            targets = {"Players"},
            sticky = false,
            targetSelection = "Closest to crosshair",
            hitboxes = {"Head", "Pelvis"},
            fov = 60,
            visualizeFOV = false,
            visualizeFOVColor = {255, 255, 255, 255},
            fovCircleFilled = false,
            fovCircleFilledColor = {255, 255, 255, 100},
            mouseMovement = "Linear",
            maxDistance = 1000,
            visualizeTarget = false,
            targetColor = {255, 0, 0, 255},
            speedMultiplier = 3.0,
            targetSwitchDelay = 100,
            speedCurveEnabled = true,
            distanceCurveEnabled = true,
            transitionCurveEnabled = true,
            speedCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            distanceCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 0,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            transitionCurve = {
                nodes = {{
                    x = 0,
                    y = 0,
                    interpolationType = "Linear"
                }, {
                    x = 25,
                    y = 80,
                    interpolationType = "Circular"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Circular"
                }},
                interpolationType = "Circular"
            },
            triggerbot = {
                enabled = false,
                keybind = {
                    key = 0x0,
                    mode = "Hold",
                    active = false
                },
                delay = 50,
                magnet = false,
                teamCheck = true,
                mode = "Hold"
            },
            rcs = {
                enabled = false,
                horizontal = 50,
                vertical = 50,
                last_kickback = {x = 0, y = 0, z = 0}
            }
        },
        ["Galil AR"] = {
            mode = "mouse",
            visible = false,
            overrideWeapon = false,
            targets = {"Players"},
            sticky = false,
            targetSelection = "Closest to crosshair",
            hitboxes = {"Head", "Pelvis"},
            fov = 60,
            visualizeFOV = false,
            visualizeFOVColor = {255, 255, 255, 255},
            fovCircleFilled = false,
            fovCircleFilledColor = {255, 255, 255, 100},
            mouseMovement = "Linear",
            maxDistance = 1000,
            visualizeTarget = false,
            targetColor = {255, 0, 0, 255},
            speedMultiplier = 3.0,
            targetSwitchDelay = 100,
            speedCurveEnabled = true,
            distanceCurveEnabled = true,
            transitionCurveEnabled = true,
            speedCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            distanceCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 0,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            transitionCurve = {
                nodes = {{
                    x = 0,
                    y = 0,
                    interpolationType = "Linear"
                }, {
                    x = 25,
                    y = 80,
                    interpolationType = "Circular"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Circular"
                }},
                interpolationType = "Circular"
            },
            triggerbot = {
                enabled = false,
                keybind = {
                    key = 0x0,
                    mode = "Hold",
                    active = false
                },
                delay = 50,
                magnet = false,
                teamCheck = true,
                mode = "Hold"
            },
            rcs = {
                enabled = false,
                horizontal = 50,
                vertical = 50,
                last_kickback = {x = 0, y = 0, z = 0}
            }
        },
        ["FAMAS"] = {
            mode = "mouse",
            visible = false,
            overrideWeapon = false,
            targets = {"Players"},
            sticky = false,
            targetSelection = "Closest to crosshair",
            hitboxes = {"Head", "Pelvis"},
            fov = 60,
            visualizeFOV = false,
            visualizeFOVColor = {255, 255, 255, 255},
            fovCircleFilled = false,
            fovCircleFilledColor = {255, 255, 255, 100},
            mouseMovement = "Linear",
            maxDistance = 1000,
            visualizeTarget = false,
            targetColor = {255, 0, 0, 255},
            speedMultiplier = 3.0,
            targetSwitchDelay = 100,
            speedCurveEnabled = true,
            distanceCurveEnabled = true,
            transitionCurveEnabled = true,
            speedCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            distanceCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 0,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            transitionCurve = {
                nodes = {{
                    x = 0,
                    y = 0,
                    interpolationType = "Linear"
                }, {
                    x = 25,
                    y = 80,
                    interpolationType = "Circular"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Circular"
                }},
                interpolationType = "Circular"
            },
            triggerbot = {
                enabled = false,
                keybind = {
                    key = 0x0,
                    mode = "Hold",
                    active = false
                },
                delay = 50,
                magnet = false,
                teamCheck = true,
                mode = "Hold"
            },
            rcs = {
                enabled = false,
                horizontal = 50,
                vertical = 50,
                last_kickback = {x = 0, y = 0, z = 0}
            }
        },
        ["M4A1-S"] = {
            mode = "mouse",
            visible = false,
            overrideWeapon = false,
            targets = {"Players"},
            sticky = false,
            targetSelection = "Closest to crosshair",
            hitboxes = {"Head", "Pelvis"},
            fov = 60,
            visualizeFOV = false,
            visualizeFOVColor = {255, 255, 255, 255},
            fovCircleFilled = false,
            fovCircleFilledColor = {255, 255, 255, 100},
            mouseMovement = "Linear",
            maxDistance = 1000,
            visualizeTarget = false,
            targetColor = {255, 0, 0, 255},
            speedMultiplier = 3.0,
            targetSwitchDelay = 100,
            speedCurveEnabled = true,
            distanceCurveEnabled = true,
            transitionCurveEnabled = true,
            speedCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            distanceCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 0,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            transitionCurve = {
                nodes = {{
                    x = 0,
                    y = 0,
                    interpolationType = "Linear"
                }, {
                    x = 25,
                    y = 80,
                    interpolationType = "Circular"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Circular"
                }},
                interpolationType = "Circular"
            },
            triggerbot = {
                enabled = false,
                keybind = {
                    key = 0x0,
                    mode = "Hold",
                    active = false
                },
                delay = 50,
                magnet = false,
                teamCheck = true,
                mode = "Hold"
            },
            rcs = {
                enabled = false,
                horizontal = 50,
                vertical = 50,
                last_kickback = {x = 0, y = 0, z = 0}
            }
        },
        ["M4A4"] = {
            mode = "mouse",
            visible = false,
            overrideWeapon = false,
            targets = {"Players"},
            sticky = false,
            targetSelection = "Closest to crosshair",
            hitboxes = {"Head", "Pelvis"},
            fov = 60,
            visualizeFOV = false,
            visualizeFOVColor = {255, 255, 255, 255},
            fovCircleFilled = false,
            fovCircleFilledColor = {255, 255, 255, 100},
            mouseMovement = "Linear",
            maxDistance = 1000,
            visualizeTarget = false,
            targetColor = {255, 0, 0, 255},
            speedMultiplier = 3.0,
            targetSwitchDelay = 100,
            speedCurveEnabled = true,
            distanceCurveEnabled = true,
            transitionCurveEnabled = true,
            speedCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            distanceCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 0,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            transitionCurve = {
                nodes = {{
                    x = 0,
                    y = 0,
                    interpolationType = "Linear"
                }, {
                    x = 25,
                    y = 80,
                    interpolationType = "Circular"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Circular"
                }},
                interpolationType = "Circular"
            },
            triggerbot = {
                enabled = false,
                keybind = {
                    key = 0x0,
                    mode = "Hold",
                    active = false
                },
                delay = 50,
                magnet = false,
                teamCheck = true,
                mode = "Hold"
            },
            rcs = {
                enabled = false,
                horizontal = 50,
                vertical = 50,
                last_kickback = {x = 0, y = 0, z = 0}
            }
        },
        ["AUG"] = {
            mode = "mouse",
            visible = false,
            overrideWeapon = false,
            targets = {"Players"},
            sticky = false,
            targetSelection = "Closest to crosshair",
            hitboxes = {"Head", "Pelvis"},
            fov = 60,
            visualizeFOV = false,
            visualizeFOVColor = {255, 255, 255, 255},
            fovCircleFilled = false,
            fovCircleFilledColor = {255, 255, 255, 100},
            mouseMovement = "Linear",
            maxDistance = 1000,
            visualizeTarget = false,
            targetColor = {255, 0, 0, 255},
            speedMultiplier = 3.0,
            targetSwitchDelay = 100,
            speedCurveEnabled = true,
            distanceCurveEnabled = true,
            transitionCurveEnabled = true,
            speedCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            distanceCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 0,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            transitionCurve = {
                nodes = {{
                    x = 0,
                    y = 0,
                    interpolationType = "Linear"
                }, {
                    x = 25,
                    y = 80,
                    interpolationType = "Circular"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Circular"
                }},
                interpolationType = "Circular"
            },
            triggerbot = {
                enabled = false,
                keybind = {
                    key = 0x0,
                    mode = "Hold",
                    active = false
                },
                delay = 50,
                magnet = false,
                teamCheck = true,
                mode = "Hold"
            },
            rcs = {
                enabled = false,
                horizontal = 50,
                vertical = 50,
                last_kickback = {x = 0, y = 0, z = 0}
            }
        },
        ["SG 553"] = {
            mode = "mouse",
            visible = false,
            overrideWeapon = false,
            targets = {"Players"},
            sticky = false,
            targetSelection = "Closest to crosshair",
            hitboxes = {"Head", "Pelvis"},
            fov = 60,
            visualizeFOV = false,
            visualizeFOVColor = {255, 255, 255, 255},
            fovCircleFilled = false,
            fovCircleFilledColor = {255, 255, 255, 100},
            mouseMovement = "Linear",
            maxDistance = 1000,
            visualizeTarget = false,
            targetColor = {255, 0, 0, 255},
            speedMultiplier = 3.0,
            targetSwitchDelay = 100,
            speedCurveEnabled = true,
            distanceCurveEnabled = true,
            transitionCurveEnabled = true,
            speedCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            distanceCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 0,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            transitionCurve = {
                nodes = {{
                    x = 0,
                    y = 0,
                    interpolationType = "Linear"
                }, {
                    x = 25,
                    y = 80,
                    interpolationType = "Circular"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Circular"
                }},
                interpolationType = "Circular"
            },
            triggerbot = {
                enabled = false,
                keybind = {
                    key = 0x0,
                    mode = "Hold",
                    active = false
                },
                delay = 50,
                magnet = false,
                teamCheck = true,
                mode = "Hold"
            },
            rcs = {
                enabled = false,
                horizontal = 50,
                vertical = 50,
                last_kickback = {x = 0, y = 0, z = 0}
            }
        },
        ["AK-47"] = {
            mode = "mouse",
            visible = false,
            overrideWeapon = false,
            targets = {"Players"},
            sticky = false,
            targetSelection = "Closest to crosshair",
            hitboxes = {"Head", "Pelvis"},
            fov = 60,
            visualizeFOV = false,
            visualizeFOVColor = {255, 255, 255, 255},
            fovCircleFilled = false,
            fovCircleFilledColor = {255, 255, 255, 100},
            mouseMovement = "Linear",
            maxDistance = 1000,
            visualizeTarget = false,
            targetColor = {255, 0, 0, 255},
            speedMultiplier = 3.0,
            targetSwitchDelay = 100,
            speedCurveEnabled = true,
            distanceCurveEnabled = true,
            transitionCurveEnabled = true,
            speedCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            distanceCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 0,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            transitionCurve = {
                nodes = {{
                    x = 0,
                    y = 0,
                    interpolationType = "Linear"
                }, {
                    x = 25,
                    y = 80,
                    interpolationType = "Circular"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Circular"
                }},
                interpolationType = "Circular"
            },
            triggerbot = {
                enabled = false,
                keybind = {
                    key = 0x0,
                    mode = "Hold",
                    active = false
                },
                delay = 50,
                magnet = false,
                teamCheck = true,
                mode = "Hold"
            },
            rcs = {
                enabled = false,
                horizontal = 50,
                vertical = 50,
                last_kickback = {x = 0, y = 0, z = 0}
            }
        },
        ["G3SG1"] = {
            mode = "mouse",
            visible = false,
            overrideWeapon = false,
            targets = {"Players"},
            sticky = false,
            targetSelection = "Closest to crosshair",
            hitboxes = {"Head", "Pelvis"},
            fov = 60,
            visualizeFOV = false,
            visualizeFOVColor = {255, 255, 255, 255},
            fovCircleFilled = false,
            fovCircleFilledColor = {255, 255, 255, 100},
            mouseMovement = "Linear",
            maxDistance = 1000,
            visualizeTarget = false,
            targetColor = {255, 0, 0, 255},
            speedMultiplier = 3.0,
            targetSwitchDelay = 100,
            speedCurveEnabled = true,
            distanceCurveEnabled = true,
            transitionCurveEnabled = true,
            speedCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            distanceCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 0,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            transitionCurve = {
                nodes = {{
                    x = 0,
                    y = 0,
                    interpolationType = "Linear"
                }, {
                    x = 25,
                    y = 80,
                    interpolationType = "Circular"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Circular"
                }},
                interpolationType = "Circular"
            },
            triggerbot = {
                enabled = false,
                keybind = {
                    key = 0x0,
                    mode = "Hold",
                    active = false
                },
                delay = 50,
                magnet = false,
                teamCheck = true,
                mode = "Hold"
            },
            rcs = {
                enabled = false,
                horizontal = 50,
                vertical = 50,
                last_kickback = {x = 0, y = 0, z = 0}
            }
        },
        ["SCAR-20"] = {
            mode = "mouse",
            visible = false,
            overrideWeapon = false,
            targets = {"Players"},
            sticky = false,
            targetSelection = "Closest to crosshair",
            hitboxes = {"Head", "Pelvis"},
            fov = 60,
            visualizeFOV = false,
            visualizeFOVColor = {255, 255, 255, 255},
            fovCircleFilled = false,
            fovCircleFilledColor = {255, 255, 255, 100},
            mouseMovement = "Linear",
            maxDistance = 1000,
            visualizeTarget = false,
            targetColor = {255, 0, 0, 255},
            speedMultiplier = 3.0,
            targetSwitchDelay = 100,
            speedCurveEnabled = true,
            distanceCurveEnabled = true,
            transitionCurveEnabled = true,
            speedCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            distanceCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 0,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            transitionCurve = {
                nodes = {{
                    x = 0,
                    y = 0,
                    interpolationType = "Linear"
                }, {
                    x = 25,
                    y = 80,
                    interpolationType = "Circular"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Circular"
                }},
                interpolationType = "Circular"
            },
            triggerbot = {
                enabled = false,
                keybind = {
                    key = 0x0,
                    mode = "Hold",
                    active = false
                },
                delay = 50,
                magnet = false,
                teamCheck = true,
                mode = "Hold"
            },
            rcs = {
                enabled = false,
                horizontal = 50,
                vertical = 50,
                last_kickback = {x = 0, y = 0, z = 0}
            }
        },
        ["AWP"] = {
            mode = "mouse",
            visible = false,
            overrideWeapon = false,
            targets = {"Players"},
            sticky = false,
            targetSelection = "Closest to crosshair",
            hitboxes = {"Head", "Pelvis"},
            fov = 60,
            visualizeFOV = false,
            visualizeFOVColor = {255, 255, 255, 255},
            fovCircleFilled = false,
            fovCircleFilledColor = {255, 255, 255, 100},
            mouseMovement = "Linear",
            maxDistance = 1000,
            visualizeTarget = false,
            targetColor = {255, 0, 0, 255},
            speedMultiplier = 3.0,
            targetSwitchDelay = 100,
            speedCurveEnabled = true,
            distanceCurveEnabled = true,
            transitionCurveEnabled = true,
            speedCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            distanceCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 0,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            transitionCurve = {
                nodes = {{
                    x = 0,
                    y = 0,
                    interpolationType = "Linear"
                }, {
                    x = 25,
                    y = 80,
                    interpolationType = "Circular"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Circular"
                }},
                interpolationType = "Circular"
            },
            triggerbot = {
                enabled = false,
                keybind = {
                    key = 0x0,
                    mode = "Hold",
                    active = false
                },
                delay = 50,
                magnet = false,
                teamCheck = true,
                mode = "Hold"
            },
            rcs = {
                enabled = false,
                horizontal = 50,
                vertical = 50,
                last_kickback = {x = 0, y = 0, z = 0}
            }
        },
        ["SSG 08"] = {
            mode = "mouse",
            visible = false,
            overrideWeapon = false,
            targets = {"Players"},
            sticky = false,
            targetSelection = "Closest to crosshair",
            hitboxes = {"Head", "Pelvis"},
            fov = 60,
            visualizeFOV = false,
            visualizeFOVColor = {255, 255, 255, 255},
            fovCircleFilled = false,
            fovCircleFilledColor = {255, 255, 255, 100},
            mouseMovement = "Linear",
            maxDistance = 1000,
            visualizeTarget = false,
            targetColor = {255, 0, 0, 255},
            speedMultiplier = 3.0,
            targetSwitchDelay = 100,
            speedCurveEnabled = true,
            distanceCurveEnabled = true,
            transitionCurveEnabled = true,
            speedCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            distanceCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 0,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            transitionCurve = {
                nodes = {{
                    x = 0,
                    y = 0,
                    interpolationType = "Linear"
                }, {
                    x = 25,
                    y = 80,
                    interpolationType = "Circular"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Circular"
                }},
                interpolationType = "Circular"
            },
            triggerbot = {
                enabled = false,
                keybind = {
                    key = 0x0,
                    mode = "Hold",
                    active = false
                },
                delay = 50,
                magnet = false,
                teamCheck = true,
                mode = "Hold"
            },
            rcs = {
                enabled = false,
                horizontal = 50,
                vertical = 50,
                last_kickback = {x = 0, y = 0, z = 0}
            }
        },
        ["XM1014"] = {
            mode = "mouse",
            visible = false,
            overrideWeapon = false,
            targets = {"Players"},
            sticky = false,
            targetSelection = "Closest to crosshair",
            hitboxes = {"Head", "Pelvis"},
            fov = 60,
            visualizeFOV = false,
            visualizeFOVColor = {255, 255, 255, 255},
            fovCircleFilled = false,
            fovCircleFilledColor = {255, 255, 255, 100},
            mouseMovement = "Linear",
            maxDistance = 1000,
            visualizeTarget = false,
            targetColor = {255, 0, 0, 255},
            speedMultiplier = 3.0,
            targetSwitchDelay = 100,
            speedCurveEnabled = true,
            distanceCurveEnabled = true,
            transitionCurveEnabled = true,
            speedCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            distanceCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 0,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            transitionCurve = {
                nodes = {{
                    x = 0,
                    y = 0,
                    interpolationType = "Linear"
                }, {
                    x = 25,
                    y = 80,
                    interpolationType = "Circular"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Circular"
                }},
                interpolationType = "Circular"
            },
            triggerbot = {
                enabled = false,
                keybind = {
                    key = 0x0,
                    mode = "Hold",
                    active = false
                },
                delay = 50,
                magnet = false,
                teamCheck = true,
                mode = "Hold"
            },
            rcs = {
                enabled = false,
                horizontal = 50,
                vertical = 50,
                last_kickback = {x = 0, y = 0, z = 0}
            }
        },
        ["Sawed-Off"] = {
            mode = "mouse",
            visible = false,
            overrideWeapon = false,
            targets = {"Players"},
            sticky = false,
            targetSelection = "Closest to crosshair",
            hitboxes = {"Head", "Pelvis"},
            fov = 60,
            visualizeFOV = false,
            visualizeFOVColor = {255, 255, 255, 255},
            fovCircleFilled = false,
            fovCircleFilledColor = {255, 255, 255, 100},
            mouseMovement = "Linear",
            maxDistance = 1000,
            visualizeTarget = false,
            targetColor = {255, 0, 0, 255},
            speedMultiplier = 3.0,
            targetSwitchDelay = 100,
            speedCurveEnabled = true,
            distanceCurveEnabled = true,
            transitionCurveEnabled = true,
            speedCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            distanceCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 0,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            transitionCurve = {
                nodes = {{
                    x = 0,
                    y = 0,
                    interpolationType = "Linear"
                }, {
                    x = 25,
                    y = 80,
                    interpolationType = "Circular"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Circular"
                }},
                interpolationType = "Circular"
            },
            triggerbot = {
                enabled = false,
                keybind = {
                    key = 0x0,
                    mode = "Hold",
                    active = false
                },
                delay = 50,
                magnet = false,
                teamCheck = true,
                mode = "Hold"
            },
            rcs = {
                enabled = false,
                horizontal = 50,
                vertical = 50,
                last_kickback = {x = 0, y = 0, z = 0}
            }
        },
        ["MAG-7"] = {
            mode = "mouse",
            visible = false,
            overrideWeapon = false,
            targets = {"Players"},
            sticky = false,
            targetSelection = "Closest to crosshair",
            hitboxes = {"Head", "Pelvis"},
            fov = 60,
            visualizeFOV = false,
            visualizeFOVColor = {255, 255, 255, 255},
            fovCircleFilled = false,
            fovCircleFilledColor = {255, 255, 255, 100},
            mouseMovement = "Linear",
            maxDistance = 1000,
            visualizeTarget = false,
            targetColor = {255, 0, 0, 255},
            speedMultiplier = 3.0,
            targetSwitchDelay = 100,
            speedCurveEnabled = true,
            distanceCurveEnabled = true,
            transitionCurveEnabled = true,
            speedCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            distanceCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 0,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            transitionCurve = {
                nodes = {{
                    x = 0,
                    y = 0,
                    interpolationType = "Linear"
                }, {
                    x = 25,
                    y = 80,
                    interpolationType = "Circular"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Circular"
                }},
                interpolationType = "Circular"
            },
            triggerbot = {
                enabled = false,
                keybind = {
                    key = 0x0,
                    mode = "Hold",
                    active = false
                },
                delay = 50,
                magnet = false,
                teamCheck = true,
                mode = "Hold"
            },
            rcs = {
                enabled = false,
                horizontal = 50,
                vertical = 50,
                last_kickback = {x = 0, y = 0, z = 0}
            }
        },
        ["Nova"] = {
            mode = "mouse",
            visible = false,
            overrideWeapon = false,
            targets = {"Players"},
            sticky = false,
            targetSelection = "Closest to crosshair",
            hitboxes = {"Head", "Pelvis"},
            fov = 60,
            visualizeFOV = false,
            visualizeFOVColor = {255, 255, 255, 255},
            fovCircleFilled = false,
            fovCircleFilledColor = {255, 255, 255, 100},
            mouseMovement = "Linear",
            maxDistance = 1000,
            visualizeTarget = false,
            targetColor = {255, 0, 0, 255},
            speedMultiplier = 3.0,
            targetSwitchDelay = 100,
            speedCurveEnabled = true,
            distanceCurveEnabled = true,
            transitionCurveEnabled = true,
            speedCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            distanceCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 0,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            transitionCurve = {
                nodes = {{
                    x = 0,
                    y = 0,
                    interpolationType = "Linear"
                }, {
                    x = 25,
                    y = 80,
                    interpolationType = "Circular"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Circular"
                }},
                interpolationType = "Circular"
            },
            triggerbot = {
                enabled = false,
                keybind = {
                    key = 0x0,
                    mode = "Hold",
                    active = false
                },
                delay = 50,
                magnet = false,
                teamCheck = true,
                mode = "Hold"
            },
            rcs = {
                enabled = false,
                horizontal = 50,
                vertical = 50,
                last_kickback = {x = 0, y = 0, z = 0}
            }
        },
        ["Negev"] = {
            mode = "mouse",
            visible = false,
            overrideWeapon = false,
            targets = {"Players"},
            sticky = false,
            targetSelection = "Closest to crosshair",
            hitboxes = {"Head", "Pelvis"},
            fov = 60,
            visualizeFOV = false,
            visualizeFOVColor = {255, 255, 255, 255},
            fovCircleFilled = false,
            fovCircleFilledColor = {255, 255, 255, 100},
            mouseMovement = "Linear",
            maxDistance = 1000,
            visualizeTarget = false,
            targetColor = {255, 0, 0, 255},
            speedMultiplier = 3.0,
            targetSwitchDelay = 100,
            speedCurveEnabled = true,
            distanceCurveEnabled = true,
            transitionCurveEnabled = true,
            speedCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            distanceCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 0,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            transitionCurve = {
                nodes = {{
                    x = 0,
                    y = 0,
                    interpolationType = "Linear"
                }, {
                    x = 25,
                    y = 80,
                    interpolationType = "Circular"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Circular"
                }},
                interpolationType = "Circular"
            },
            triggerbot = {
                enabled = false,
                keybind = {
                    key = 0x0,
                    mode = "Hold",
                    active = false
                },
                delay = 50,
                magnet = false,
                teamCheck = true,
                mode = "Hold"
            },
            rcs = {
                enabled = false,
                horizontal = 50,
                vertical = 50,
                last_kickback = {x = 0, y = 0, z = 0}
            }
        },
        ["M249"] = {
            mode = "mouse",
            visible = false,
            overrideWeapon = false,
            targets = {"Players"},
            sticky = false,
            targetSelection = "Closest to crosshair",
            hitboxes = {"Head", "Pelvis"},
            fov = 60,
            visualizeFOV = false,
            visualizeFOVColor = {255, 255, 255, 255},
            fovCircleFilled = false,
            fovCircleFilledColor = {255, 255, 255, 100},
            mouseMovement = "Linear",
            maxDistance = 1000,
            visualizeTarget = false,
            targetColor = {255, 0, 0, 255},
            speedMultiplier = 3.0,
            targetSwitchDelay = 100,
            speedCurveEnabled = true,
            distanceCurveEnabled = true,
            transitionCurveEnabled = true,
            speedCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            distanceCurve = {
                nodes = {{
                    x = 0,
                    y = 100,
                    interpolationType = "Linear"
                }, {
                    x = 100,
                    y = 0,
                    interpolationType = "Linear"
                }},
                interpolationType = "Linear"
            },
            transitionCurve = {
                nodes = {{
                    x = 0,
                    y = 0,
                    interpolationType = "Linear"
                }, {
                    x = 25,
                    y = 80,
                    interpolationType = "Circular"
                }, {
                    x = 100,
                    y = 100,
                    interpolationType = "Circular"
                }},
                interpolationType = "Circular"
            }
        }
    }
}
local weapon_keyset = {}
local wpn_display = {}
weapon_keyset[1] = "Default"
local n = 1
for k, v in pairs(AimbotConfig.weapons) do
    if k ~= "Default" then
        n = n + 1
        weapon_keyset[n] = k
        wpn_display[n] = k
    end
end
function updateWeaponKeyset()
    weapon_keyset = {}
    wpn_display = {}
    weapon_keyset[1] = "Default"
    local n = 1
    for k, v in pairs(AimbotConfig.weapons) do
        if k ~= "Default" then
            n = n + 1
            weapon_keyset[n] = k
            wpn_display[n] = k
        end
    end

end

function getWeaponConfig(weaponName)
    weaponName = weapon_name_map[weaponName]
    if weaponName and weaponName ~= "Default" then
        if AimbotConfig.weapons[weaponName].overrideWeapon then
            ensureWeaponConfig(weaponName)
            updateWeaponKeyset()
            return AimbotConfig.weapons[weaponName]
        end
    end
    return AimbotConfig.weapons["Default"]
end
function ensureWeaponConfig(weaponName)
    if weaponName and weaponName ~= "Default" and not AimbotConfig.weapons[weaponName] then
        local defaultConfig = AimbotConfig.weapons["Default"]
        AimbotConfig.weapons[weaponName] = {}
        for key, value in pairs(defaultConfig) do
            if type(value) == "table" then
                AimbotConfig.weapons[weaponName][key] = {}
                for k, v in pairs(value) do
                    AimbotConfig.weapons[weaponName][key][k] = v
                end
            else
                AimbotConfig.weapons[weaponName][key] = value
            end
        end
    end
end


local MovementTracker = {
    targets = {},
    maxHistoryFrames = 30,
    consistencyThreshold = 8,
    crossingPointThreshold = 0.3,
    patternAnalysisFrames = 15,
    zigzagDetectionFrames = 10,
    addMovement = function(self, targetId, velocity, position)
        if not targetId or not position or not position.x or not position.y or not position.z then
            return
        end
        if not self.targets[targetId] then
            self.targets[targetId] = {
                history = {},
                lastPosition = vector(position.x, position.y, position.z),
                consistentFrames = 0,
                lastDirection = vector(0, 0, 0),
                crossingPoint = vector(0, 0, 0),
                crossingDetected = false,
                directionChanges = 0,
                movementPatterns = {},
                averageVelocity = vector(0, 0, 0),
                velocityVariance = 0,
                directionVariance = 0,
                predictability = 0.5,
                zigzagDetected = false,
                zigzagFrequency = 0,
                patternConfidence = 0,
                strafePattern = {
                    left = 0,
                    right = 0,
                    forward = 0,
                    backward = 0
                },
                firstContactTime = utility.get_tickcount(),
                lastUpdateTime = utility.get_tickcount(),
                totalObservationTime = 0,
                reactiveMovement = false,
                baselineEstablished = false,
                baselineMovement = vector(0, 0, 0),
                reactionThreshold = 3.0
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
                currentDirection = vector(velocity.x / vel_magnitude, velocity.y / vel_magnitude,
                    velocity.z / vel_magnitude)
            end
        end
        local directionChange = 0
        if target.lastDirection and currentDirection then
            local lastDir = target.lastDirection
            if lastDir.x and lastDir.y and lastDir.z and currentDirection.x and currentDirection.y and
                currentDirection.z then
                directionChange = (lastDir.x * currentDirection.x) + (lastDir.y * currentDirection.y) +
                                      (lastDir.z * currentDirection.z)
            end
        end
        if directionChange < 0.3 and target.lastDirection:length() > 0.1 then
            target.directionChanges = target.directionChanges + 1
        end
        if directionChange > 0.8 then
            target.consistentFrames = math.min(target.consistentFrames + 1, self.maxHistoryFrames)
        else
            target.consistentFrames = 0
        end
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
        self:analyzeMovementPatterns(targetId)
        self:detectZigzagPattern(targetId)
        self:calculatePredictability(targetId)
        self:detectReactiveMovement(targetId)
        target.lastDirection = currentDirection
        target.lastPosition = vector(position.x, position.y, position.z)
    end,
    analyzeMovementPatterns = function(self, targetId)
        local target = self.targets[targetId]
        if not target or #target.history < self.patternAnalysisFrames then
            return
        end
        local recentHistory = {}
        local startIdx = math.max(1, #target.history - self.patternAnalysisFrames + 1)
        for i = startIdx, #target.history do
            table.insert(recentHistory, target.history[i])
        end
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
            target.averageVelocity = vector(totalVelocity.x / velocityCount, totalVelocity.y / velocityCount,
                totalVelocity.z / velocityCount)
        end
        local varianceSum = 0
        for _, frame in ipairs(recentHistory) do
            if frame.velocity then
                local diff = vector(frame.velocity.x - target.averageVelocity.x,
                    frame.velocity.y - target.averageVelocity.y, frame.velocity.z - target.averageVelocity.z)
                varianceSum = varianceSum + diff:length_sqr()
            end
        end
        target.velocityVariance = velocityCount > 0 and (varianceSum / velocityCount) or 0
        target.strafePattern = {
            left = 0,
            right = 0,
            forward = 0,
            backward = 0
        }
        for _, frame in ipairs(recentHistory) do
            if frame.velocity then
                if frame.velocity.x > 1.0 then
                    target.strafePattern.right = target.strafePattern.right + 1
                end
                if frame.velocity.x < -1.0 then
                    target.strafePattern.left = target.strafePattern.left + 1
                end
                if frame.velocity.z > 1.0 then
                    target.strafePattern.forward = target.strafePattern.forward + 1
                end
                if frame.velocity.z < -1.0 then
                    target.strafePattern.backward = target.strafePattern.backward + 1
                end
            end
        end
    end,
    detectZigzagPattern = function(self, targetId)
        local target = self.targets[targetId]
        if not target or #target.history < self.zigzagDetectionFrames then
            return
        end
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
                if currentXDir ~= 0 then
                    lastXDirection = currentXDir
                end
                if currentZDir ~= 0 then
                    lastZDirection = currentZDir
                end
            end
        end
        target.zigzagFrequency = directionSwitches / recentFrames
        target.zigzagDetected = target.zigzagFrequency > 0.2
    end,
    calculatePredictability = function(self, targetId)
        local target = self.targets[targetId]
        if not target or #target.history < 5 then
            target.predictability = 0.5
            return
        end
        local consistencyScore = math.min(target.consistentFrames / self.consistencyThreshold, 1.0)
        local varianceScore = math.max(0, 1.0 - (target.velocityVariance / 100))
        local zigzagPenalty = target.zigzagDetected and 0.2 or 0
        local observationBonus = math.min(target.totalObservationTime / 5000, 0.2)
        local basePredictability = (consistencyScore * 0.4) + (varianceScore * 0.4) + observationBonus
        target.predictability = math.max(0.1, math.min(1.0, basePredictability - zigzagPenalty))
        if target.velocityVariance < 20 and not target.zigzagDetected then
            target.patternConfidence = math.min(1.0, target.patternConfidence + 0.02)
        else
            target.patternConfidence = math.max(0, target.patternConfidence - 0.05)
        end
    end,
    detectReactiveMovement = function(self, targetId)
        local target = self.targets[targetId]
        if not target or #target.history < 10 then
            return
        end
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
            target.baselineMovement = vector(totalVel.x / baselineFrames, totalVel.y / baselineFrames,
                totalVel.z / baselineFrames)
            target.baselineEstablished = true
        end
        if target.baselineEstablished and #target.history >= 3 then
            local recentFrame = target.history[#target.history]
            if recentFrame and recentFrame.velocity then
                local velocityDifference = vector(recentFrame.velocity.x - target.baselineMovement.x,
                    recentFrame.velocity.y - target.baselineMovement.y,
                    recentFrame.velocity.z - target.baselineMovement.z)
                target.reactiveMovement = velocityDifference:length() > target.reactionThreshold
            end
        end
    end,
    getEnhancedPrediction = function(self, targetId, currentPos, predictionTime)
        local target = self.targets[targetId]
        if not target or #target.history < 3 then
            return currentPos
        end
        local predictedPos = vector(currentPos.x, currentPos.y, currentPos.z)
        if target.zigzagDetected and target.patternConfidence > 0.2 then
            local zigzagCycle = target.zigzagFrequency * predictionTime
            local phaseOffset = (zigzagCycle % 1.0) * 2 * math.pi
            local amplitude = target.averageVelocity:length() * 0.5
            local zigzagOffset = vector(amplitude * math.sin(phaseOffset), 0, amplitude * math.cos(phaseOffset * 0.7))
            predictedPos.x = predictedPos.x + (target.averageVelocity.x * predictionTime * 0.7) + zigzagOffset.x
            predictedPos.z = predictedPos.z + (target.averageVelocity.z * predictionTime * 0.7) + zigzagOffset.z
        else
            local confidenceMultiplier = target.patternConfidence
            local baseVelocity = target.averageVelocity
            local strafeAdjustment = vector(0, 0, 0)
            local totalStrafe = target.strafePattern.left + target.strafePattern.right + target.strafePattern.forward +
                                    target.strafePattern.backward
            if totalStrafe > 0 then
                local leftRightRatio = (target.strafePattern.right - target.strafePattern.left) / totalStrafe
                local forwardBackRatio = (target.strafePattern.forward - target.strafePattern.backward) / totalStrafe
                strafeAdjustment.x = leftRightRatio * baseVelocity:length() * 0.3
                strafeAdjustment.z = forwardBackRatio * baseVelocity:length() * 0.3
            end
            predictedPos.x = predictedPos.x +
                                 ((baseVelocity.x + strafeAdjustment.x) * predictionTime * confidenceMultiplier)
            predictedPos.y = predictedPos.y + (baseVelocity.y * predictionTime * confidenceMultiplier)
            predictedPos.z = predictedPos.z +
                                 ((baseVelocity.z + strafeAdjustment.z) * predictionTime * confidenceMultiplier)
        end
        return predictedPos
    end,
    calculateHitchance = function(self, targetId, distance, weaponAccuracy)
        local target = self.targets[targetId]
        if not target then
            return 50
        end
        local basePredictability = target.predictability * 100
        local distanceFactor = math.max(0.3, 1.0 - (distance / 3000))
        local weaponFactor = weaponAccuracy or 0.8
        local stabilityFactor = 1.0
        if target.zigzagDetected then
            stabilityFactor = 0.6 - (target.zigzagFrequency * 0.3)
        end
        local reactivePenalty = target.reactiveMovement and 0.8 or 1.0
        local observationBonus = math.min(target.totalObservationTime / 10000, 0.15)
        local hitchance = basePredictability * distanceFactor * weaponFactor * stabilityFactor * reactivePenalty +
                              (observationBonus * 100)
        return math.max(5, math.min(95, math.floor(hitchance)))
    end,
    getPredictionScale = function(self, targetId)
        local target = self.targets[targetId]
        if not target then
            return 0.5
        end
        return target.predictability
    end,
    getCompensatedVelocity = function(self, targetId)
        local target = self.targets[targetId]
        if not target or not target.history or #target.history < 3 then
            return vector(0, 0, 0)
        end
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

-- Ray intersection helper functions for triggerbot
local function angle_to_vector(angles)
    local pitch = math.rad(angles.x)
    local yaw = math.rad(angles.y)

    local sp = math.sin(pitch)
    local cp = math.cos(pitch)
    local sy = math.sin(yaw)
    local cy = math.cos(yaw)

    return vector(cp * cy, cp * sy, -sp)
end

local function intersect_ray_with_aabb(origin, dir, min, max)
    local tmin, tmax, tymin, tymax, tzmin, tzmax

    if math.abs(dir.x) < 1e-6 then
        if origin.x < min.x or origin.x > max.x then
            return false
        end
        tmin = -math.huge
        tmax = math.huge
    else
        if dir.x >= 0 then
            tmin = (min.x - origin.x) / dir.x
            tmax = (max.x - origin.x) / dir.x
        else
            tmin = (max.x - origin.x) / dir.x
            tmax = (min.x - origin.x) / dir.x
        end
    end

    if math.abs(dir.y) < 1e-6 then
        if origin.y < min.y or origin.y > max.y then
            return false
        end
        tymin = -math.huge
        tymax = math.huge
    else
        if dir.y >= 0 then
            tymin = (min.y - origin.y) / dir.y
            tymax = (max.y - origin.y) / dir.y
        else
            tymin = (max.y - origin.y) / dir.y
            tymax = (min.y - origin.y) / dir.y
        end
    end

    if tmin > tymax or tymin > tmax then
        return false
    end

    if tymin > tmin then
        tmin = tymin
    end

    if tymax < tmax then
        tmax = tymax
    end

    if math.abs(dir.z) < 1e-6 then
        if origin.z < min.z or origin.z > max.z then
            return false
        end
        tzmin = -math.huge
        tzmax = math.huge
    else
        if dir.z >= 0 then
            tzmin = (min.z - origin.z) / dir.z
            tzmax = (max.z - origin.z) / dir.z
        else
            tzmin = (max.z - origin.z) / dir.z
            tzmax = (min.z - origin.z) / dir.z
        end
    end

    if tmin > tzmax or tzmin > tmax then
        return false
    end

    if tmin < 0 and tmax < 0 then
        return false
    end

    return true
end

local function get_camera_angles()
    local cursor_x, cursor_y = get_cursor_position()
    local screen_width, screen_height = overlay.get_window_size()

    local center_x = screen_width / 2
    local center_y = screen_height / 2

    local delta_x = cursor_x - center_x
    local delta_y = cursor_y - center_y

    local fov = 90
    local yaw = math.atan2(delta_x / center_x, 1) * (fov / 2)
    local pitch = -math.atan2(delta_y / center_y, 1) * (fov / 2)

    return vector(pitch, yaw, 0)
end

local function check_ray_hitbox_intersection(local_pos, target_entity)
    local angles = get_camera_angles()
    local direction = angle_to_vector(angles)

    local hitboxes = {{
        bone = 6,
        min = vector(-4, -4, -6),
        max = vector(4, 4, 6)
    }, {
        bone = 4,
        min = vector(-6, -6, -12),
        max = vector(6, 6, 12)
    }, {
        bone = 0,
        min = vector(-5, -5, -8),
        max = vector(5, 5, 8)
    }}

    for _, hitbox in ipairs(hitboxes) do
        local bone_x, bone_y, bone_z = target_entity:bone_position(hitbox.bone)
        if bone_x and bone_y and bone_z then
            local bone_pos = vector(bone_x, bone_y, bone_z)
            local hitbox_min = vector(bone_pos.x + hitbox.min.x, bone_pos.y + hitbox.min.y, bone_pos.z + hitbox.min.z)
            local hitbox_max = vector(bone_pos.x + hitbox.max.x, bone_pos.y + hitbox.max.y, bone_pos.z + hitbox.max.z)

            if intersect_ray_with_aabb(local_pos, direction, hitbox_min, hitbox_max) then
                return true, hitbox.bone
            end
        end
    end

    return false
end

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
    accumulated_movement = {
        x = 0,
        y = 0
    },
    target_position = {
        x = 0,
        y = 0
    },
    movement_start_time = 0,
    is_moving_to_target = false,
    get_local_player_data = function(self)
        local entities = get_entities()
        local local_player = nil
        for _, ent in ipairs(entities) do
            if ent.controller and memory.read_int64(ent.controller + offsets.dwLocalPlayerController) ~= 0 then
                local_player = ent
                break
            end
        end
        if local_player then
            local success, pos_x, pos_y, pos_z = pcall(function()
                return local_player:get_position()
            end)
            if success and pos_x and pos_y and pos_z then
                local current_pos = vector(pos_x, pos_y, pos_z)
                if self.last_local_position and self.last_local_position.x and self.last_local_position.y and
                    self.last_local_position.z then
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
            local entities = get_entities()
            local localPlayer = nil
            for _, ent in ipairs(entities) do
                if ent.controller and memory.read_int64(ent.controller + offsets.dwLocalPlayerController) ~= 0 then
                    localPlayer = ent
                    break
                end
            end
            if localPlayer then
                local x, y, z = localPlayer:get_position()
                return x, y, z
            end
            return 0, 0, 0
        end)
        if success and cam_x and cam_y and cam_z then
            return vector(cam_x, cam_y, cam_z)
        else
            return vector(0, 0, 0)
        end
    end,
    is_active = function(self)
        local weapon_name = self:get_active_weapon()
        local config = getWeaponConfig(weapon_name)
        
        if not config.enabled then
            return false
        end

        if elements.aimbotEnabled.keybind and elements.aimbotEnabled.keybind.IsActive then
            return elements.aimbotEnabled.keybind:IsActive()
        end

        return false
    end,
    get_best_hitbox = function(self, player_entity)
        local activeWeapon = self:get_active_weapon()
        local config = getWeaponConfig(activeWeapon)
        if not player_entity or not config.hitboxes or #config.hitboxes == 0 then
            return 6 -- Head bone index for CS2
        end
        local cursor_x, cursor_y = get_cursor_position()
        local closest_distance = math.huge
        local best_hitbox = 6 -- Default to head

        for _, hitbox in ipairs(config.hitboxes) do
            local boneIndex = boneMap[hitbox] or 6
            local bone_x, bone_y, bone_z = player_entity:bone_position(boneIndex)
            if bone_x and bone_y and bone_z then
                local screen_x, screen_y = source_2_wts(bone_x, bone_y, bone_z)
                if screen_x and screen_y and screen_x > 0 and screen_y > 0 then
                    local distance_sq = (screen_x - cursor_x) ^ 2 + (screen_y - cursor_y) ^ 2
                    if distance_sq < closest_distance then
                        closest_distance = distance_sq
                        best_hitbox = boneIndex
                    end
                end
            end
        end
        return best_hitbox
    end,
    get_player_velocity = function(self, target)
        if not target then
            return vector(0, 0, 0)
        end
        local workspace_folder_cached = workspace_folder
        if not workspace_folder_cached then
            return vector(0, 0, 0)
        end
        local char = nil
        for _, c in ipairs(workspace_folder_cached) do
            if c:get_name() == target:get_name() then
                char = c
                break
            end
        end
        if not char then
            return vector(0, 0, 0)
        end
        local hrp = char and char:bone_position(0) -- Use head bone as HumanoidRootPart equivalent
        if not hrp then
            return vector(0, 0, 0)
        end
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
        if not target then
            return vector(0, 0, 0)
        end
        local hrp = target and target:bone_position(0) -- Use head bone as HumanoidRootPart equivalent
        if not hrp then
            return vector(0, 0, 0)
        end
        local success, vel_x, vel_y, vel_z = pcall(function()
            return hrp:get_velocity()
        end)
        if success and vel_x and vel_y and vel_z then
            return vector(vel_x, vel_y, vel_z)
        else
            return vector(0, 0, 0)
        end
    end,
    calculate_mouse_movement_with_curves = function(self, delta_x, delta_y)
        local activeWeapon = self:get_active_weapon()
        local config = getWeaponConfig(activeWeapon)
        local distance = math.sqrt(delta_x ^ 2 + delta_y ^ 2)
        
        local normalized_distance = math.min(distance / 200, 1.0)
        local speed_percent = 100
        if config.speedCurve and elements.speedGraph and config.speedCurveEnabled then
            speed_percent = elements.speedGraph:InterpolateValue(normalized_distance) * 100
        end
        local distance_modifier = 1.0
        if config.distanceCurve and elements.distanceGraph and config.distanceCurveEnabled then
            distance_modifier = elements.distanceGraph:InterpolateValue(normalized_distance)
        end
        local transition_modifier = 1.0
        if config.transitionCurve and elements.transitionGraph and config.transitionCurveEnabled then
            transition_modifier = elements.transitionGraph:InterpolateValue(normalized_distance)
        else
            transition_modifier = math.min(normalized_distance * 2.0, 1.0)
        end
        local move_x = delta_x * distance_modifier * transition_modifier
        local move_y = delta_y * distance_modifier * transition_modifier
        local deltaTime = utility.get_delta_time()
        local base_speed = (speed_percent / 100.0) * 800
        local multiplier = config.speedMultiplier or 3.0
        local movement_speed = base_speed * multiplier
        local max_movement_this_frame = movement_speed * deltaTime
        if multiplier >= 9.0 then
            local snap_distance = math.sqrt(delta_x ^ 2 + delta_y ^ 2)
            if snap_distance > 0 then
                local max_snap_distance = 500
                if snap_distance > max_snap_distance then
                    local scale = max_snap_distance / snap_distance
                    return delta_x * scale, delta_y * scale
                end
            end
            return delta_x, delta_y
        end
        local current_movement = math.sqrt(move_x ^ 2 + move_y ^ 2)
        if current_movement > max_movement_this_frame and current_movement > 0 then
            local scale = max_movement_this_frame / current_movement
            move_x = move_x * scale
            move_y = move_y * scale
        end
        return move_x, move_y
    end,
    calculate_prediction = function(self, target, current_pos)
        local activeWeapon = self:get_active_weapon()
        local weapon_config = getWeaponConfig(activeWeapon)
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
        pcall(function()
            MovementTracker:addMovement(targetId, velocity, current_pos)
        end)
        local local_pos = self:get_local_player_data()
        if not local_pos or not local_pos.x or not local_pos.y or not local_pos.z then
            return predicted_pos
        end
        local distance = math.sqrt((local_pos.x - current_pos.x) ^ 2 + (local_pos.y - current_pos.y) ^ 2 +
                                       (local_pos.z - current_pos.z) ^ 2)
        local bullet_speed = weapon_config.bulletVelocity or 1294.75
        local prediction_time = (distance / bullet_speed) * (weapon_config.predictionStrength or 1.0)
        if weapon_config.predictionMethod == "Experimental" then
            local enhanced_pos = MovementTracker:getEnhancedPrediction(targetId, current_pos, prediction_time)
            if enhanced_pos then
                predicted_pos = enhanced_pos
            end
        else
            if velocity and velocity.x and velocity.y and velocity.z then
                predicted_pos.x = predicted_pos.x + (velocity.x * prediction_time)
                predicted_pos.y = predicted_pos.y + (velocity.y * prediction_time)
                predicted_pos.z = predicted_pos.z + (velocity.z * prediction_time)
            end
        end
        if weapon_config.bulletDrop and weapon_config.bulletDrop > 0 then
            local gravity = 26.9
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
        if not target then
            return vector(0, 0, 0)
        end

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

        -- Only apply prediction if it's enabled
        local activeWeapon = self:get_active_weapon()
        local weapon_config = getWeaponConfig(activeWeapon)
        if weapon_config and weapon_config.predictionEnabled then
            return self:calculate_prediction(target, base_pos)
        else
            return base_pos
        end
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
        local activeWeapon = self:get_active_weapon()
        local config = getWeaponConfig(activeWeapon)
        if config.speed >= 100 then
            return delta_x, delta_y
        end
        local move_x, move_y = delta_x, delta_y
        local distance = math.sqrt(delta_x ^ 2 + delta_y ^ 2)
        if config.mouseMovement == "Curved" then
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
        local speed_factor = config.speed / 100.0
        move_x = move_x * speed_factor
        move_y = move_y * speed_factor
        return move_x, move_y
    end,
    get_live_npcs = function(self)
        local npcs = {}
        for _, customEntity in pairs(Library.CustomESPEntities) do
            if customEntity.enabled and customEntity.getEntities then
                local entities = customEntity.getEntities()
                for _, entity in pairs(entities) do
                    table.insert(npcs, {
                        type = "npc",
                        entity = entity,
                        pos = customEntity.getPosition(entity),
                        name = customEntity.getName(entity),
                        team = customEntity.getTeam and customEntity.getTeam(entity) or "Unknown",
                        instance = entity
                    })
                end
            end
        end
        return npcs
    end,
    get_best_target = function(self)
        local activeWeapon = self:get_active_weapon()
        local config = getWeaponConfig(activeWeapon)
        local current_keybind_state = self:is_active()

        if config.sticky then
            if self.previous_keybind_state and not current_keybind_state then
                self.locked_target = nil
                self.last_target_world_pos = nil
                self.last_target_screen_pos = nil
            end
            if self.locked_target and current_keybind_state then
                local target_pos = self:get_target_position(self.locked_target)
                if not target_pos:is_zero() then
                    local is_valid = true
                    if self.locked_target.type == "player" and self.locked_target.entity then
                        is_valid = self.locked_target.entity:is_alive()
                    end
                    if is_valid then
                        local local_pos = self:get_local_player_data()
                        local max_distance_sq = config.maxDistance * config.maxDistance
                        if (local_pos - target_pos):length_sqr() <= max_distance_sq then
                            local screen_x, screen_y = source_2_wts(target_pos.x, target_pos.y, target_pos.z)
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
                self.locked_target = nil
            end
        end

        self.previous_keybind_state = current_keybind_state
        if not current_keybind_state then
            self.current_frame_target_data = nil
            return nil
        end

        local local_pos = self:get_local_player_data()
        local cursor_x, cursor_y = get_cursor_position()
        local fov_radius = config.fov
        local fov_radius_sq = fov_radius * fov_radius
        local max_distance = config.maxDistance
        local selected_targets = config.targets or {"Players"}

        local closest_distance_sq = math.huge
        local candidate_target = nil
        local all_targets = {}

        local players = get_entities()
        if players then
            for _, player in pairs(players) do
                if not player:is_local_player() and player:is_alive() then
                    local should_target = true
                    if config.visible and not player:is_visible() then
                        should_target = false
                    end
                    if not player:is_enemy() then
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

        for _, target in ipairs(all_targets) do
            local target_pos = self:get_target_position(target)
            if not target_pos or target_pos:is_zero() then
                goto continue
            end

            -- Check distance first (cheaper calculation)
            local distance_sq = (local_pos.x - target_pos.x) ^ 2 + (local_pos.y - target_pos.y) ^ 2 +
                                    (local_pos.z - target_pos.z) ^ 2
            if distance_sq > (max_distance * max_distance) then
                goto continue
            end

            -- Get screen position
            local screen_x, screen_y = source_2_wts(target_pos.x, target_pos.y, target_pos.z)
            if not screen_x or not screen_y then -- Properly check for nil
                goto continue
            end

            -- Check if on screen
            local screen_width, screen_height = get_window_size()
            if screen_x <= 0 or screen_y <= 0 or screen_x >= screen_width or screen_y >= screen_height then
                goto continue
            end

            -- Check FOV
            local cursor_dist_sq = (screen_x - cursor_x) ^ 2 + (screen_y - cursor_y) ^ 2
            if cursor_dist_sq > fov_radius_sq then
                goto continue
            end

            local selection_value = cursor_dist_sq
            if config.targetSelection == "Closest to Player" then
                selection_value = distance_sq
            elseif config.targetSelection == "Lowest HP" and target.type == "player" and target.entity then
                local health = target.entity:get_health() or 100
                selection_value = health
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
            local current_time = utility.get_tickcount()
            local should_switch = true
            local current_target = self.current_frame_target_data and self.current_frame_target_data.target

            if current_target and current_target ~= candidate_target.target and config.targetSwitchDelay > 0 then
                if not self.target_switch_delay_start then
                    self.target_switch_delay_start = current_time
                    should_switch = false
                elseif current_time - self.target_switch_delay_start < config.targetSwitchDelay then
                    should_switch = false
                else
                    self.target_switch_delay_start = nil
                end
            else
                self.target_switch_delay_start = nil
            end

            if should_switch then
                if config.sticky then
                    self.locked_target = candidate_target.target
                end
                self.last_target_world_pos = candidate_target.bone_pos
                self.last_target_screen_pos = candidate_target.screen_pos
                self.last_update_time = utility.get_tickcount() / 1000
                return candidate_target
            elseif current_target then
                local current_pos = self:get_target_position(current_target)
                if not current_pos:is_zero() then
                    local screen_x, screen_y = source_2_wts(current_pos.x, current_pos.y, current_pos.z)
                    if screen_x and screen_y then
                        return {
                            target = current_target,
                            screen_pos = vector(screen_x, screen_y, 0),
                            bone_pos = current_pos
                        }
                    end
                end
            end
        end

        return nil
    end,
    update = function(self)
        self.frame_counter = (self.frame_counter or 0) + 1
        local current_time = utility.get_tickcount() / 1000
        self.last_cleanup_time = self.last_cleanup_time or 0
        if current_time - self.last_cleanup_time > 0.1 then
            MovementTracker:cleanup()
            self.last_cleanup_time = current_time
        end
        local cached_local_pos = self:get_local_player_data()
        local cached_active_weapon = self:get_active_weapon()
        AimbotConfig.activeWeapon = cached_active_weapon
        if self.frame_counter % 2 == 0 then
            self.current_frame_target_data = self:get_best_target()
        end
        if not self.current_frame_target_data or not self.current_frame_target_data.target then
            Library.TargetHUD:SetTarget(nil)
            self.current_hitchance = 0
            return
        end
        local target = self.current_frame_target_data.target
        local config = getWeaponConfig(cached_active_weapon)
        if Library.TargetHUD then
            Library.TargetHUD:SetTarget(target)
        end
        if config.showHitchance and target.name then
            local target_pos = self.current_frame_target_data.bone_pos
            local distance = math.sqrt(
                (cached_local_pos.x - target_pos.x) ^ 2 + (cached_local_pos.y - target_pos.y) ^ 2 +
                    (cached_local_pos.z - target_pos.z) ^ 2)
            local weapon_accuracy = 1
            local weapon_lower = cached_active_weapon:lower()
            if string.find(weapon_lower, "bow") then
                weapon_accuracy = 0.85
            elseif string.find(weapon_lower, "crossbow") then
                weapon_accuracy = 0.9
            elseif string.find(weapon_lower, "nail") then
                weapon_accuracy = 0.5
            end
            self.current_hitchance = MovementTracker:calculateHitchance(target.name, distance, weapon_accuracy)
        else
            self.current_hitchance = 0
        end
        local cursor_x, cursor_y = get_cursor_position()
        local target_screen_x = self.current_frame_target_data.screen_pos.x
        local target_screen_y = self.current_frame_target_data.screen_pos.y

        local delta_x = target_screen_x - cursor_x
        local delta_y = target_screen_y - cursor_y

        local move_x, move_y = self:calculate_mouse_movement_with_curves(delta_x, delta_y)
        
        local move_threshold = 0
        if math.abs(move_x) > move_threshold or math.abs(move_y) > move_threshold then
            if config.mode == "mouse" then
                input.mouse_move(math.floor(move_x), math.floor(move_y))
            end
        end
    end,
    get_active_weapon = function(self)
        local lp = get_local_player()
        if not lp then
            return "Default"
        end
        local weapon = lp:get_active_weapon()
        return weapon or "Default"
    end,
    render = function(self)
        local activeWeapon = self:get_active_weapon()
        local config = getWeaponConfig(activeWeapon)
        if config.visualizeFOV then
            local cursor_x, cursor_y = get_cursor_position()
            local fov_val = config.fov
            if config.fovCircleFilled then
                local fillColor = config.fovCircleFilledColor
                render.circle(cursor_x, cursor_y, fov_val, fillColor[1], fillColor[2], fillColor[3], fillColor[4], 32)
            end
            local outlineColor = config.visualizeFOVColor
            render.circle_outline(cursor_x, cursor_y, fov_val, outlineColor[1], outlineColor[2], outlineColor[3],
                outlineColor[4], 32)
        end

        if config.visualizeTarget and self.current_frame_target_data then
            local target_pos = vector(0, 0, 0)
            if self.current_frame_target_data.target.type == "player" then
                target_pos = vector(self.current_frame_target_data.target.entity:bone_position(0))
            else
                target_pos = self.current_frame_target_data.target.pos
            end
            local color = config.targetColor
            if not target_pos:is_zero() then
                local time = utility.get_tickcount() / 1000
                local pulse = (time % 1.0) / 1.0
                local radius = 20 * pulse
                local alpha = math.floor(255 * (1 - pulse))
                local screen_x, screen_y = source_2_wts(target_pos.x, target_pos.y, target_pos.z)
                if screen_x and screen_y and screen_x > 0 and screen_y > 0 then
                    render.circle_outline(screen_x, screen_y, radius, color[1], color[2], color[3], alpha, 24)
                    render.circle_outline(screen_x, screen_y, radius / 2, color[1], color[2], color[3], alpha, 16)
                end
            end
        end
    end,

    triggerbot = function(self)
        local local_player = get_local_player()
        if not local_player or not local_player.pawn or not local_player.controller then
            return
        end

        local weapon_name = self:get_active_weapon()
        local config = getWeaponConfig(weapon_name)
        
        if not config.triggerbot.enabled then
            return
        end

        local triggerKeybind = config.triggerbot.keybind
        local currentKeyState = false

        if config.triggerbot.mode == "Hold" and triggerKeybind.key and triggerKeybind.key ~= 0 then
            currentKeyState = utility.key_state(triggerKeybind.key)
        elseif config.triggerbot.mode == "Auto" then
            currentKeyState = true
        else
            currentKeyState = true
        end

        if not currentKeyState then
            return
        end

        local crosshairOnTarget = false
        local crosshair_entity_index = memory.read_int(local_player.pawn + offsets.m_iIDEntIndex)
        
        if crosshair_entity_index > 0 then
            local entity_list = memory.read_int64(client + offsets.dwEntityList)
            local entity_id = memory.read_int64(entity_list + 0x8 * bit.rshift(crosshair_entity_index, 9) + 0x10)
            local entity = memory.read_int64(entity_id + 120 * bit.band(crosshair_entity_index, 0x1FF))

            if entity and entity ~= 0 then
                local entity_team = memory.read_int(entity + offsets.m_iTeamNum)
                local entity_health = memory.read_int(entity + offsets.m_iHealth)
                local local_team = memory.read_int(local_player.controller + offsets.m_iTeamNum)

                if entity_health > 0 then
                    if config.triggerbot.teamCheck then
                        if entity_team ~= local_team then
                            crosshairOnTarget = true
                        end
                    else
                        crosshairOnTarget = true
                    end
                end
            end
        end

        if crosshairOnTarget then
            if config.triggerbot.delay > 0 then
                if not self.triggerbot_delay_start then
                    self.triggerbot_delay_start = utility.get_tickcount()
                elseif utility.get_tickcount() - self.triggerbot_delay_start >= config.triggerbot.delay then
                    input.mouse_click(1)
                    self.triggerbot_delay_start = nil
                end
            else
                input.mouse_click(1)
            end
        else
            self.triggerbot_delay_start = nil
        end
    end,

    rcs = function(self)
        local local_player = get_local_player()
        if not local_player or not local_player.pawn then
            return 0, 0
        end

        local weapon_name = self:get_active_weapon()
        local config = getWeaponConfig(weapon_name)
        
        if not config.rcs.enabled then
            return 0, 0
        end
        
        local shots_fired = memory.read_int(local_player.pawn + offsets.m_iShotsFired)
        local punch_angle = memory.read_vector3(local_player.pawn + offsets.m_aimPunchAngle)
        local p_sens = memory.read_int64(client + offsets.dwSensitivity)
        local sensitivity = memory.read_float(p_sens + offsets.dwSensitivity_sensitivity)
        
        if shots_fired > 1 then
            local punch_delta_x = (punch_angle.x - config.rcs.last_kickback.x) * -1.0
            local punch_delta_y = (punch_angle.y - config.rcs.last_kickback.y) * -1.0
            local rcs_strength_x = config.rcs.horizontal / 100.0
            local rcs_strength_y = config.rcs.vertical / 100.0

            local mouse_x = (((punch_delta_y * rcs_strength_x) / sensitivity) / -0.022)
            local mouse_y = (((punch_delta_x * rcs_strength_y) / sensitivity) / 0.022)

            input.mouse_move(math.floor(mouse_x), math.floor(mouse_y))
        end
        
        config.rcs.last_kickback = punch_angle
        return 0, 0
    end,

    playHitSound = function(self)
        if not HitSoundConfig.enabled then
            return
        end
        local soundData = HitSoundConfig.cachedSounds[HitSoundConfig.selectedSound]
        if soundData then
            print("[Hitsound] Playing sound: " .. HitSoundConfig.selectedSound)
            utility.play_sound(soundData)
        else
            print("[Hitsound] No sound data found for: " .. HitSoundConfig.selectedSound)
        end
    end,

    playHitMarker = function(self)
        if not HitMarkerConfig.enabled then
            return
        end

        local screenWidth, screenHeight = get_window_size()
        local effect = {
            x = screenWidth / 2,
            y = screenHeight / 2,
            startTime = utility.get_tickcount(),
            duration = HitMarkerConfig.duration,
            size = 8,
            alpha = 255
        }

        table.insert(HitMarkerConfig.effects, effect)
        
        -- Remove old effects
        if #HitMarkerConfig.effects > HitMarkerConfig.maxEffects then
            table.remove(HitMarkerConfig.effects, 1)
        end
    end
}
tabs.Legit = MainWindow:AddTab("Aimbot")
tabs.Visuals = MainWindow:AddTab("Visuals")
tabs.Misc = MainWindow:AddTab("Misc")
tabs.Player = MainWindow:AddTab("Players")
tabs.Settings = MainWindow:AddTab("Settings")
sections.WeaponPicker = tabs.Legit:AddSection("General Settings", 10, 60, 610, 190, false)
sections.AimbotCore =
    tabs.Legit:AddMultiSection("Aimbot Settings", {"Core Settings", "Tweaks"}, 10, 260, 300, 330, true)
sections.Prediction = tabs.Legit:AddMultiSection("Enhancements", {"Triggerbot", "RCS"}, 320, 260, 300, 330)
-- Triggerbot elements
elements.triggerbotEnabled = Toggle:new("Triggerbot Enabled", function(state)
    ensureWeaponConfig(AimbotConfig.configWeapon)
    AimbotConfig.weapons[AimbotConfig.configWeapon].triggerbot.enabled = state
end, AimbotConfig.weapons["Default"].triggerbot.enabled, "triggerbot_enabled")
elements.triggerbotEnabled.keybind = elements.triggerbotEnabled:AddKeybind(AimbotConfig.weapons["Default"].triggerbot.keybind.key,
    AimbotConfig.weapons["Default"].triggerbot.keybind.mode)
sections.Prediction:AddElement(elements.triggerbotEnabled, 1)

elements.triggerbotDelay = Slider:new("Delay (ms)", 0, 300, AimbotConfig.weapons["Default"].triggerbot.delay, function(value)
    ensureWeaponConfig(AimbotConfig.configWeapon)
    AimbotConfig.weapons[AimbotConfig.configWeapon].triggerbot.delay = value
end, "triggerbot_delay")
sections.Prediction:AddElement(elements.triggerbotDelay, 1)

elements.triggerbotMagnet = Toggle:new("Triggerbot Magnet", function(state)
    ensureWeaponConfig(AimbotConfig.configWeapon)
    AimbotConfig.weapons[AimbotConfig.configWeapon].triggerbot.magnet = state
end, AimbotConfig.weapons["Default"].triggerbot.magnet, "triggerbot_magnet")
sections.Prediction:AddElement(elements.triggerbotMagnet, 1)

elements.triggerbotMode = Dropdown:new("Mode", {"Auto", "Hold"}, function(selected)
    ensureWeaponConfig(AimbotConfig.configWeapon)
    AimbotConfig.weapons[AimbotConfig.configWeapon].triggerbot.mode = selected
end, AimbotConfig.weapons["Default"].triggerbot.mode, "triggerbot_mode")
sections.Prediction:AddElement(elements.triggerbotMode, 1)

elements.triggerbotTeamCheck = Toggle:new("Team Check", function(state)
    ensureWeaponConfig(AimbotConfig.configWeapon)
    AimbotConfig.weapons[AimbotConfig.configWeapon].triggerbot.teamCheck = state
end, AimbotConfig.weapons["Default"].triggerbot.teamCheck, "triggerbot_team_check")
sections.Prediction:AddElement(elements.triggerbotTeamCheck, 1)

-- RCS elements
elements.rcsEnabled = Toggle:new("RCS Enabled", function(state)
    ensureWeaponConfig(AimbotConfig.configWeapon)
    AimbotConfig.weapons[AimbotConfig.configWeapon].rcs.enabled = state
end, AimbotConfig.weapons["Default"].rcs.enabled, "rcs_enabled")
sections.Prediction:AddElement(elements.rcsEnabled, 2)

elements.rcsHorizontal = Slider:new("Horizontal", 0, 100, AimbotConfig.weapons["Default"].rcs.horizontal, function(value)
    ensureWeaponConfig(AimbotConfig.configWeapon)
    AimbotConfig.weapons[AimbotConfig.configWeapon].rcs.horizontal = value
end, "rcs_horizontal")
sections.Prediction:AddElement(elements.rcsHorizontal, 2)

elements.rcsVertical = Slider:new("Vertical", 0, 100, AimbotConfig.weapons["Default"].rcs.vertical, function(value)
    ensureWeaponConfig(AimbotConfig.configWeapon)
    AimbotConfig.weapons[AimbotConfig.configWeapon].rcs.vertical = value
end, "rcs_vertical")
sections.Prediction:AddElement(elements.rcsVertical, 2)



local currentWeapon = "Default"
elements.aimbotEnabled = Toggle:new("Aimbot Enabled", function(state)
    ensureWeaponConfig(AimbotConfig.configWeapon)
    AimbotConfig.weapons[AimbotConfig.configWeapon].enabled = state
end, AimbotConfig.weapons["Default"].enabled, "aimbot_enabled")
elements.aimbotEnabled.keybind = elements.aimbotEnabled:AddKeybind(AimbotConfig.globalKeybind.key, "Hold")
sections.WeaponPicker:AddElement(elements.aimbotEnabled)
elements.weaponOverride = Toggle:new("Override this weapon", function(state)
    local currentWeapon = AimbotConfig.configWeapon
    AimbotConfig.weapons[currentWeapon].overrideWeapon = state
end, false, "override_weapon")
sections.WeaponPicker:AddElement(elements.weaponOverride)

function updateAllElements()
    local config = AimbotConfig.weapons[AimbotConfig.configWeapon]
    if not config then
        return
    end
    elements.weaponOverride:Set(config.overrideWeapon or false)
    elements.aimbotEnabled:Set(config.enabled)
    elements.aimbotEnabled.keybind = elements.aimbotEnabled:AddKeybind(AimbotConfig.globalKeybind.key, "Hold")
    elements.aimbotMode:Set(config.mode)
    elements.aimbotVisible:Set(config.visible)
    elements.aimbotSticky:Set(config.sticky)
    elements.aimbotTargetSelection:Set(config.targetSelection)
    elements.aimbotHitboxes:Set(config.hitboxes)
    elements.aimbotFOV:Set(config.fov)
    elements.aimbotVisualizeFOV:Set(config.visualizeFOV)
    elements.aimbotVisualizeFOVFilled:Set(config.fovCircleFilled)
    elements.aimbotMouseMovement:Set(config.mouseMovement)
    elements.speedMultiplier:Set(config.speedMultiplier)
    elements.aimbotMaxDistance:Set(config.maxDistance)
    elements.aimbotTargetSwitchDelay:Set(config.targetSwitchDelay)
    elements.aimbotVisualizeTarget:Set(config.visualizeTarget)
    elements.showHitchance:Set(config.showHitchance)

    -- Update prediction elements if they exist
    if elements.predictionEnabled then
        elements.predictionEnabled:Set(config.predictionEnabled)
    end
    if elements.predictionMethod then
        elements.predictionMethod:Set(config.predictionMethod)
    end
    if elements.predictionStrength then
        elements.predictionStrength:Set(config.predictionStrength)
    end
    if elements.bulletVelocity then
        elements.bulletVelocity:Set(config.bulletVelocity)
    end
    if elements.gravity then
        elements.gravity:Set(config.gravity)
    end
    if elements.bulletDrop then
        elements.bulletDrop:Set(config.bulletDrop)
    end
    elements.aimbotVisualizeFOV.colorPicker:Set(config.visualizeFOVColor)
    elements.aimbotVisualizeFOVFilled.colorPicker:Set(config.fovCircleFilledColor)
    elements.aimbotVisualizeTarget.colorPicker:Set(config.targetColor)

    -- Update triggerbot elements
    elements.triggerbotEnabled:Set(config.triggerbot.enabled)
    elements.triggerbotEnabled.keybind = elements.triggerbotEnabled:AddKeybind(config.triggerbot.keybind.key,
        config.triggerbot.keybind.mode)
    elements.triggerbotDelay:Set(config.triggerbot.delay)
    elements.triggerbotMagnet:Set(config.triggerbot.magnet)
    elements.triggerbotMode:Set(config.triggerbot.mode)
    elements.triggerbotTeamCheck:Set(config.triggerbot.teamCheck)

    -- Update RCS elements
    elements.rcsEnabled:Set(config.rcs.enabled)
    elements.rcsHorizontal:Set(config.rcs.horizontal)
    elements.rcsVertical:Set(config.rcs.vertical)

    -- Update curve toggle elements
    if elements.speedCurveToggle then
        elements.speedCurveToggle:Set(config.speedCurveEnabled)
    end
    if elements.distanceCurveToggle then
        elements.distanceCurveToggle:Set(config.distanceCurveEnabled)
    end
    if elements.transitionCurveToggle then
        elements.transitionCurveToggle:Set(config.transitionCurveEnabled)
    end

    -- Update curve graph elements
    if elements.distanceGraph and config.distanceCurve then
        elements.distanceGraph:Set(config.distanceCurve.nodes, config.distanceCurve.interpolationType)
    end
    if elements.speedGraph and config.speedCurve then
        elements.speedGraph:Set(config.speedCurve.nodes, config.speedCurve.interpolationType)
    end
    if elements.transitionGraph and config.transitionCurve then
        elements.transitionGraph:Set(config.transitionCurve.nodes, config.transitionCurve.interpolationType)
    end
end

local kmap = {}
local dmap = {"Default"}

for i, v in pairs(weapon_name_map) do
    table.insert(kmap, i)
    if contains({"T knife", "CT knife", "zeus", "flashbang", "hegrenade", "smokegrenade", "molotov", "decoy",
                 "incgrenade", "c4"}, i) then
        goto continue
    end
    table.insert(dmap, v)
    ::continue::
end
--[[
elements.weaponSelector = MultiSelectDropdown:new("Overwrite Weapon settings", kmap, function(selected)
    AimbotConfig.selectedWeapons = selected
end, {}, "weapon_selector")
sections.WeaponPicker:AddElement(elements.weaponSelector)
elements.overrideWeapon = Toggle:new("Overwrite with held weapon", function(state)
    AimbotConfig.overrideWeapon = state
end, false, 'override_weapon_enabled')
sections.WeaponPicker:AddElement(elements.overrideWeapon)
-- configWeaponSelector replaced with elements.weaponSelector List element
-- No longer supports multi-select, individual weapon override toggles used instead


elements.configList = List:new("Available Configs", availableConfigs, function(selected)
    if selected and selected ~= "No configs found" then
        elements.configNameInput:Set(selected)
        Library.ConfigSystem.CurrentConfig = selected
    end
end, nil, 6, "config_list")


--]]

elements.weaponSelector = List:new("Weapon selection", dmap, function(selected)
    AimbotConfig.configWeapon = selected
    updateWeaponKeyset()
    updateAllElements()
end, AimbotConfig.configWeapon, 3, "weapon_list")
sections.WeaponPicker:AddElement(elements.weaponSelector)

elements.aimbotMode = Dropdown:new("Mode", {"mouse", "silent"}, function(selected)
    ensureWeaponConfig(AimbotConfig.configWeapon)
    AimbotConfig.weapons[AimbotConfig.configWeapon].mode = selected
end, AimbotConfig.weapons["Default"].mode, "aimbot_mode")
sections.AimbotCore:AddElement(elements.aimbotMode, 1)
elements.aimbotVisible = Toggle:new("Visible Only", function(state)
    ensureWeaponConfig(AimbotConfig.configWeapon)
    AimbotConfig.weapons[AimbotConfig.configWeapon].visible = state
end, AimbotConfig.weapons["Default"].visible, "aimbot_visible")
sections.AimbotCore:AddElement(elements.aimbotVisible, 1)

elements.aimbotSticky = Toggle:new("Sticky Target", function(state)
    ensureWeaponConfig(AimbotConfig.configWeapon)
    AimbotConfig.weapons[AimbotConfig.configWeapon].sticky = state
end, AimbotConfig.weapons["Default"].sticky, "aimbot_sticky")
sections.AimbotCore:AddElement(elements.aimbotSticky, 1)
elements.aimbotTargetSelection = Dropdown:new("Target Selection",
    {"Closest to crosshair", "Closest to Player", "Lowest HP"}, function(selected)
        ensureWeaponConfig(AimbotConfig.configWeapon)
        AimbotConfig.weapons[AimbotConfig.configWeapon].targetSelection = selected
    end, AimbotConfig.weapons["Default"].targetSelection, "aimbot_target_selection")
sections.AimbotCore:AddElement(elements.aimbotTargetSelection, 1)
local hbmap = {}
for i, v in pairs(boneMap) do
    table.insert(hbmap, i)
end
elements.aimbotHitboxes = MultiSelectDropdown:new("Hitboxes", hbmap, function(selected)
    ensureWeaponConfig(AimbotConfig.configWeapon)
    AimbotConfig.weapons[AimbotConfig.configWeapon].hitboxes = selected
end, AimbotConfig.weapons["Default"].hitboxes, "aimbot_hitboxes")
sections.AimbotCore:AddElement(elements.aimbotHitboxes, 1)
elements.aimbotFOV = Slider:new("FOV", 0, 1000, AimbotConfig.weapons["Default"].fov, function(value)
    ensureWeaponConfig(AimbotConfig.configWeapon)
    AimbotConfig.weapons[AimbotConfig.configWeapon].fov = value
end, "aimbot_fov")
sections.AimbotCore:AddElement(elements.aimbotFOV, 1)
elements.aimbotVisualizeFOV = Toggle:new("Visualize FOV", function(state)
    ensureWeaponConfig(AimbotConfig.configWeapon)
    AimbotConfig.weapons[AimbotConfig.configWeapon].visualizeFOV = state
end, AimbotConfig.weapons["Default"].visualizeFOV, "aimbot_visualize_fov")
elements.aimbotVisualizeFOV:AddColorPicker("FOV Color", function(color)
    AimbotConfig.weapons[AimbotConfig.configWeapon].visualizeFOVColor = color
end, AimbotConfig.weapons["Default"].visualizeFOVColor, "aimbot_visualize_fov_color")
sections.AimbotCore:AddElement(elements.aimbotVisualizeFOV, 1)
elements.aimbotVisualizeFOVFilled = Toggle:new("FOV Filled", function(state)
    AimbotConfig.weapons[AimbotConfig.configWeapon].fovCircleFilled = state
end, AimbotConfig.weapons["Default"].fovCircleFilled, "aimbot_visualize_fov_filled")
elements.aimbotVisualizeFOVFilled:AddColorPicker("FOV Fill Color", function(color)
    AimbotConfig.weapons[AimbotConfig.configWeapon].fovCircleFilledColor = color
end, AimbotConfig.weapons["Default"].fovCircleFilledColor, "aimbot_visualize_fov_filled_color")
sections.AimbotCore:AddElement(elements.aimbotVisualizeFOVFilled, 1)
elements.aimbotMouseMovement = Dropdown:new("Mouse Movement", {"Linear", "Curved"}, function(selected)
    AimbotConfig.weapons[AimbotConfig.configWeapon].mouseMovement = selected
end, AimbotConfig.weapons["Default"].mouseMovement, "aimbot_mouse_movement")
sections.AimbotCore:AddElement(elements.aimbotMouseMovement, 2)
elements.speedMultiplier = Slider:new("Speed Multiplier", 1.0, 10.0, AimbotConfig.weapons["Default"].speedMultiplier,
    function(value)
        AimbotConfig.weapons[AimbotConfig.configWeapon].speedMultiplier = value
    end, "aimbot_speed_multiplier")
elements.speedMultiplier:AddTextZone(9.5, "INSTANT", ">")
sections.AimbotCore:AddElement(elements.speedMultiplier, 2)
elements.speedCurveToggle = Toggle:new("Speed Curve", function(state)
    AimbotConfig.weapons[AimbotConfig.configWeapon].speedCurveEnabled = state
end, AimbotConfig.weapons[AimbotConfig.configWeapon].speedCurveEnabled, "speed_curve_enabled")
sections.AimbotCore:AddElement(elements.speedCurveToggle, 2)
elements.speedGraph = Graph:new("Aimspeed Curve", function(nodes, interpolationType)
    AimbotConfig.weapons[AimbotConfig.configWeapon].speedCurve = {
        nodes = nodes,
        interpolationType = interpolationType
    }
end, {{
    x = 0,
    y = 100,
    interpolationType = "Linear"
}, {
    x = 100,
    y = 100,
    interpolationType = "Linear"
}}, "Linear", "speed_curve", 280, 35)
sections.AimbotCore:AddElement(elements.speedGraph, 2)
elements.distanceCurveToggle = Toggle:new("Distance Curve", function(state)
    AimbotConfig.weapons[AimbotConfig.configWeapon].distanceCurveEnabled = state
end, AimbotConfig.weapons[AimbotConfig.configWeapon].distanceCurveEnabled, "distance_curve_enabled")
sections.AimbotCore:AddElement(elements.distanceCurveToggle, 2)
elements.distanceGraph = Graph:new("Distance Curve", function(nodes, interpolationType)
    AimbotConfig.weapons[AimbotConfig.configWeapon].distanceCurve = {
        nodes = nodes,
        interpolationType = interpolationType
    }
end, {{
    x = 0,
    y = 100
}, {
    x = 100,
    y = 0
}}, "Linear", "distance_curve", 280, 35)
sections.AimbotCore:AddElement(elements.distanceGraph, 2)
elements.transitionCurveToggle = Toggle:new("Transition Curve", function(state)
    AimbotConfig.weapons[AimbotConfig.configWeapon].transitionCurveEnabled = state
end, AimbotConfig.weapons[AimbotConfig.configWeapon].transitionCurveEnabled, "transition_curve_enabled")
sections.AimbotCore:AddElement(elements.transitionCurveToggle, 2)
elements.transitionGraph = Graph:new("Transition Curve", function(nodes, interpolationType)
    AimbotConfig.weapons[AimbotConfig.configWeapon].transitionCurve = {
        nodes = nodes,
        interpolationType = interpolationType
    }
end, {{
    x = 0,
    y = 0
}, {
    x = 25,
    y = 80
}, {
    x = 100,
    y = 100
}}, "Circular", "transition_curve", 280, 35)
sections.AimbotCore:AddElement(elements.transitionGraph, 2)
elements.aimbotMaxDistance = Slider:new("Max Distance", 100, 5000, AimbotConfig.weapons["Default"].maxDistance,
    function(value)
        AimbotConfig.weapons[AimbotConfig.configWeapon].maxDistance = value
    end, "aimbot_max_distance")
sections.AimbotCore:AddElement(elements.aimbotMaxDistance, 1)
elements.aimbotTargetSwitchDelay = Slider:new("Target Switch Delay (ms)", 0, 300,
    AimbotConfig.weapons["Default"].targetSwitchDelay, function(value)
        AimbotConfig.weapons[AimbotConfig.configWeapon].targetSwitchDelay = tonumber(value)
    end, "aimbot_target_switch_delay")
sections.AimbotCore:AddElement(elements.aimbotTargetSwitchDelay, 1)
elements.aimbotVisualizeTarget = Toggle:new("Visualize Target", function(state)
    AimbotConfig.weapons[AimbotConfig.configWeapon].visualizeTarget = state
end, AimbotConfig.weapons["Default"].visualizeTarget, "aimbot_visualize_target")
elements.aimbotVisualizeTarget:AddColorPicker("Target Color", function(color)
    AimbotConfig.weapons[AimbotConfig.configWeapon].targetColor = color
end, AimbotConfig.weapons["Default"].targetColor, "aimbot_target_color")
sections.AimbotCore:AddElement(elements.aimbotVisualizeTarget, 1)
elements.showHitchance = Toggle:new("Show Hitchance", function(state)
    AimbotConfig.weapons[AimbotConfig.configWeapon].showHitchance = state
end, AimbotConfig.weapons["Default"].showHitchance, "show_hitchance")
sections.AimbotCore:AddElement(elements.showHitchance, 1)

updateAllElements()

-- Misc tab sections
sections.Various = tabs.Misc:AddSection("Various", 10, 60, 300, 200, true)

-- Hitsound elements
elements.hitsoundEnabled = Toggle:new("Hitsounds", function(state)
    HitSoundConfig.enabled = state
end, HitSoundConfig.enabled, "hitsound_enabled")
sections.Various:AddElement(elements.hitsoundEnabled)

elements.hitsoundSelector = Dropdown:new("Hitsound", HitSoundConfig.availableSounds, function(selected)
    HitSoundConfig.selectedSound = selected
end, HitSoundConfig.selectedSound, "hitsound_selector")
sections.Various:AddElement(elements.hitsoundSelector)

elements.hitMarkerEnabled = Toggle:new("Hit Markers", function(state)
    HitMarkerConfig.enabled = state
end, HitMarkerConfig.enabled, "hitmarker_enabled")
sections.Various:AddElement(elements.hitMarkerEnabled)

-- Hitlog toggle - shows damage dealt/received notifications
elements.hitlogEnabled = Toggle:new("Hitlogs", function(state)
    HitlogConfig.enabled = state
end, HitlogConfig.enabled, "hitlog_enabled")
sections.Various:AddElement(elements.hitlogEnabled)



local ESPPreviewCategories = {"Player ESP Preview", "World ESP Preview"}
multiSections.ESPPreview = tabs.Visuals:AddMultiSection("ESP Preview", ESPPreviewCategories, 10, 60, 250, 420)
sections.PlayerESPPreview = ESPPreview:new("Player ESP Preview", multiSections.ESPPreview, 5, 25, 240, 350)
-- sections.EntityESPPreview = EntityESPPreview:new("World ESP Preview", multiSections.ESPPreview, 5, 25, 240, 300)
multiSections.ESPPreview:AddElement(sections.PlayerESPPreview, 1)
-- multiSections.ESPPreview:AddElement(sections.EntityESPPreview, 2)
local ESPCategories = {"Player ESP", "World ESP"}
multiSections.ESPSettings = tabs.Visuals:AddMultiSection("ESP Settings", ESPCategories, 270, 60, 350, 530, true)
elements.enableESP = Toggle:new("Enable ESP", function(state)
    Library.ESP.Enabled = state
end, Library.ESP.Enabled, "esp_enabled")
multiSections.ESPSettings:AddElement(elements.enableESP, 1)
elements.maxDistanceSlider = Slider:new("Max Distance", 100, 5000, Library.ESP.MaxDistance, function(value)
    Library.ESP.MaxDistance = value
end, "esp_max_distance")
multiSections.ESPSettings:AddElement(elements.maxDistanceSlider, 1)
elements.espTypes = MultiSelectDropdown:new("Show ESP", {"Visible", "Hidden"}, function(selected)
    Library.ESP.Targets = selected
end, Library.ESP.Targets, "esp_targets")
multiSections.ESPSettings:AddElement(elements.espTypes, 1)
elements.boxToggle = Toggle:new("Box ESP", function(state)
    Library.ESP.Show2DBox = state
    Library.ESPPreview.Components.Box = state
end, Library.ESP.Show2DBox, "esp_box")
elements.boxToggle:AddColorPicker("Box Color", function(color)
    Library.ESP.Colors.Box = color
    Library.ESPPreview.Colors.Box = color
end, Library.ESP.Colors.Box)
multiSections.ESPSettings:AddElement(elements.boxToggle, 1)
elements.healthBarToggle = Toggle:new("Health Bar", function(state)
    Library.ESP.ShowHealth = state
    Library.ESPPreview.Components.HealthBar = state
end, Library.ESP.ShowHealth, "esp_healthbar")
elements.healthBarToggle:AddColorPicker("Health Bar Color", function(color)
    Library.ESP.Colors.HealthBar = color
    Library.ESPPreview.Colors.HealthBar = color
end, Library.ESP.Colors.HealthBar or {0, 255, 0, 255})
multiSections.ESPSettings:AddElement(elements.healthBarToggle, 1)

elements.healthBarAddons = MultiSelectDropdown:new("Addons", {"Custom Color", "Healthbar Glow", "Health text", "Gradient", "Gradient Animation"}, function(selected)
    Library.ESP.HealthBarAddons = selected
end, Library.ESP.HealthBarAddons, "esp_healthbar_addons")
multiSections.ESPSettings:AddElement(elements.healthBarAddons, 1)
elements.nameToggle = Toggle:new("Name ESP", function(state)
    Library.ESP.ShowName = state
    Library.ESPPreview.Components.Name = state
end, Library.ESP.ShowName, "esp_name")
elements.nameToggle:AddColorPicker("Name Color", function(color)
    Library.ESP.Colors.Name = color
    Library.ESPPreview.Colors.Name = color
end, Library.ESP.Colors.Name)
multiSections.ESPSettings:AddElement(elements.nameToggle, 1)
elements.distanceToggle = Toggle:new("Distance ESP", function(state)
    Library.ESP.ShowDistance = state
    Library.ESPPreview.Components.Distance = state
end, Library.ESP.ShowDistance, "esp_distance")
elements.distanceToggle:AddColorPicker("Distance Color", function(color)
    Library.ESP.Colors.Distance = color
    Library.ESPPreview.Colors.Distance = color
end, Library.ESP.Colors.Distance)
multiSections.ESPSettings:AddElement(elements.distanceToggle, 1)
elements.weaponToggle = Toggle:new("Weapon ESP", function(state)
    Library.ESP.ShowWeapon = state
    Library.ESPPreview.Components.Weapon = state
end, Library.ESP.ShowWeapon, "esp_weapon")
elements.weaponToggle:AddColorPicker("Weapon Color", function(color)
    Library.ESP.Colors.Weapon = color
    Library.ESPPreview.Colors.Weapon = color
end, Library.ESP.Colors.Weapon)
multiSections.ESPSettings:AddElement(elements.weaponToggle, 1)
elements.skeletonToggle = Toggle:new("Skeleton ESP", function(state)
    Library.ESP.ShowSkeleton = state
    Library.ESPPreview.Components.Skeleton = state
end, Library.ESP.ShowSkeleton, "esp_skeleton")
elements.skeletonToggle:AddColorPicker("Skeleton Color", function(color)
    Library.ESP.Colors.Skeleton = color
    Library.ESPPreview.Colors.Skeleton = color
end, Library.ESP.Colors.Skeleton)
multiSections.ESPSettings:AddElement(elements.skeletonToggle, 1)

elements.hitboxToggle = Toggle:new("Hitbox ESP", function(state)
    Library.ESP.ShowHitboxes = state
    Library.ESPPreview.Components.Hitbox = state
end, Library.ESP.ShowHitboxes or false, "esp_hitbox")
elements.hitboxToggle:AddColorPicker("Hitbox Color", function(color)
    Library.ESP.Colors.Hitbox = color
    Library.ESPPreview.Colors.Hitbox = color
end, Library.ESP.Colors.Hitbox or {255, 255, 255, 255})
multiSections.ESPSettings:AddElement(elements.hitboxToggle, 1)

elements.hitboxSegments = Slider:new("Hitbox Segments", 6, 24, 12, function(value)
    Library.ESP.HitboxSegments = value
end, "esp_hitbox_segments")
multiSections.ESPSettings:AddElement(elements.hitboxSegments, 1)

elements.hitboxThickness = Slider:new("Hitbox Thickness", 0.5, 3.0, 1.0, function(value)
    Library.ESP.HitboxThickness = value
end, "esp_hitbox_thickness")
multiSections.ESPSettings:AddElement(elements.hitboxThickness, 1)

elements.flagsToggle = Toggle:new("Flags ESP", function(state)
    Library.ESP.ShowFlags = state
    Library.ESPPreview.Components.Flags = state
end, Library.ESP.ShowFlags, "esp_flags")
elements.flagsToggle:AddColorPicker("Flags Color", function(color)
    Library.ESP.Colors.Flags = color
    Library.ESPPreview.Colors.Flags = color
end, Library.ESP.Colors.Flags)
multiSections.ESPSettings:AddElement(elements.flagsToggle, 1)
elements.onlyEnemiesToggle = Toggle:new("Only Enemies", function(state)
    Library.ESP.OnlyEnemies = state
end, Library.ESP.OnlyEnemies, "esp_only_enemies")
multiSections.ESPSettings:AddElement(elements.onlyEnemiesToggle, 1)



elements.enemyColorPicker = ColorPicker:new("Enemy Color", function(color)
    Library.ESP.Colors.Enemy = color
end, Library.ESP.Colors.Enemy, "esp_enemy_color")
multiSections.ESPSettings:AddElement(elements.enemyColorPicker)
elements.friendlyColorPicker = ColorPicker:new("Friendly Color", function(color)
    Library.ESP.Colors.Friendly = color
end, Library.ESP.Colors.Friendly, "esp_friendly_color")
multiSections.ESPSettings:AddElement(elements.friendlyColorPicker)
elements.maxDistanceSlider = Slider:new("Max Distance", 100, 20000, Library.ESP.MaxDistance, function(value)
    Library.ESP.MaxDistance = value
end, "esp_max_distance")
multiSections.ESPSettings:AddElement(elements.maxDistanceSlider)
local function isItemSelected(itemName, selectedArray)
    for _, selected in ipairs(selectedArray) do
        if string.find(itemName:lower(), selected:lower()) then
            return true
        end
    end
    return false
end

sections.MainPlayerList = tabs.Player:AddPlayerList("Player List", 10, 60, 610, 450)
sections.General = tabs.Settings:AddSection("General Settings", 10, 60, 300, 200, true)
elements.toggleKeybindsList = Toggle:new("Keybinds List", function(state)
    Library.KeybindsList.visible = state
end, Library.KeybindsList.visible, "keybinds_list_enabled")
sections.General:AddElement(elements.toggleKeybindsList)
elements.toggleTargetHUD = Toggle:new("Target HUD", function(state)
    Library.TargetHUD.visible = state
end, Library.TargetHUD.visible, "target_hud_enabled")
sections.General:AddElement(elements.toggleTargetHUD)
elements.menu_toggle = Toggle:new("Menu Toggle", function(state)
end, false, "menu_visible")
elements.menu_keybind = elements.menu_toggle:AddKeybind(0x12, "Toggle")
sections.General:AddElement(elements.menu_toggle)
sections.General:AddSeparator("Animation Settings")
elements.enableAnimations = Toggle:new("Enable Animations", function(state)
    Library.Settings.Tween = state
end, Library.Settings.Tween, "animations_enabled")
sections.General:AddElement(elements.enableAnimations)
elements.animationSpeed = Slider:new("Animation Speed", 0.05, 0.3, Library.Settings.Animation.Speed, function(value)
    Library.Settings.Animation.Speed = value
end, "animation_speed")
sections.General:AddElement(elements.animationSpeed)
elements.enableMenuFade = Toggle:new("Menu Transitions", function(state)
    Library.Settings.MenuFade = state
end, Library.Settings.MenuFade or false, "menu_fade_enabled")
sections.General:AddElement(elements.enableMenuFade)

elements.tabTransitionType = Dropdown:new("Tab Transition Type", {"Fade", "Slide Up/Down"}, function(selected)
    Library.Settings.TabTransitionType = selected
end, Library.Settings.TabTransitionType, "tab_transition_type")
sections.General:AddElement(elements.tabTransitionType)

elements.titleAnimationType = Dropdown:new("Title Animation Type",
    {"Letter by Letter", "Split Gradient", "Wave Effect", "Pulse"}, function(selected)
        Library.Settings.TitleAnimationType = selected
    end, Library.Settings.TitleAnimationType, "title_animation_type")
sections.General:AddElement(elements.titleAnimationType)

sections.Theme = tabs.Settings:AddSection("Theme Settings", 320, 60, 300, 415)
local themeNames = {}
for name, _ in pairs(Library.Theme.List) do
    table.insert(themeNames, name)
end
elements.themeSelector = Dropdown:new("Select Theme", themeNames, function(selected)
end, Library.Theme.Selected, "selected_theme")
sections.Theme:AddElement(elements.themeSelector)
local themeKeys = {"Accent", "Warning", "Error", "Header", "Text", "Secondary", "Outer", "Light", "Dark", "High", "Mid",
                   "Low", "Stroke", "AccentLight", "MidLight"}
elements.applyThemeButton = Button:new("Apply Theme", function()
    if elements.themeSelector.value then
        Library.Theme.Selected = elements.themeSelector.value
        Library.RefreshTheme()
        for i, key in ipairs(themeKeys) do
            elements[key .. "Picker"]:Set(Library.Theme.List[Library.Theme.Selected][key])
        end
    end
end)
sections.Theme:AddElement(elements.applyThemeButton)
elements.colorPickers = {}
for i, key in ipairs(themeKeys) do
    local row = math.floor((i - 1) / 2)
    local col = (i - 1) % 2
    elements["label_" .. key] = {
        Render = function()
            local x, y = sections.Theme:GetAbsolutePos()
            local theme = Library.Theme.List[Library.Theme.Selected]
            local labelX = 320 + 10 + (col * 150)
            local labelY = 60 + 40 + (row * 25)
            render.text(labelX, labelY, theme.Text[1], theme.Text[2], theme.Text[3], theme.Text[4], 1, false, key)
        end
    }
    elements[key .. "Picker"] = ColorPicker:new(key, function(color)
        if Library.Theme.List[Library.Theme.Selected] then
            Library.Theme.List[Library.Theme.Selected][key] = color
            for _, window in ipairs(Library.Windows) do
                window.theme = Library.Theme.List[Library.Theme.Selected]
            end
        end
    end, Library.Theme.List[Library.Theme.Selected][key])
    elements[key .. "Picker"].x = 320 + 80 + (col * 150)
    elements[key .. "Picker"].y = 60 + 35 + (row * 25)
    elements[key .. "Picker"].width = 20
    elements[key .. "Picker"].height = 15
    sections.Theme:AddElement(elements[key .. "Picker"])
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
        if elements[key .. "Picker"] then
            elements[key .. "Picker"].color = value
        end
    end
    for _, window in ipairs(Library.Windows) do
        window.theme = Library.Theme.List[currentTheme]
    end
end)
sections.Theme:AddElement(elements.resetThemeButton)
function table.clone(org)
    if type(org) ~= "table" then
        return org
    end
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
            Library.Notify("Config Saved", "Successfully saved settings to " .. configName .. ".json")
            elements.configList.options = Library.ConfigSystem:GetConfigs()
        else
            Library.Notify("Config Error", "Failed to save config: " .. configName, "error", 5000)
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
            Library.Notify("Config Loaded", "Successfully loaded config " .. configName .. ".json")
        else
            Library.Notify("Config Error", "Failed to load config: " .. configName, "error", 5000)
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
            Library.Notify("Config Deleted", "Successfully deleted config " .. configName .. ".json")
        else
            Library.Notify("Config Error", "Failed to delete config: " .. configName, "error", 5000)
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
elements.watermarkPosition = Dropdown:new("Position", {"top-right", "top-left", "bottom-right", "bottom-left"},
    function(selected)
        if Library.Watermark then
            Library.Watermark:SetPosition(selected)
        end
    end, "top-right", "watermark_position")
sections.Watermark:AddElement(elements.watermarkPosition)
local g_ores = {}
local g_plants = {}
local g_keycards = {}
local g_digpiles = {}
local g_benchspawns = {}
local g_mods = {}
local players_children = {}
local g_drops = {}
local function mouse_within(x, y, mx, my, w, h)
    return mx >= x and mx <= x + w and my >= y and my <= y + h
end
local function find_in_table(table, element)
    for i, v in pairs(table) do
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
    if not items or #items == 0 then
        return
    end
    local entities = get_entities()
    local local_player = nil
    for _, ent in ipairs(entities) do
        if ent.controller and memory.read_int64(ent.controller + offsets.dwLocalPlayerController) ~= 0 then
            local_player = ent
            break
        end
    end
    if not local_player then
        return
    end
    local local_position = vector(local_player:get_position())
    for _, item in pairs(items) do
        local distance = local_position:dist_to(item[pos_key])
        distance = math.floor(distance + 0.5)
        if distance_limit < distance then
            goto continue
        end
        local screen_pos = vector(source_2_wts(item[pos_key]:unpack()))
        if screen_pos:is_zero() then
            goto continue
        end
        local clr = color
        local w, h = render.measure_text(0, false, item[name_key])
        local w1, h1 = render.measure_text(0, false, tostring(distance) .. "M")
        render.text(screen_pos.x - w / 2, screen_pos.y - h / 2, clr[1], clr[2], clr[3], clr[4], 0, false, item[name_key])
        if show_distance then
            render.text(screen_pos.x - w1 / 2, screen_pos.y - h1 / 2 + 7, clr[1], clr[2], clr[3], clr[4], 0, false,
                tostring(distance) .. "M")
        end
        if tracers then
            render.line(window_width / 2, 0, screen_pos.x, screen_pos.y, clr[1], clr[2], clr[3], clr[4], 1)
        end
        ::continue::
    end
end



local windowVisible = true
local lastInsertState = false
local lastPlayerUpdate = 0
local function Update()
    UpdateInputState()
    
    if get_local_player():is_alive() then
        aimbot:update()
    end
    Library.ESP.EntityCache:Update()

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
        if sections.MainPlayerList then
            sections.MainPlayerList:UpdatePlayers()
        end
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
        if elements.aimbotEnabled.keybind.keyCode ~= AimbotConfig.globalKeybind.key then
            AimbotConfig.globalKeybind.key = elements.aimbotEnabled.keybind.keyCode
        end
        local currentKeyState = utility.key_state(AimbotConfig.globalKeybind.key)
        AimbotConfig.globalKeybind.active = currentKeyState
    end
    get_entities()
end
local function Render()
    aimbot:render()
    aimbot:triggerbot()
    aimbot:rcs()

    -- Hitsound detection (simplified - would need proper hit detection in real implementation)
    if HitSoundConfig.enabled and aimbot.current_frame_target_data then
        -- This is a placeholder - proper hit detection would require game state monitoring
        -- aimbot:playHitSound()
    end
    if Library.ESP and Library.ESP.Enabled then
        Library.ESP:RenderPlayers()
    end

    if Library.TargetHUD then
        Library.TargetHUD:Render()
    end



    -- Render hit markers
    if HitMarkerConfig.enabled and #HitMarkerConfig.effects > 0 then
        local currentTime = utility.get_tickcount()
        for i = #HitMarkerConfig.effects, 1, -1 do
            local effect = HitMarkerConfig.effects[i]
            local elapsed = currentTime - effect.startTime
            
            if elapsed >= effect.duration then
                table.remove(HitMarkerConfig.effects, i)
            else
                local progress = elapsed / effect.duration
                local alpha = effect.alpha * (1 - progress)
                local size = effect.size + (progress * 4)
                local gap = 3 -- Gap in the middle
                
                -- Calculate diagonal line positions (45 degree angle)
                local cos45 = 0.707 -- cos(45°)
                local sin45 = 0.707 -- sin(45°)
                
                -- Top-left to bottom-right diagonal line (with gap)
                local x1 = effect.x - (size + gap) * cos45
                local y1 = effect.y - (size + gap) * sin45
                local x2 = effect.x - gap * cos45
                local y2 = effect.y - gap * sin45
                Drawing:Line(x1, y1, x2, y2, {255, 255, 255, alpha}, 1)
                
                local x3 = effect.x + gap * cos45
                local y3 = effect.y + gap * sin45
                local x4 = effect.x + (size + gap) * cos45
                local y4 = effect.y + (size + gap) * sin45
                Drawing:Line(x3, y3, x4, y4, {255, 255, 255, alpha}, 1)
                
                -- Top-right to bottom-left diagonal line (with gap)
                local x5 = effect.x + (size + gap) * cos45
                local y5 = effect.y - (size + gap) * sin45
                local x6 = effect.x + gap * cos45
                local y6 = effect.y - gap * sin45
                Drawing:Line(x5, y5, x6, y6, {255, 255, 255, alpha}, 1)
                
                local x7 = effect.x - gap * cos45
                local y7 = effect.y + gap * sin45
                local x8 = effect.x - (size + gap) * cos45
                local y8 = effect.y + (size + gap) * sin45
                Drawing:Line(x7, y7, x8, y8, {255, 255, 255, alpha}, 1)
            end
        end
    end
    if Library.KeybindsList then
        Library.KeybindsList:Render()
    end
    for _, window in ipairs(Library.Windows or {}) do
        if window and window.visible and window.Render then
            window:Render()
        end
    end
    local popupElements = {}
    for _, element in ipairs(Library.SortedElements or {}) do
        if element then
            if element.__index == Graph and element.popupOpen then
                table.insert(popupElements, element)
            elseif element.open or element.menuOpen or (element.colorPicker and element.colorPicker.open) then
                table.insert(popupElements, element)
            end
        end
    end
    table.sort(popupElements, function(a, b)
        local aZ = a.zIndex or 0
        local bZ = b.zIndex or 0
        if a.__index == Graph and a.popupOpen then
            aZ = aZ + 10000
        end
        if b.__index == Graph and b.popupOpen then
            bZ = bZ + 10000
        end
        return aZ < bZ
    end)
    for _, element in ipairs(popupElements) do
        if MainWindow.visible then
            if element.__index == Graph and element.popupOpen and element.RenderPopup then
                element:RenderPopup()
            end
            if element.RenderPopup and (element.open or element.menuOpen) then
                element:RenderPopup()
            end
        end
        if element.colorPicker and element.colorPicker.RenderPopup and element.colorPicker.open then
            element.colorPicker:RenderPopup()
        end
    end
    if Library.Watermark then
        Library.Watermark:Render()
    end
    if Library.Notifications then
        Library.Notifications:RenderAll()
    end

    if Library.CustomCursor and Library.CustomCursor.enabled then
        local cursorX, cursorY = get_cursor_position()
        local theme = Library.Theme.List[Library.Theme.Selected]
        local accent = theme.Accent or {100, 150, 255, 255}
        local currentTime = utility.get_tickcount()

        -- Update trail positions
        if currentTime - Library.CustomCursor.lastUpdate > 0.01 then
            table.insert(Library.CustomCursor.trailPositions, 1, {
                x = cursorX,
                y = cursorY,
                time = currentTime
            })
            if #Library.CustomCursor.trailPositions > Library.CustomCursor.trailLength then
                table.remove(Library.CustomCursor.trailPositions)
            end
            Library.CustomCursor.lastUpdate = currentTime
        end

        -- Render trail
        if Library.CustomCursor.trail and #Library.CustomCursor.trailPositions > 1 then
            for i = 2, #Library.CustomCursor.trailPositions do
                local pos1 = Library.CustomCursor.trailPositions[i - 1]
                local pos2 = Library.CustomCursor.trailPositions[i]
                local alpha = (1 - (i - 1) / Library.CustomCursor.trailLength) * 0.6
                local trailAccent = {accent[1], accent[2], accent[3], math.floor(accent[4] * alpha)}

                render.line(pos1.x, pos1.y, pos2.x, pos2.y, trailAccent[1], trailAccent[2], trailAccent[3],
                    trailAccent[4], 1)
            end
        end

        -- Render main cursor triangle
        local size = Library.CustomCursor.size
        local thickness = Library.CustomCursor.thickness

        -- Triangle points
        local x1, y1 = cursorX, cursorY
        local x2, y2 = cursorX + size * 0.7, cursorY + size * 0.4
        local x3, y3 = cursorX + size * 0.4, cursorY + size * 0.7

        -- Gradient effect
        if Library.CustomCursor.gradient then
            local gradientColor1 = {accent[1], accent[2], accent[3], accent[4]}
            local gradientColor2 = {math.max(0, accent[1] - 40), math.max(0, accent[2] - 40),
                                    math.max(0, accent[3] - 40), accent[4]}

            -- Fill triangle with gradient effect using multiple lines
            for i = 0, size do
                local progress = i / size
                local lerpR = gradientColor1[1] + (gradientColor2[1] - gradientColor1[1]) * progress
                local lerpG = gradientColor1[2] + (gradientColor2[2] - gradientColor1[2]) * progress
                local lerpB = gradientColor1[3] + (gradientColor2[3] - gradientColor1[3]) * progress
                local lerpA = gradientColor1[4] + (gradientColor2[4] - gradientColor1[4]) * progress

                local lineY = cursorY + i * 0.7
                local lineX1 = cursorX + i * 0.4
                local lineX2 = cursorX + (size * 0.7) - i * 0.3

                if lineX2 > lineX1 and lineY <= cursorY + size * 0.7 then
                    render.line(lineX1, lineY, lineX2, lineY, lerpR, lerpG, lerpB, lerpA, 1)
                end
            end
        else
            -- Simple filled triangle
            render.line(x1, y1, x2, y2, accent[1], accent[2], accent[3], accent[4], thickness + 2)
            render.line(x2, y2, x3, y3, accent[1], accent[2], accent[3], accent[4], thickness + 2)
            render.line(x3, y3, x1, y1, accent[1], accent[2], accent[3], accent[4], thickness + 2)
        end

        -- Outline with thin borders
        local outlineColor = {255, 255, 255, 200}
        render.line(x1, y1, x2, y2, outlineColor[1], outlineColor[2], outlineColor[3], outlineColor[4], thickness)
        render.line(x2, y2, x3, y3, outlineColor[1], outlineColor[2], outlineColor[3], outlineColor[4], thickness)
        render.line(x3, y3, x1, y1, outlineColor[1], outlineColor[2], outlineColor[3], outlineColor[4], thickness)

        -- Inner highlight for sleek effect
        local highlightColor = {255, 255, 255, 100}
        local hx1, hy1 = cursorX + 2, cursorY + 2
        local hx2, hy2 = cursorX + (size * 0.7) - 2, cursorY + (size * 0.4) - 1
        render.line(hx1, hy1, hx2, hy2, highlightColor[1], highlightColor[2], highlightColor[3], highlightColor[4], 0.5)
    end
end

Library.ConfigSystem:RegisterCustomData("AimbotConfig", AimbotConfig)

-- Startup notifications
Library.Notify("Tyrisware", "Script initialized successfully", "info", 4000)
Library.Notify("Status", "All systems operational", "info", 3000)

platform.set_callback("paint", Update)
platform.set_callback("paint", Render)

local prev_hits = 0
platform.set_callback("tick", function()
    view_matrix = memory.read_mat4(client + offsets.dwViewMatrix)

    cached_matrix = {}
    for i = 0, 15 do
        cached_matrix[i + 1] = view_matrix[i + 1]
    end
    matrix_cache_time = utility.get_tickcount()

    local plrHits = memory.read_int64(get_local_player().pawn + 0x1518)
    local hits = memory.read_int(plrHits + offsets.CCSPlayer_BulletServices.m_totalHitsOnServer)
    if prev_hits < hits then
        prev_hits = hits
        aimbot:playHitSound()
        aimbot:playHitMarker()
        
        -- Track hit time for hitlogs correlation
        if HitlogConfig.enabled then
            HitlogConfig.lastHitTime = utility.get_tickcount()
        end
    end
    
    -- Update hitlog tracking for damage received
    updateHitlogTracking()

end)
