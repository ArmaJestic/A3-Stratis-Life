// A_interaction_fnc_use_bucket

#include "header.h"


params["_player","_object"];

if (!([_player] call A_player_fnc_human)) exitwith {};
if (UNDEFINED(_object)) exitwith {};

if (A_interaction_var_use_bucket_active) exitwith {};
A_interaction_var_use_bucket_active = true;

private["_exit_clean"];
_exit_clean = {
	sleep 1;
	A_interaction_var_use_bucket_active = false;
};

private["_class"];
_class = typeName _object;

_player playActionNow "PutDown";


private["_left_hand_pos", "_pos1", "_pos2"];
_left_hand_pos = _player selectionPosition "LeftHand";
_pos1 = player modelToWorld _left_hand_pos;
_pos2 = player modelToWorld [(_left_hand_pos select 0), (_left_hand_pos select 1) + 1, (_left_hand_pos select 2) - 0.5];

_object_intersects = lineIntersectsWith [ATLtoASL(_pos1), ATLtoASL(_pos2), objNull, objNull, true];
if (count(_object_intersects) == 0) exitwith {call _exit_clean;};


private["_intersects_tree", "_object_intersect"];
_object_intersect = _object_intersects select 0;

//player scooping out crude 
if ([_object_intersect, "isPumpBarrel", false] call A_object_fnc_getVariable) exitwith {
	[_player, _object, _object_intersect] call A_interaction_fnc_pump_barrel_hit;
	call _exit_clean;
};

private["_item"];
_item = [_object_intersect, "item", ""] call A_object_fnc_getVariable;

//player pouring crude onto empty barrel, or onto crude oil barrel
if (_item == "emptybarrel" || {_item == "crudeoil"}) exitwith {
	[_player, _object, _object_intersect] call A_interaction_fnc_cude_oil_barrel_hit;
	call _exit_clean;
};


[] call _exit_clean;