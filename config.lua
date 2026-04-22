-- ==================== GAME CONFIGURATION ====================
-- All customizable game parameters in one place

config = {
    -- Canvas/Window dimensions
    canvas = {
        width = 800,
        height = 400,
    },

    -- Paddle settings
    paddle = {
        width = 10,
        height = 80,
        speed = 300,  -- pixels per second
        margin = 15,
    },

    -- Ball settings
    ball = {
        size = 10,
        speed = 300,  -- pixels per second
        maxSpeed = 350,
    },

    -- Color settings (RGBA values 0-1)
    colors = {
        background = { 0, 0, 0, 1 },           -- Black
        paddle = { 0, 1, 0.53, 1 },            -- Neon green
        ball = { 0, 1, 0.53, 1 },              -- Neon green
        net = { 0, 1, 0.53, 1 },               -- Neon green
        text = { 0, 1, 0.53, 1 },              -- Neon green
    },
}
