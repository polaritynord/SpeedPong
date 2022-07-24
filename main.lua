local vec2 = require("lib/vec2")
local paddle = require("scripts/paddle")
local ball = require("scripts/ball")

Paddle1 = nil
Paddle2 = nil
Ball = nil

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
end

function love.draw()
    Paddle1.draw()
    Paddle2.draw()
    Ball.draw()
end
