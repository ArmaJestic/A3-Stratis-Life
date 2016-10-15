// A_drag_fnc_object_add_item_actions

#include "header.h"


params["_player","_object"];

private _default = [];

if (!([_player] call A_player_fnc_exists)) exitWith {_default};
if (!([_object] call A_object_fnc_exists)) exitWith {_default};

private _item = [_object, "item", ""] call A_object_fnc_getVariable;
if (_item == "") exitWith {_default};

private _data = _item call A_inventory_fnc_get_item_array;
if (count(_data) == 0) exitWith {_default};

private _actions = [];

if (_item == "knife") then {
	//_action_id = _player addAction [format["Use knife", _label], A_actions_fnc_action, 
	//	[[_player, _object], "A_interaction_fnc_use_knife"],10,false,true,"", 
	//	"([" + str(_player) + "] call A_drag_fnc_object_active) && {([" + str(_player) + ", "+  str(_object) + "] call interact_use_knife_available)}"];
	//_actions set [count(_actions), _action_id];
};

_actions