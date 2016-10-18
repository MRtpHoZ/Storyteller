local guard = {}

guard.NAME = "guard"

guard.state = "init"

function guard.describeCurrentState()
    if guard.state == "init" then
        return [[Hey, what are you doing here?
1. I don't know. Why don't you tell me.
2. I'm here to take what's mine.]]
    end
end

function guard.nextModuleName()
    return "end"
end

function guard.choose(choice)
    choice = math.floor(choice)
    if guard.state == "init" then
        if choice == 1 then
            guard.state = "battle"
            return [[Errr... Whatever reason, you shall not pass!]]
        elseif choice == 2 then
            guard.state = "battle"
            return [[Naive!]]
        else 
            return [[Invalid choice]]
        end
    end
end

return guard
