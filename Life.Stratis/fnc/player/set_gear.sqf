// A_player_fnc_set_gear

#include "header.h"


diag_log format["A_player_fnc_set_gear %1: start", _this];

ARGV(0,_player);
ARGV(1,_gear);
if (!([_player] call A_player_fnc_exists)) exitWith {diag_log format["A_player_fnc_set_gear %1: exit1", _this]; null};
if (UNDEFINED(_gear)) exitWith {diag_log format["A_player_fnc_set_gear %1: exit2", _this]; null};
if (typeName _gear != "ARRAY") exitWith {diag_log format["A_player_fnc_set_gear %1: exit3", _this]; null};

_player setUnitLoadout[_gear,false];

diag_log format["A_player_fnc_set_gear %1: end", _this];