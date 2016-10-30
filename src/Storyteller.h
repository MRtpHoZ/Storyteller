/* Class Storyteller
    
*/

#ifndef __Storyteller_h__
#define __Storyteller_h__

#include "common.h"

class Storyteller {
public:
    Storyteller();
    ~Storyteller();

    void startStory(); // Start a new story.

private:
    void initModules(); // Initialize all the modules it needs.
    void cleanUp(); // Remove modules loaded and deallocate memories.

    void describe(string text); // Print the description of current situation and the choices to it.
    void choose(int choice); // Input Player's choice.
};

#endif
