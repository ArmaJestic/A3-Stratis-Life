// A_convoy_fnc_get_spawn

#include "../../includes/macro.h"

#define Spawn_convoy 1
#define Driver_dead 2
#define Damaged_convoy 3
#define Cop_escort 4


private["_spawn"];
_spawn = A_convoy_var_spawns select (floor(random(count A_convoy_var_spawns)));
_spawn
