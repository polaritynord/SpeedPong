local vec2 = require("lib/vec2")

local ball = {}

function ball.new()
    local b = {
        position = vec2.new(480, 270);
        rotation = math.random();
        img = love.graphics.newImage("images/ball.png");
    }

    function b.movement(delta)
        local speed = 100
        b.position.x = b.position.x + math.cos(b.rotation) * speed * delta
        b.position.y = b.position.y + math.sin(b.rotation) * speed * delta
    end

    function b.update(delta)
        b.movement(delta)
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