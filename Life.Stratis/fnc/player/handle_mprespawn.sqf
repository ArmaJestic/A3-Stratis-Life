// A_player_fnc_handle_mprespawn
// triggered when unit respawns
// returned value will place unit at coordinates

#include "header.h"


//diag_log format["A_player_fnc_handle_mprespawn %1: start", _this];
params["_unit","_corpse"];

if (str(_unit) != str(player)) exitWith {
	diag_log format['A_player_fnc_handle_mprespawn %1: _unit (%2,%3) != player (%4,%5)', _this, _unit, str(_unit), _player, str(_player)]; 
	null
};

[_unit, false] call A_player_fnc_spawn;

//diag_log format["A_player_fnc_handle_mprespawn %1: end", _this];