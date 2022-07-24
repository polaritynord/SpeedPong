local vec2 = require("lib/vec2")
local paddle = require("scripts/paddle")
local ball = require("scripts/ball")
local ui = require("scripts/ui")

function GameSetup()
    PaddleImg = love.graphics.newImage("images/paddle.png")
    Paddle1 = paddle.new()
    Paddle1.position = vec2.new(20, 270)

    Paddle2 = paddle.new()
    Paddle2.id = 2
    Paddle2.position = vec2.new(940, 270)

    Ball = ball.new()
end

function GameTerminate()
    Paddle1 = nil
    Paddle2 = nil
    Ball = nil
    SpeedMultiplier = 1
    PaddleImg = ""
end

function love.load()
    GameState = "menu"
    GameTerminate()
    GameSetup()
end

function love.update(delta)
    if GameState == "game" then
        Paddle1.update(delta)
        Paddle2.update(delta)
        Ball.update(delta)
        -- Increment speed multiplier
        if Ball.cooldownTimer > 2.5 then
            SpeedMultiplier = SpeedMultiplier + 0.045 * delta
            if SpeedMultiplier > 3.5 then SpeedMultiplier = 3.5 end
        end
    end
    --ui.update()
end

function love.draw()
    if GameState == "game" then
        -- Draw background
        love.graphics.setColor(1, 1, 1, 0.25)
        for i = 1,12 do
            love.graphics.rectangle("fill", 480-4.25, (i-1)*45+5, 8.5, 35)
        end
        love.graphics.setColor(1, 1, 1, 1)
        -- Draw paddles & ball
        love.graphics.setColor(0, 0, 1, 1)
        Paddle1.draw()
        love.graphics.setColor(1, 0, 0, 1)
        Paddle2.draw()

        love.graphics.setColor(1, 1, 1, 1)
        Ball.draw()
    end
    -- Draw UI
    ui.draw()
end
