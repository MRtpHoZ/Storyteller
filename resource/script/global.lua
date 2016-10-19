--[[
- giving relavant description on current situation
- deciding the next state based on current state and player's choice, and giving description
--]]

package.path = package.path .. ";./resource/script/?.lua"

function log(str)
    io.write(string.format("LuaLog: %s\n", str))
end

log(string.format("Version: %s", _VERSION))

function loadEvents()
    moduleList = {}
    for i = 1, #moduleNameList do
        moduleName = moduleNameList[i]
        print("Load module " .. moduleName)
        moduleList[moduleName] = require(moduleName)
    end

    currentEvent = moduleList[moduleNameList[1]]
end

function describeCurrentState()
    return currentEvent:describeCurrentState()
end

function isStoryEnd()
    return currentEvent:nextModuleName() == "end"
end

function choose(choice)
    return currentEvent:choose(choice)
end

moduleNameList = {"guard"}
loadEvents()

