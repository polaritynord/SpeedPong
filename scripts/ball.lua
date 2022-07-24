local vec2 = require("lib/vec2")

local ball = {}

function ball.new()
    local b = {
        position = vec2.new(480, 270);
        xSpeed = 1; ySpeed = 1;
        img = love.graphics.newImage("images/ball.png");
    }

    function b.bounce(delta)
        local width = b.img:getWidth()
        local height = b.img:getHeight()
        if b.position.x < width/2 or b.position.x > 960 - width/2 then
            b.xSpeed = -b.xSpeed
        end
        if b.position.y < height/2 or b.position.y > 540 - height/2 then
            b.ySpeed = -b.ySpeed
        end
    end

    function b.movement(delta)
        local speed = 100
        b.position.x = b.position.x + b.xSpeed * speed * delta
        b.position.y = b.position.y + b.ySpeed * speed * delta
    end

    function b.update(delta)
        b.movement(delta)
        b.bounce(delta)
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