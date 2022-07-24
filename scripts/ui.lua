local ui = {}

function ui.draw()
    love.graphics.setNewFont("fonts/DTM-Mono.ttf", 45)
    -- Paddle 1
    love.graphics.printf(tostring(Paddle1.score), 25, 25, 1000, "left")
    -- Paddle 2
    love.graphics.printf(tostring(Paddle2.score), -70, 25, 1000, "right")
    -- Speed multipler
    love.graphics.setNewFont("fonts/DTM-Mono.ttf", 24)
    love.graphics.printf(string.sub(tostring(SpeedMultiplier), 1, 4) .. "x", -15, 0, 1000, "center")
end

return ui