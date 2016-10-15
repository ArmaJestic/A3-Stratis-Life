// A_gang_fnc_area_add_actions

#include "header.h"


if (count A_gang_var_area_actions > 0) exitWith {};

params["_player",["_gang_area",null,[objNull]]];
if (!([_player] call A_player_fnc_human)) exitWith {};
if (UNDEFINED(_gang_area)) exitWith {};

private _actions = [_gang_area, "actions"] call A_object_fnc_getVariable;
if (DEFINED(_actions)) then {
	if (typeName _actions != "ARRAY") exitWith {};
	{
		private _action = _x;
		private _action_text = _action select GANG_AREA_INDEX_TEXT;
		private _action_code = _action select GANG_AREA_INDEX_CODE;
		private _action_condition = _action select GANG_AREA_INDEX_COND;
		private _action_id = _player addAction [_action_text, A_actions_fnc_noscript, _action_code,1, false,true,"", _action_condition];
		A_gang_var_area_actions pushBack _action_id;
	} forEach _actions;
};