local guard = {}

guard.NAME = "guard"

guard.state = "init"

function guard.describeCurrentState()
    if this.state == "init" then
        return "Hey, what are you doing here?"
    end
end

function guard.nextModuleName()
    return "end"
end

function guard.choos(choice)
    return "choose"
end

return guard
