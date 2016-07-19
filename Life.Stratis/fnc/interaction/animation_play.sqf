// A_interaction_fnc_animation_play

#include "../../includes/macro.h"
#include "../../includes/constants.h"
#include "../../includes/dikcodes.h"


player groupChat format["A_interaction_fnc_animation_play %1", _this];
ARGV(0,_index);
if (undefined(_index)) exitWith {null};
if (typeName _index != "SCALAR") exitWith {null};
if (_index < 0) exitWith {null};


if ((vehicle player) != player) exitWith {
	player groupChat format["You must be on foot to peform this animation"];
};

if (_index >= count(A_interaction_var_animation_list)) exitWith {
	player groupChat format["ERROR: Animation index out of bounds"];
};

private["_animation"];
_animation = A_interaction_var_animation_list select _index;

if (undefined(_animation)) exitWith {null};
if (typeName _animation != "ARRAY") exitWith {null};

private["_animation_script_name", "_animation_type"];

_A_interaction_var_animation_script_name = _animation select A_interaction_var_animation_script_name;
_A_interaction_var_animation_type = _animation select A_interaction_var_animation_type;

format["%1 %2 ""%3"";", player, _animation_type, _animation_script_name] call broadcast;
