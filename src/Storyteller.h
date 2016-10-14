/* Class Storyteller
    Storyteller manages Scenes and Events.
*/

class Storyteller 
{
public:
    Storyteller();
    ~Storyteller();

    // 
    bool isGameEnded();
    bool description(); // ask the Storyteller to describe the situation right now.
    void choose(int choice); // input Player's choice on current situation.
};
