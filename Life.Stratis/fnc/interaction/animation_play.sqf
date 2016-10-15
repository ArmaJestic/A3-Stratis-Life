// A_interaction_fnc_animation_play

#include "header.h"


params[["_index",-1,[0]]];
if (_index < 0) exitWith {null};

if ((vehicle player) != player) exitWith {
	player groupChat format["You must be on foot to peform this animation"];
};

if (_index >= count(A_interaction_var_animation_list)) exitWith {
	player groupChat format["ERROR: Animation index out of bounds"];
};

private _animation = A_interaction_var_animation_list select _index;

if (UNDEFINED(_animation)) exitWith {null};
if (typeName _animation != "ARRAY") exitWith {null};

private _animation_script_name = _animation select INTERACT_INDEX_ANIM_DISPLAY_NAME;
private _animation_type = _animation select INTERACT_INDEX_ANIM_TYPE;

format["%1 %2 ""%3"";", player, _animation_type, _animation_script_name] call A_broadcast_fnc_broadcast;