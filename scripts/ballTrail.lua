local vec2 = require("lib/vec2")

local ballTrail = {}

function ballTrail.new()
    local t = {
        pos = vec2.new();
        scale = 1;
        alpha = 1;
    }

    function t.update(delta, i)
        t.scale = t.scale - 2 * delta
        t.alpha = t.alpha - 1 * delta
        -- Despawn ball
        if t.scale < 0 then
            table.remove(Ball.trails, i)
        end
    end

    function t.draw()

    end

    return t
end

return ballTrail
