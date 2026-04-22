-- ==================== LÖVE CONFIGURATION ====================
-- This file is automatically called by LÖVE before game.love.load()
-- Used to set up initial game window and settings

function love.conf(t)
    -- Set game window title
    t.title = "Pong Game"

    -- Window dimensions
    t.window.width = 800
    t.window.height = 400
    t.window.vsync = 1  -- Enable vertical sync (60 FPS)

    -- Game version and Lua version
    t.version = "11.4"  -- LÖVE version
    t.window.resizable = false

    -- For better rendering
    t.window.msaa = 0
end
