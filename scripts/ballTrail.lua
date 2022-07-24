local vec2 = require("lib/vec2")

local ballTrail = {}

function ballTrail.new()
    local t = {
        position = vec2.new();
        scale = 1;
        alpha = 0.3;
    }

    function t.update(delta, i)
        t.scale = t.scale - 2 * delta
        t.alpha = t.alpha - 0.5 * delta
        -- Despawn ball
        if t.scale < 0 then
            table.remove(Ball.trails, i)
        end
    end

    function t.draw()
        local width = Ball.img:getWidth()
        local height = Ball.img:getHeight()
        love.graphics.setColor(1, 1, 1, t.alpha)
        love.graphics.draw(
            Ball.img, t.position.x, t.position.y, 0,
            t.scale, t.scale, width/2, height/2
        )
        love.graphics.setColor(1, 1, 1, 1)
    end

    return t
end

return ballTrail
