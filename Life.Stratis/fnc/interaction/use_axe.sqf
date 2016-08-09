// A_interaction_fnc_use_axe

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"

 _this spawn {
if (dialog) exitWith {};
ARGV(0,_this);
ARGV(0,_player);
ARGV(1,_object);
if (!([_player] call A_player_fnc_human)) exitWith {};
if (undefined(_object)) exitWith {};

if (A_interaction_var_interact_use_axe_active) exitWith {};
A_interaction_var_interact_use_axe_active = true;

private["_exit_clean"];
_exit_clean = {
	sleep 1;
	A_interaction_var_interact_use_axe_active = false;
};

private["_class"];
_class = typeName _object;

_player playActionNow "PutDown";


private["_left_hand_pos", "_pos1", "_pos2"];
_left_hand_pos = _player selectionPosition "LeftHand";
_pos1 = player modelToWorld _left_hand_pos;
_pos2 = player modelToWorld [(_left_hand_pos select 0), (_left_hand_pos select 1) + 2, (_left_hand_pos select 2)];

_object_intersect = lineIntersectsWith [ATLtoASL(_pos1), ATLtoASL(_pos2), objNull, objNull, true];
if (count(_object_intersect) == 0) exitWith {call _exit_clean;};

private["_intersects_tree", "_intersects_stone", "_tree_or_stone"];
_tree_or_stone = _object_intersect select 0;
_intersects_tree = false;
_intersects_stone = false;

if ([": t_", str(_tree_or_stone)] call BIS_fnc_inString) then {
	_intersects_tree = true;
}else{ if (["stone", str(_tree_or_stone)] call BIS_fnc_inString) then {
	_intersects_stone = true;
}};

if (!(_intersects_tree || _intersects_stone)) exitWith {call _exit_clean;};


if (_intersects_tree) exitWith {
	[_player, _object, _tree_or_stone] call A_interaction_fnc_tree_hit;
	call _exit_clean;
};

//cannot use regular axe to hit stone
if (_intersects_stone && !(_class == "Land_Axe_F")) exitWith {
	[_player,_object, _tree_or_stone] call A_interaction_fnc_stone_hit;
	call _exit_clean;
};

call _exit_clean;
};
