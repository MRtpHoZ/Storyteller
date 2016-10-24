//
//  LuaInterface.h
//  Storyteller
//
//  Created by Dexter on 17/10/2016.
//
//

#ifndef LuaInterface_h
#define LuaInterface_h

#include "../lua/include/lua.hpp"
#include "common.h"

class LuaInterface {
public:
    LuaInterface();
    ~LuaInterface();

    static LuaInterface* getInstance();
    static void removeInstance();
    
    void addGlobalVariable(const char *variableName, lua_Number n);
    lua_Number getGlobalVariable(const char *variableName);
    
    string describeCurrentState();
    bool isStoryEnd();
    string choose(int choice);

private:
    void execute(const char* filename);
    void printError(lua_State* state);

    static LuaInterface* _instance;
    lua_State *_state;
};

#endif /* LuaInterface_h */
