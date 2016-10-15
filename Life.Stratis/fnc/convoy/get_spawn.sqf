// A_convoy_fnc_get_spawn

#include "header.h"



private["_spawn"];
_spawn = A_convoy_var_spawns select (floor(random(count A_convoy_var_spawns)));
_spawn
