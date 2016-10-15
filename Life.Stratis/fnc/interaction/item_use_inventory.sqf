// A_interaction_fnc_item_use_inventory

#include "header.h"


diag_log format["A_interaction_fnc_item_use_inventory: %1", _this];
ARGV(0,_player);
ARGV(1,_item);
ARGV(2,_amount);

if (!([_player] call A_player_fnc_human)) exitWith {null};
if (UNDEFINED(_item)) exitWith {null};
if (UNDEFINED(_amount)) exitWith {null};
if (typeName _item != "STRING") exitWith {null};
if (typeName _amount != "SCALAR") exitWith {null};
if (_amount <= 0) exitWith {null};

if (_amount > ([_player, _item] call A_inventory_fnc_get_item_amount)) exitWith {
	player groupChat format["You do not have that many items to use"];
};

if (!([_player] call A_interaction_fnc_inventory_actions_allowed)) then {
	player groupChat "You cannot use your inventory now";
};

private _script = _item call A_inventory_fnc_get_item_file;
_script = if (UNDEFINED(_script)) then {""} else {_script};
//_script = if (typeName _script != "STRING") then {""} else {_script};

if ((typeName _script) == "STRING") then {
	if (_script == "") exitWith {
		player groupChat "You cannot use this item";
	};

	//legacy, check if the the use action is tied to a script
	if ([".sqf", _script] call BIS_fnc_inString) exitWith {
		["use", _item, _amount, []] execVM _script;
	};

	private["_function"];
	_function = missionNamespace getVariable [_script, {}];
	[_player, _item, _amount] call _function;
}else{
	if ((typeName _script) == "CODE") then {
		["use", _item, _amount, []] call _script;
	}else{
		LOGE(A_interaction_fnc_item_use_inventory,"script is not string or code")
	};
};

/*
if (_script == "") exitWith {
	player groupChat "You cannot use this item";
};

//legacy, check if the the use action is tied to a script
if ([".sqf", _script] call BIS_fnc_inString) exitWith {
	["use", _item, _amount, []] execVM _script;
};

private["_function"];
_function = missionNamespace getVariable [_script, {}];
[_player, _item, _amount] call _function;
*/