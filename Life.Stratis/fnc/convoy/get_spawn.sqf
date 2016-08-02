// A_convoy_fnc_get_spawn

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"

#define CONVOY_MSG_SPAWN 1
#define CONVOY_MSG_DRIVER_DEAD 2
#define CONVOY_MSG_DAMAGED 3
#define CONVOY_MSG_COMPLETE 4


private["_spawn"];
_spawn = A_convoy_var_spawns select (floor(random(count A_convoy_var_spawns)));
_spawn
