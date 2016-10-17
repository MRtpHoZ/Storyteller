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

    void print_error(lua_State* state);

private:
    void execute(const char* filename);

    static LuaInterface* _instance;
    lua_State* _state;
};

#endif /* LuaInterface_h */
