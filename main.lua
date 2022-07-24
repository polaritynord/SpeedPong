local vec2 = require("lib/vec2")
local paddle = require("scripts/paddle")

Paddle1 = nil
Paddle2 = nil

function love.load()
    Paddle1 = paddle.new()
    Paddle1.position = vec2.new(20, 270)
    Paddle2 = paddle.new()
    Paddle2.id = 2
    Paddle2.position = vec2.new(940, 270)
end

function love.update(_elta)
    
end

function love.draw()
    
end
