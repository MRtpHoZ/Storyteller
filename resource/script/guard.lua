local event = require("event")

local guard = event:new()

guard.NAME = "guard"

guard.state = "init"

guard.script = {
    ["init"] = {
        ["description"] = [[Greetings!
1. Greetings, I think you block my way through...
2. ...(Say nothing)]],
        ["1"] = {
            ["react"] = [[(The guard looks at you suspiciously.)]],
            ["nextState"] = "battle",
        },
        ["2"] = {
            ["react"] = [[Looks like it's a silent lamb, huh?]],
            ["nextState"] = "battle",
        },
    },
    ["battle"] = {
        ["description"] = [[The guard pulls out his sword and smile: "Say goodbye to the world!"
1. Defend. 
2. Attack]],
        ["1"] = {
            ["react"] = [[Guard's sword breaks your defence, you bleed to death...]],
            ["nextState"] = "end",
        },
        ["2"] = {
            ["react"] = [[The guard dodged your attack and cuts your head off...]],
            ["nextState"] = "end",
        },
    },
}

return guard
