// A_interaction_fnc_use_axe

#include "header.h"


params["_player","_object"];

if (!([_player] call A_player_fnc_human)) exitWith {};
if (UNDEFINED(_object)) exitWith {};

if (A_interaction_var_use_axe_active) exitWith {};
A_interaction_var_use_axe_active = true;

private _exit_clean = {
	sleep 1;
	A_interaction_var_use_axe_active = false;
};

private _class = typeName _object;

_player playActionNow "PutDown";


private _left_hand_pos = _player selectionPosition "LeftHand";
private _pos1 = player modelToWorld _left_hand_pos;
private _pos2 = player modelToWorld [(_left_hand_pos select 0), (_left_hand_pos select 1) + 2, (_left_hand_pos select 2)];

_object_intersect = lineIntersectsWith [ATLtoASL(_pos1), ATLtoASL(_pos2), objNull, objNull, true];
if (count(_object_intersect) == 0) exitWith {call _exit_clean;};

private _tree_or_stone = _object_intersect select 0;
private _intersects_tree = ([": t_", str(_tree_or_stone)] call BIS_fnc_inString);
private _intersects_stone = (["stone", str(_tree_or_stone)] call BIS_fnc_inString);

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

[] call _exit_clean;