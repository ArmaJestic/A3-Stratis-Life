// A_player_fnc_get_reason

#include "header.h"


ARGV(0,_player);


if (UNDEFINED(_player)) exitWith {null};
private["_reason_variable_name"];
_reason_variable_name = format["warrants", _player];

private["_reason_variable"];
_reason_variable = [_player, _reason_variable_name] call A_object_fnc_getVariable;
_reason_variable = if (UNDEFINED(_reason_variable)) then {[]} else {_reason_variable};
_reason_variable = if (typeName _reason_variable != "ARRAY") then { [] } else { _reason_variable };
_reason_variable
