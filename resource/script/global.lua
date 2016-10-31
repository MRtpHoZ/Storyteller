--[[
- Giving relavant description on current situation
- Deciding the next state based on current state and player's choice, and giving description
--]]

-- Adding modules path
package.path = package.path .. ";./resource/script/?.lua"

--[[
- Output log
- @param str log
]]
function log(str)
    io.write(string.format("STLog: %s\n", str))
end

-- log(string.format("Version: %s", _VERSION))

--[[
- Load all events in moduleNameList.
]]
function loadEvents()
    moduleList = {}
    for i = 1, #moduleNameList do
        moduleName = moduleNameList[i]
        -- print("Load module " .. moduleName)
        moduleList[moduleName] = require(moduleName)
    end

    currentEvent = moduleList[moduleNameList[1]]
end

--[[
- Called in C++ code. Returning current description, which consists of dialogs, narratives and choices.
- @return string description
]]
function describeCurrentState()
    return currentEvent:describeCurrentState()
end

--[[
- Get if the story has ended. The story ends when next event cannot be found.
- @return bool
]]
function isStoryEnd()
    currentEvent = moduleList[currentEvent:nextModuleName()]

    if currentEvent == nil then
        -- Story ends when the next module name is not in moduleList.
        return true
    else
        return false
    end
end

--[[
- Pass player's choice to current event and return the reaction.
- @param number int, choice
- @return string reaction
]]
function choose(choice)
    return currentEvent:choose(choice)
end

moduleNameList = {"firstMeet", "truth"}
loadEvents()
