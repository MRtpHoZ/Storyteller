local event = require("event")

local treasure = event:new()

treasure.NAME = "treasure"

treasure.state = "init"

treasure.script = {
    ["init"] = {
        ["description"] = [[You entered a treasure room...
1. Gather all.
2. Turn around and leave.]],
        ["1"] = {
            ["react"] = [[Something was triggered and stuck you in this room forever...]],
            ["nextState"] = "end",
        },
        ["2"] = {
            ["react"] = [[You left without no regrets...]],
            ["nextState"] = "end",
        },
    },
}

return treasure
