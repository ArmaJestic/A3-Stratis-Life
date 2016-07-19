// A_stats_fnc_get_variables_list

#include "..\..\includes\macro.h"

private["_player"];
_player = _this select 0;
if (undefined(_player)) exitWith {null};
if (typeName _player != "OBJECT") exitWith {null};

private["_variables_list"];
_variables_list = [_player, "stats_variables_list"] call A_object_fnc_getVariable;
_variables_list = if (undefined(_variables_list)) then {[]} else {_variables_list};
_variables_list = if (typeName _variables_list != "ARRAY") then {[]} else {_variables_list};
_variables_list	
