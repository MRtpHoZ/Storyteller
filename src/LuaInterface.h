//
//  LuaInterface.h
//  Storyteller
//
//  Created by Dexter on 17/10/2016.
//
//

#ifndef LuaInterface_h
#define LuaInterface_h

#include "lua.hpp"
#include "common.h"

void print_error(lua_State* state);

void execute(const char* filename);



#endif /* LuaInterface_h */
