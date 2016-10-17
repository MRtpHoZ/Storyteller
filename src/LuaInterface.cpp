//
//  LuaInterface.cpp
//  Storyteller
//
//  Created by Dexter on 17/10/2016.
//
//

#include "LuaInterface.h"


void print_error(lua_State* state) {
    const char* message = lua_tostring(state, -1);
    puts(message);
    lua_pop(state, 1);
}

void execute(const char* filename) {
    lua_State *state = luaL_newstate();
    luaL_openlibs(state);
    int result;
    
    result = luaL_loadfile(state, filename);
    if (result != LUA_OK) {
        print_error(state);
        return;
    }
    
    result = lua_pcall(state, 0, LUA_MULTRET, 0);
    if (result != LUA_OK) {
        print_error(state);
        return;
    }
}

