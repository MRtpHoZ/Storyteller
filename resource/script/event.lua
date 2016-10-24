--[[
Base class for events.
Events are single lua files stands for events in the story. 
Sub classes can override these functions to do custom work like store status variables.
--]]


event = {}

event.NAME = "baseEvent"

event.state = "init"

event.script = {
    ["init"] = {                      -- state name
        ["description"] = [[]],     -- state description, which is presented at the beginning of each turn
        ["1"] = {                   -- choise name, made by player
            ["react"] = [[]],       -- text showed immediately after player makes their choices
            ["nextState"] = "",          -- next state to go based on current state and player's choice
        },
        ["2"] = {
            ["react"] = [[]],
            ["nextState"] = "",
        }
    }
}

function event:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

function event:describeCurrentState()
    if self.script[self.state] then
        return self.script[self.state].description
    else
        log("ERROR, invalid state: " .. self.state)
    end
end

function event:nextModuleName()
    if self.script[self.state] == nil then
        return self.state
    else
        return self.NAME
    end
end

function event:choose(choice)
    choice = math.floor(choice)
    if self.script[self.state] then
        local stateScript = self.script[self.state]
        if stateScript[tostring(choice)] then
            local choiceScript = stateScript[tostring(choice)]
            self.state = choiceScript.nextState
            return choiceScript.react
        else
            return "Invalid choice"
        end
    else
        log("ERROR, invalid state: " .. self.state)
    end
end

