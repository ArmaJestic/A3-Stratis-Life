// A_client_fnc_check_respawn_time

#include "..\..\includes\macro.h"


if (not(alive player)) exitWith {null};
private["_interval"];
_interval = 30;
if (not((time % _interval) == 0)) exitWith {null};
[player, "extradeadtime", -(_interval)] call A_player_fnc_update_scalar;
