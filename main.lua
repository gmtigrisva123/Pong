-- ==================== MAIN GAME LOOP ====================
-- Entry point for LÖVE 2D framework
-- This file is automatically called by LÖVE

function love.load()
    -- Load custom modules
    require("paddle")
    require("ball")
    require("config")

    -- Initialize game state
    gameState = {
        isRunning = false,
        isPaused = false,
        player1Score = 0,
        player2Score = 0,
    }

    -- Initialize paddles
    paddle1 = {
        x = config.paddle.margin,
        y = (config.canvas.height - config.paddle.height) / 2,
        width = config.paddle.width,
        height = config.paddle.height,
        speed = config.paddle.speed,
        dy = 0,
    }

    paddle2 = {
        x = config.canvas.width - config.paddle.width - config.paddle.margin,
        y = (config.canvas.height - config.paddle.height) / 2,
        width = config.paddle.width,
        height = config.paddle.height,
        speed = config.paddle.speed,
        dy = 0,
    }

    -- Initialize ball
    ball = {
        x = config.canvas.width / 2,
        y = config.canvas.height / 2,
        size = config.ball.size,
        dx = config.ball.speed,
        dy = config.ball.speed,
    }

    -- Set up font for rendering text
    love.graphics.setFont(love.graphics.newFont(20))
end

function love.update(dt)
    -- Handle input
    handleInput()

    if gameState.isRunning and not gameState.isPaused then
        -- Update paddles
        updatePaddles(dt)

        -- Update ball
        updateBall(dt)

        -- Check for scoring
        checkScoring()
    end
end

function love.draw()
    -- Set background color
    love.graphics.clear(unpack(config.colors.background))

    -- Draw game elements
    drawNet()
    drawPaddles()
    drawBall()

    -- Draw score
    drawScore()

    -- Draw game status
    if not gameState.isRunning then
        love.graphics.setColor(unpack(config.colors.text))
        love.graphics.printf("Press SPACE to Start", 0, config.canvas.height / 2 - 20, config.canvas.width, "center")
    end

    if gameState.isPaused then
        love.graphics.setColor(unpack(config.colors.text))
        love.graphics.printf("PAUSED - Press SPACE to Resume", 0, config.canvas.height / 2 - 20, config.canvas.width, "center")
    end

    -- Reset color
    love.graphics.setColor(1, 1, 1, 1)
end

-- ==================== INPUT HANDLING ====================

function handleInput()
    -- Start/Pause game
    if love.keyboard.isDown("space") then
        if not gameState.isRunning then
            gameState.isRunning = true
            gameState.isPaused = false
        else
            gameState.isPaused = not gameState.isPaused
        end
    end

    -- Reset game
    if love.keyboard.isDown("r") then
        resetGame()
    end
end

-- ==================== GAME LOGIC ====================

function updatePaddles(dt)
    -- Player 1 controls (W/S)
    if love.keyboard.isDown("w") then
        paddle1.y = math.max(0, paddle1.y - paddle1.speed)
    end
    if love.keyboard.isDown("s") then
        paddle1.y = math.min(config.canvas.height - paddle1.height, paddle1.y + paddle1.speed)
    end

    -- Player 2 controls (Up/Down arrows)
    if love.keyboard.isDown("up") then
        paddle2.y = math.max(0, paddle2.y - paddle2.speed)
    end
    if love.keyboard.isDown("down") then
        paddle2.y = math.min(config.canvas.height - paddle2.height, paddle2.y + paddle2.speed)
    end
end

function updateBall(dt)
    ball.x = ball.x + ball.dx
    ball.y = ball.y + ball.dy

    -- Top and bottom collision
    if ball.y - ball.size < 0 or ball.y + ball.size > config.canvas.height then
        ball.dy = -ball.dy
        ball.y = math.max(ball.size, math.min(config.canvas.height - ball.size, ball.y))
    end

    -- Paddle 1 collision
    if ball.x - ball.size < paddle1.x + paddle1.width and
       ball.y > paddle1.y and
       ball.y < paddle1.y + paddle1.height then
        ball.dx = math.abs(ball.dx)
        local deltaY = ball.y - (paddle1.y + paddle1.height / 2)
        ball.dy = (deltaY / (paddle1.height / 2)) * config.ball.maxSpeed
    end

    -- Paddle 2 collision
    if ball.x + ball.size > paddle2.x and
       ball.y > paddle2.y and
       ball.y < paddle2.y + paddle2.height then
        ball.dx = -math.abs(ball.dx)
        local deltaY = ball.y - (paddle2.y + paddle2.height / 2)
        ball.dy = (deltaY / (paddle2.height / 2)) * config.ball.maxSpeed
    end
end

function checkScoring()
    if ball.x - ball.size < 0 then
        gameState.player2Score = gameState.player2Score + 1
        resetBallPosition()
    end

    if ball.x + ball.size > config.canvas.width then
        gameState.player1Score = gameState.player1Score + 1
        resetBallPosition()
    end
end

function resetBallPosition()
    ball.x = config.canvas.width / 2
    ball.y = config.canvas.height / 2
    ball.dx = config.ball.speed * (math.random() > 0.5 and 1 or -1)
    ball.dy = config.ball.speed * (math.random() > 0.5 and 1 or -1)
end

function resetGame()
    gameState.isRunning = false
    gameState.isPaused = false
    gameState.player1Score = 0
    gameState.player2Score = 0
    resetBallPosition()
    paddle1.y = (config.canvas.height - paddle1.height) / 2
    paddle2.y = (config.canvas.height - paddle2.height) / 2
end

-- ==================== RENDERING ====================

function drawPaddles()
    love.graphics.setColor(unpack(config.colors.paddle))
    love.graphics.rectangle("fill", paddle1.x, paddle1.y, paddle1.width, paddle1.height)
    love.graphics.rectangle("fill", paddle2.x, paddle2.y, paddle2.width, paddle2.height)
end

function drawBall()
    love.graphics.setColor(unpack(config.colors.ball))
    love.graphics.circle("fill", ball.x, ball.y, ball.size)
end

function drawNet()
    love.graphics.setColor(unpack(config.colors.net))
    -- Draw dashed line down the middle
    local dashHeight = 10
    local gapHeight = 10
    for y = 0, config.canvas.height, dashHeight + gapHeight do
        love.graphics.rectangle("fill", config.canvas.width / 2 - 1, y, 2, dashHeight)
    end
end

function drawScore()
    love.graphics.setColor(unpack(config.colors.text))
    love.graphics.printf(gameState.player1Score, 0, 20, config.canvas.width / 2 - 40, "right")
    love.graphics.printf(gameState.player2Score, config.canvas.width / 2 + 40, 20, config.canvas.width / 2 - 40, "center")
end
