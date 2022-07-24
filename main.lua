local vec2 = require("lib/vec2")
local paddle = require("scripts/paddle")
local ball = require("scripts/ball")

Paddle1 = nil
Paddle2 = nil
Ball = nil
SpeedMultiplier = 1

function love.load()
    PaddleImg = love.graphics.newImage("images/paddle.png")
    Paddle1 = paddle.new()
    Paddle1.position = vec2.new(20, 270)

    Paddle2 = paddle.new()
    Paddle2.id = 2
    Paddle2.position = vec2.new(940, 270)

    Ball = ball.new()
end

function love.update(delta)
    Paddle1.update(delta)
    Paddle2.update(delta)
    Ball.update(delta)
    -- Increment speed multiplier
    SpeedMultiplier = SpeedMultiplier + 0.02 * delta
end

function love.draw()
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
    -- Draw UI
    love.graphics.setNewFont("fonts/DTM-Mono.ttf", 45)
    -- Paddle 1
    love.graphics.printf(tostring(Paddle1.score), 25, 25, 1000, "left")
    -- Paddle 2
    love.graphics.printf(tostring(Paddle2.score), -70, 25, 1000, "right")
    -- Speed multipler
    love.graphics.setNewFont("fonts/DTM-Mono.ttf", 24)
    love.graphics.printf(string.sub(tostring(SpeedMultiplier), 1, 4) .. "x", -15, 0, 1000, "center")
end
