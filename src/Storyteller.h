/* Class Storyteller
    Storyteller manages Scenes and Events.
*/

#ifndef __Storyteller_h__
#define __Storyteller_h__

#include "common.h"

class Storyteller {
public:
    Storyteller();
    ~Storyteller();

    void startStory(); // start a new story.

private:
    void describe(string text); // output the description
    void choose(int choice); // input Player's choice on current situation.
    
};

#endif
