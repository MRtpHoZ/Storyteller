/*
    Class Storyteller
*/

#ifndef __Storyteller_h__
#define __Storyteller_h__

#include "common.h"

class Storyteller {
public:
    Storyteller();
    ~Storyteller();

    /**
     * Start the main loop of a new story.
     */
    void startStory();

private:
    /**
     * Initialize all the modules needed, making sure they are in the right order.
     */
    void initModules();

    /**
     * Remove modules loaded and deallocate memory.
     */
    void cleanUp();

    /**
     * Output the description, which consists of dialogs, narratives and choices.
     * @param text string, description
     */
    void describe(string text);

    /**
     * Pass player's choice
     * @param choice int, player's choice.
     */
    void choose(int choice);
};

#endif
