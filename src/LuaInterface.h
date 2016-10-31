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

    /**
     * Get the singleton of LuaInterface, allocate if it does not exist.
     * @return LuaInterface*
     */
    static LuaInterface* getInstance();

    /**
     * Deallocate the singleton.
     */
    static void removeInstance();

    /**
     * Add or set a global variable in Lua state.
     * @param variableName name of the global variable
     * @param n            value of the global variable as double
     */
    void addGlobalVariable(const char *variableName, lua_Number n);

    /**
     * Get variable of a global variable in Lua state.
     * @param  variableName name of the global variable
     * @return              value of the global variable as double
     */
    lua_Number getGlobalVariable(const char *variableName);

    /**
     * Get description on current state. The description consists of dialogs, narratives and choices list.
     * @return string
     */
    string describeCurrentState();

    /**
     * Get if the story has ended.
     * @return bool
     */
    bool isStoryEnd();

    /**
     * Pass player's choice and get reaction as string.
     * @param  choice int, player's choice
     * @return        string, reaction on player's choice
     */
    string choose(int choice);

private:
    /**
     * Execute a Lua file.
     * @param filename string, path of the Lua file
     */
    void execute(const char* filename);

    /**
     * Print error in Lua state.
     * @param state [description]
     */
    void printError(lua_State* state);

    /**
     * The singleton pointer.
     */
    static LuaInterface* _instance;

    /**
     * Lua state which is running in this scope.
     */
    lua_State *_state;
};

#endif /* __LuaInterface_h__ */
