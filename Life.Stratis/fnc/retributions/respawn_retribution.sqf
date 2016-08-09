// A_retributions_fnc_respawn_retribution

#include "..\..\includes\macro.h"


if (undefined(A_retributions_var_player_unfair_killed) ) exitWith {null};
if (typeName A_retributions_var_player_unfair_killed != "BOOL") exitWith {null};
if (!(A_retributions_var_player_unfair_killed)) exitWith {null};

A_retributions_var_player_unfair_killed = false;
["open"] call A_retributions_fnc_retributions_main;
