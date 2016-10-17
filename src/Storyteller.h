/* Class Storyteller
    Storyteller manages Scenes and Events.
*/

#ifndef __Storyteller_h__
#define __Storyteller_h__

#include "common.h"
#include "Scene.h"

class Storyteller {
public:
    Storyteller();
    ~Storyteller();

    void startStory(); // start a new story.

private:
    bool describe(); // ask the Storyteller to describe the situation right now.
    void choose(int choice); // input Player's choice on current situation.
    
    Scene* _currentScene;
};

#endif
