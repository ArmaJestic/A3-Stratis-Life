// A_gang_fnc_area_add_actions

#include "..\..\includes\macro.h"


if (count A_gang_var_area_actions > 0) exitWith {null};
ARGV(0,_player);
ARGV(1,_gang_area);
if (not([_player] call A_player_fnc_human)) exitWith {null};
if (undefined(_gang_area)) exitWith {null};
if (typeName _gang_area != "OBJECT") exitWith {null};


private["_actions"];
_actions = [_gang_area, "actions"] call A_object_fnc_getVariable;
if (not(undefined(_actions))) then {
	if (typeName _actions != "ARRAY") exitWith {null};
	{
		private["_action", "_action_text", "_action_code", "_action_condition"];
		_action = _x;
		_action_text = _action select A_gang_var_area_action_text;
		_action_code = _action select A_gang_var_area_action_code;
		_action_condition = _action select A_gang_var_area_action_condition;
		
		private["_action_id"];
		_action_id = _player addAction [_action_text, "noscript.sqf", _action_code,1, false,true,"", _action_condition];
		A_gang_var_area_actions = A_gang_var_area_actions + [_action_id];
	} forEach _actions;
};
