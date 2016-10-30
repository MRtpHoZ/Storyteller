/*
    LuaInterface.h
*/

#ifndef __LuaInterface_h__
#define __LuaInterface_h__

#include "../lua/include/lua.hpp"
#include "common.h"

class LuaInterface {
public:
    LuaInterface();
    ~LuaInterface();

    static LuaInterface* getInstance();
    static void removeInstance();
    
    // Access global variable in Lua State.
    void addGlobalVariable(const char *variableName, lua_Number n);
    lua_Number getGlobalVariable(const char *variableName);
    
    // return current description.
    string describeCurrentState();

    // return if the story is end.
    bool isStoryEnd();

    // pass player's choice and return reaction as string.
    string choose(int choice);

private:
    void execute(const char* filename);
    void printError(lua_State* state);

    static LuaInterface* _instance;
    lua_State *_state;
};

#endif /* __LuaInterface_h__ */
