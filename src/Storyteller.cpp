#include "Storyteller.h"

Storyteller::Storyteller()
: _currentScene(nullptr) {

}

Storyteller::~Storyteller() {

}

void Storyteller::startStory() {
    if (_currentScene == nullptr) {
        _currentScene = new Scene();
    }
    
    LuaInterface::getInstance();
    
    while (!_currentScene->isSceneEnded()) {
        
    }
    
    puts("Story ends here.");
}
