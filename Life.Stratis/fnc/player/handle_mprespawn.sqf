// A_player_fnc_handle_mprespawn

#include "../../includes/macro.h"


//player groupChat format["A_player_fnc_handle_mprespawn %1", _this];
ARGV(0,_unit);
ARGV(1,_corpse);

if (not(str(_unit) == str(player))) exitWith {null};
//player groupChat format["Respawning now!"];
[_unit, false] call A_player_fnc_spawn;
