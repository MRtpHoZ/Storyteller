#include "Storyteller.h"
#include "LuaInterface.h"

Storyteller::Storyteller() {

}

Storyteller::~Storyteller() {

}

void Storyteller::startStory() {
    do {
        describe(LuaInterface::getInstance()->describeCurrentState());
        
        int ret;
        cin >> ret;
        choose(ret);
    } while (!LuaInterface::getInstance()->isStoryEnd());
    
    LuaInterface::removeInstance();
    puts("Story ends here.");
}

void Storyteller::describe(string text) {
    puts(text.c_str());
}

void Storyteller::choose(int choice) {
    describe(LuaInterface::getInstance()->choose(choice));
}