// A_player_fnc_dead_camera_blackout_message

#include "header.h"


private["_extraddeadtime","_civskilled","_copskilled","_deadtimes","_message"];

_extradeadtime = [player, "extradeadtime"] call A_player_fnc_get_scalar;
_selfkilled = [player, "A_main_var_selfkilled"] call A_player_fnc_get_scalar;
_deadtimes = [player, "deadtimes"] call A_player_fnc_get_scalar;
_message = format["You have now died %1 time(s) and suicided %2 time(s) and have to wait extra %3 seconds to respawn.", _deadtimes, _selfkilled, _extradeadtime];

_message