-- ==================== PADDLE MODULE ====================
-- Contains paddle-related utilities
-- Can be extended for more complex paddle behaviors

-- You can add custom paddle functions here
-- Example: paddle AI logic, paddle effects, etc.

function checkPaddleCollision(ball, paddle)
    -- Check if ball collides with paddle
    if ball.x - ball.size < paddle.x + paddle.width and
       ball.y > paddle.y and
       ball.y < paddle.y + paddle.height then
        return true
    end
    return false
end

function getPaddleHitAngle(ball, paddle)
    -- Calculate ball deflection angle based on hit position
    local deltaY = ball.y - (paddle.y + paddle.height / 2)
    return deltaY / (paddle.height / 2)
end
