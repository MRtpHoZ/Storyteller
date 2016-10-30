#include "Storyteller.h"
#include "LuaInterface.h"

Storyteller::Storyteller() {
    initModules();
}

Storyteller::~Storyteller() {

}

void Storyteller::initModules() {
    // Initialize all the modules needed here, making sure they are initialized in the right order.
    // In this case, there's only one module needed.
    LuaInterface::getInstance();
}

void Storyteller::cleanUp() {
    // Make sure they are in the right order.
    LuaInterface::removeInstance();
}

void Storyteller::startStory() {
    do {
        // Print the description from LuaInterface.
        describe(LuaInterface::getInstance()->describeCurrentState());
        
        // Ask for player's choice.
        int ret;
        cout << "Your choice: ";
        cin >> ret;
        choose(ret);

        // Add a new line after each situation-choice pair.
        puts("");

    } while (!LuaInterface::getInstance()->isStoryEnd()); // Loops until the story ends.
    
    puts("Story ends here.");
    cleanUp();
}

void Storyteller::describe(string text) {
    // Simply print it on screen.
    puts(text.c_str());
}

void Storyteller::choose(int choice) {
    describe(LuaInterface::getInstance()->choose(choice));
}
