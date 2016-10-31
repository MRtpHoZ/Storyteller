--[[
Base class for events.
Events are single lua files stands for events in the story.
Sub classes can override these functions to do custom work like store status variables.
]]


event = {}

-- Name of the event.
event.NAME = "baseEvent"

-- Initial state of the event.
event.state = "init"

event.script = {
    ["init"] = {                        -- State name, could be any string.
        ["description"] = [[]],         -- State description, which consists of dialogs, narratives and choices.
        ["1"] = {                       -- Choice index.
            ["react"] = [[]],           -- Reaction text showed right after player makes decision.
            ["nextState"] = "end",      -- Next state to go based on current state and player's choice.
                                        -- If next state name does not exist in current event, new event will be searched, meanwhile current state ends.
        },
        ["2"] = {
            ["react"] = [[]],
            ["nextState"] = "",
        }
    }
}

--[[
- Create a new child object, inherits from event.
- @param  object childObject
- @return object childObject
]]
function event:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    return o
end

--[[
- Return description of current state, including dialogs, narratives and choices.
- @return string
]]
function event:describeCurrentState()
    if self.script[self.state] then
        return self.script[self.state].description
    else
        log("ERROR, invalid state: " .. self.state)
    end
end

--[[
- Return name of next event. If next state is in current event, return current event name, or return next state name.
- @return string
]]
function event:nextModuleName()
    if self.script[self.state] == nil then
        return self.state
    else
        return self.NAME
    end
end

--[[
- Handle player's choice.
- @return string reaction on the choice.
]]
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
