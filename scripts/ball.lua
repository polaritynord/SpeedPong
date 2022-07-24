local vec2 = require("lib/vec2")
local collision = require("lib/collision")

local ball = {}

function ball.new()
    local b = {
        position = vec2.new(480, 270);
        xSpeed = 1; ySpeed = 1;
        img = love.graphics.newImage("images/ball.png");
    }

    function b.bounce()
        local width = b.img:getWidth()
        local height = b.img:getHeight()
        -- Edge bouncing
        if b.position.x < width/2 or b.position.x > 960 - width/2 then
            b.xSpeed = -b.xSpeed
        end
        if b.position.y < height/2 or b.position.y > 540 - height/2 then
            b.ySpeed = -b.ySpeed
        end
        -- Paddle1 bouncing
        local pWidth = PaddleImg:getWidth()
        local pHeight = PaddleImg:getHeight()
        if collision(
            b.position.x-width/2, b.position.y-height/2, width, height,
            Paddle1.position.x-pWidth/2, Paddle1.position.y-pHeight/2, pWidth, pHeight
        ) and b.position.x-width/2 < Paddle1.position.x then
            Paddle1.score = Paddle1.score + 1
            b.xSpeed = -b.xSpeed
        end
        -- Paddle2 bouncing
        if collision(
            b.position.x-width/2, b.position.y-height/2, width, height,
            Paddle2.position.x-pWidth/2, Paddle2.position.y-pHeight/2, pWidth, pHeight
        ) and b.position.x+width/2 < Paddle2.position.x then
            Paddle2.score = Paddle2.score + 1
            b.xSpeed = -b.xSpeed
        end
    end

    function b.movement(delta)
        local speed = 100
        b.position.x = b.position.x + b.xSpeed * speed * SpeedMultiplier * delta
        b.position.y = b.position.y + b.ySpeed * speed * SpeedMultiplier * delta
    end

    function b.update(delta)
        b.movement(delta)
        b.bounce()
    end

    function b.draw()
        local width = b.img:getWidth()
        local height = b.img:getHeight()
        love.graphics.draw(
            b.img, b.position.x, b.position.y, 0,
            1, 1, width/2, height/2
        )
    end

    return b
end

return ball