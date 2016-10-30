require("event")
local truth = event:new()

truth.NAME = "truth"
truth.state = "init"

truth.script = {
    ["init"] = {
        ["description"] = [[Believe it or not, I'm from the future.
At my time, people connect their brain directly with computers. We're living in a highly improved virtual-reality, as you people may say. One day, my computer got infected by a virus called DEVOURER, unfortunately, and my soul was abstructed from my body. Unconsciously at the beginning, then after I realized what was going on, I started looking for a way out. I figured out how it worked and what needs to be done in order to free me. But I need others' help.
    I have tried to reach some people at my time, but failed. Maybe because they were over involved with their computers. I don't know. I was desperate, I tried everything to reach any one who's not wiring their mind to a computer. 
    When I was about to give up, I got in touch with you. Thank goodness!
1. So, what should I do to help you out.
2. Ok, I heard what you said. 
3. No, I don't believe it.]],
        ["1"] = {
            ["react"] = [[I'm so glad you believed.
(To be continued)]],
            ["nextState"] = "end",
        },
        ["2"] = {
            ["react"] = [[Yeah, I wouldn't believe this if I were you.]],
            ["nextState"] = "explan",
        },
        ["3"] = {
            ["react"] = [[Everything I said is truth. At least it's what I remember...]],
            ["nextState"] = "prove",
        },
    },
    ["explan"] = {
        ["description"] = [[I really don't have any other options here. And it will do no harm for you to try, I promise. You are definitely safe, as you are not wiring yourself with your computer and you can power it off whenever you want.
1. Maybe I will give it a shot.]],
        ["1"] = {
            ["react"] = [[Thank you, I really appraciate that!
(To be continued)]],
            ["nextState"] = "end",
        },
    },
    ["prove"] = {
        ["description"] = [[Yeah, I fully understand. Time travelling, how did it work? Honestly I don't know. All I remember is that I was trying everything to reach someone. When I finally got you, I can't believe the system time I read, neither. No matter, I will bother no more. Good day to you!
 1. To you, too.]],
        ["1"] = {
            ["react"] = [[...
(To be continued)]],
            ["nextState"] = "end",
        },
    },
}

return truth
