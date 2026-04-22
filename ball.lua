-- ==================== BALL MODULE ====================
-- Contains ball-related utilities and physics
-- Can be extended for more complex ball behaviors

function resetBallPosition()
    ball.x = config.canvas.width / 2
    ball.y = config.canvas.height / 2
    ball.dx = config.ball.speed * (math.random() > 0.5 and 1 or -1)
    ball.dy = config.ball.speed * (math.random() > 0.5 and 1 or -1)
end

function checkBallWallCollision(ball)
    -- Check and handle top/bottom wall collisions
    if ball.y - ball.size < 0 or ball.y + ball.size > config.canvas.height then
        ball.dy = -ball.dy
        ball.y = math.max(ball.size, math.min(config.canvas.height - ball.size, ball.y))
        return true
    end
    return false
end

function checkBallOutOfBounds(ball)
    -- Check if ball is out of bounds (scoring)
    if ball.x - ball.size < 0 then
        return "left"
    elseif ball.x + ball.size > config.canvas.width then
        return "right"
    end
    return nil
end
