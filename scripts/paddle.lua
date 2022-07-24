local vec2 = require("lib/vec2")

local paddle = {}

function paddle.new()
    local p = {
        position = vec2.new();
        id = 1;
    }

    function p.movement(delta)
        -- Determine input keys based on ID
        local inpKey
        if p.id == 1 then
            inpKey = {"w", "s"} else
            inpKey = {"up", "down"} end
        -- Move paddle
        local speed = 145
        if love.keyboard.isDown(inpKey[1]) then
            p.position.y = p.position.y - speed * delta
        end
        if love.keyboard.isDown(inpKey[2]) then
            p.position.y = p.position.y + speed * delta
        end
        -- Make sure paddle stays on screen
        p.clip()
    end

    function p.clip()
        local height = PaddleImg:getHeight()
        if p.position.y < height/2 + 5 then
            p.position.y = height/2 + 5
        elseif p.position.y > 535 - height/2 then
            p.position.y = 535 - height/2
        end
    end

    function p.update(delta)
        p.movement(delta)
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