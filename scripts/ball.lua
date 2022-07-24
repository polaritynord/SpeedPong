local vec2 = require("lib/vec2")
local collision = require("lib/collision")
local ballTrail = require("scripts/ballTrail")

local ball = {}

function ball.new()
    local b = {
        position = vec2.new(480, 270);
        xSpeed = math.random(-1, 1);
        ySpeed = math.random(-1, 1);
        img = love.graphics.newImage("images/ball.png");
        cooldownTimer = 2.5;
        trailTimer = 0;
        trails = {};
    }

    function b.createTrail(delta)
        b.trailTimer = b.trailTimer + delta
        if b.trailTimer < 0.3 then
            return end
        local newTrail = ballTrail.new()
        newTrail.position = vec2.new(b.position.x, b.position.y)
        b.trails[#b.trails+1] = newTrail
    end

    function b.reset(delta)
        b.cooldownTimer = b.cooldownTimer + delta
        local width = b.img:getWidth()
        if b.position.x < width/2 then
            b.position = vec2.new(480, 270)
            b.cooldownTimer = 0
            Paddle2.score = Paddle2.score + 1
        end
        if b.position.x > 960 - width/2 then
            b.position = vec2.new(480, 270)
            b.cooldownTimer = 0
            Paddle1.score = Paddle1.score + 1
        end
    end

    function b.bounce()
        local width = b.img:getWidth()
        local height = b.img:getHeight()
        -- Edge bouncing
        if b.position.y < height/2 or b.position.y > 540 - height/2 then
            b.ySpeed = -b.ySpeed
        end
        -- Paddle1 bouncing
        local pWidth = PaddleImg:getWidth()
        local pHeight = PaddleImg:getHeight()
        if collision(
            b.position.x-width/2, b.position.y-height/2, width, height,
            Paddle1.position.x-pWidth/2, Paddle1.position.y-pHeight/2, pWidth, pHeight
        ) and b.position.x-width < Paddle1.position.x then
            b.xSpeed = -b.xSpeed
        end
        -- Paddle2 bouncing
        if collision(
            b.position.x-width/2, b.position.y-height/2, width, height,
            Paddle2.position.x-pWidth/2, Paddle2.position.y-pHeight/2, pWidth, pHeight
        ) and b.position.x+width/2 < Paddle2.position.x then
            b.xSpeed = -b.xSpeed
        end
    end

    function b.movement(delta)
        if b.cooldownTimer < 2.5 then return end
        local speed = 100
        b.position.x = b.position.x + b.xSpeed * speed * SpeedMultiplier * delta
        b.position.y = b.position.y + b.ySpeed * speed * SpeedMultiplier * delta
    end

    function b.updateTrails(delta)
        for i, v in ipairs(b.trails) do
            v.update(delta, i)
        end
    end

    function b.drawTrails()
        for _, v in ipairs(b.trails) do
            v.draw()
        end
    end

    function b.update(delta)
        b.movement(delta)
        b.bounce()
        b.reset(delta)
        b.createTrail(delta)
        b.updateTrails(delta)
    end

    function b.draw()
        b.drawTrails()
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