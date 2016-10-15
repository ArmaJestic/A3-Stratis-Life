// A_player_fnc_update_armed

#include "header.h"


ARGV(0,_player);
ARGV(1,_armed);

private["_carmed"];
_carmed =[_player] call A_player_fnc_get_armed;
if ( str(_carmed) == str(_armed)) exitWith {null};
//player groupChat format["_armed = %1", _armed];
[_player, _armed] call A_player_fnc_set_armed;
