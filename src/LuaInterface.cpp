/*
    LuaInterface.cpp
    Storyteller
*/

#include "LuaInterface.h"

#define SCRIPT_GLOBAL_PATH "./resource/script/global.lua"

LuaInterface* LuaInterface::_instance = nullptr;

LuaInterface::LuaInterface()
: _state(nullptr) {
    execute(SCRIPT_GLOBAL_PATH);
}

LuaInterface::~LuaInterface() {
    lua_close(_state);
}

LuaInterface* LuaInterface::getInstance() {
    if (_instance == nullptr) {
        _instance = new LuaInterface();
    }

    return _instance;
}

void LuaInterface::removeInstance() {
    if (_instance) {
        delete _instance;
        _instance = nullptr;
    }
}

void LuaInterface::printError(lua_State* state) {
    const char* message = lua_tostring(state, -1);
    puts(message);
    lua_pop(state, 1);
}

void LuaInterface::execute(const char* filename) {
    _state = luaL_newstate();
    luaL_openlibs(_state);
    int result;

    result = luaL_loadfile(_state, filename);
    if (result != LUA_OK) {
        printError(_state);
        return;
    }

    result = lua_pcall(_state, 0, LUA_MULTRET, 0);
    if (result != LUA_OK) {
        printError(_state);
        return;
    }
}

void LuaInterface::addGlobalVariable(const char *variableName, lua_Number n) {
    lua_pushnumber(_state, n);
    lua_setglobal(_state, variableName);
}

lua_Number LuaInterface::getGlobalVariable(const char *variableName) {
    lua_getglobal(_state, variableName);
    lua_Number var = lua_tonumber(_state, -1);
    lua_pop(_state, 1);
    return var;
}

string LuaInterface::describeCurrentState() {
    lua_getglobal(_state, "describeCurrentState");
    lua_pcall(_state, 0, 1, 0);
    string ret = lua_tostring(_state, -1);
    lua_pop(_state, 1);
    return ret;
}

bool LuaInterface::isStoryEnd() {
    lua_getglobal(_state, "isStoryEnd");
    lua_pcall(_state, 0, 1, 0);
    bool ret = lua_toboolean(_state, -1);
    lua_pop(_state, 1);
    return ret;
}

string LuaInterface::choose(int choice) {
    lua_getglobal(_state, "choose");
    lua_pushnumber(_state, choice);
    lua_pcall(_state, 1, 1, 0);
    string ret = lua_tostring(_state, -1);
    lua_pop(_state, 1);
    return ret;
}
