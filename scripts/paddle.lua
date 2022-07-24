local vec2 = require("lib/vec2")

local paddle = {}

function paddle.new()
    local p = {
        position = vec2.new();
        id = 1;
    }

    function p.update(delta)
        
    end

    function p.draw()
        local width = PaddleImg:getWidth()
        local height = PaddleImg:getHeight()
        love.graphics.draw(
            PaddleImg, p.position.x, p.position.y, 0,
            1, 1, width/2, height/2
        )
    end

    return p
end

return paddle