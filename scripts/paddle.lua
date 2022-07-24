local vec2 = require("lib/vec2")

local paddle = {}

function paddle.new()
    local p = {
        position = vec2.new();
        id = 1;
    }

    return p
end

return paddle