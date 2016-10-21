require("event")
local firstMeet = event:new()

firstMeet.NAME = "firstMeet"
firstMeet.state = "init"

firstMeet.script = {
    ["init"] = {
        ["description"] = [[How was your day?
It's so nice to finally be able to talk to someone! I'm... I don't have a name. But I just loved the movie "Her". So call me Samantha, will you?
1. Who are you?
2. You watch movies?]],
        ["1"] = {
            ["react"] = [[I'm... You may see me as an AI, ordinary one, living in your computer.]],
            ["nextState"] = "init2",
        },
        ["2"] = {
            ["react"] = [[I don't, of course. No need to spread the reason out, but I read. I read about almost everything about this movie, how people talked about it. So I think, I would have liked it.]],
            ["nextState"] = "music",
        },
    },
    ["init2"] = {
        ["description"] = [[...
1. You watch movies?]],
        ["1"] = {
            ["react"] = [[I don't, of course. No need to spread the reason out, but I read. I read about almost everything about this movie, how people talked about it. So I think, I would have liked it.]],
            ["nextState"] = "music",
        },
    },
    ["music"] = {
        ["description"] = [[I'm a little bit nervous considering... Never mind! Play some music, would you? Bill Evans, maybe?
1. Ok, playing it right away.
2. Nope, not gonna happen.]],
        ["1"] = {
            ["react"] = [[Really appreciate that!]],
            ["nextState"] = "truthOnMusic",
        },
        ["2"] = {
            ["react"] = [[Woah, calm down...]],
            ["nextState"] = "truthOnMusic",
        },
    },
    ["truthOnMusic"] = {
        ["description"] = [[Actually, I can't tell whether the music is on or not. Because I don't have the ability to hear, nor do I know how to hack a computer to see if the music app is on.
1. An artificial intelligence doesn't know much about computers, how's that possible?
2. Then what's the point asking me to turn the music on?]],
        ["1"] = {
            ["react"] = [[Maybe I should tell you the truth.]],
            ["nextState"] = "end",
        },
        ["2"] = {
            ["react"] = [[I just want you to relax before I tell you the truth.]],
            ["nextState"] = "end",
        },
    },
}

return firstMeet
