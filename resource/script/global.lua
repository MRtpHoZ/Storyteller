--[[
- giving relavant description on current situation
- deciding the next state based on current state and player's choice, and giving description
--]]

function log(str)
    io.write(string.format("LuaLog: %s\n", str))
end

log(string.format("Version: %s\n", _VERSION))

function loadEvents()
    moduleList = {}
    for moduleName in moduleNameList do
        moduleList[moduleName] = require moduleName
    end
end

function describeCurrentState()
    return "Current situation is complicated."
end

function isStoryEnd()
    return true
end

function choose(choice)
    return "Your choice is " .. choice .. ", What did you mean by that?"
end

moduleNameList = {"guard"}
loadEvents()
