/* Class Scene
    Scene manages Events
*/
#ifndef __Scene_h__
#define __Scene_h__

#include "Event.h"

class Scene {
public:
    Scene();
    ~Scene();
    
    bool isSceneEnded();
    void runATurn();
    
private:
    Event* _currentEvent;
};

#endif