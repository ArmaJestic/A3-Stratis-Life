// A_drag_fnc_object_add_attach_actions

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_player);
ARGV(1,_object);


private["_actions"];

private["_action_id", "_label"];
_label = [_object] call A_drag_fnc_object_label;
private["_actions"];
_actions = [];
_action_id = _player addAction [format["Release %1", _label], A_actions_fnc_action,
	[[_player], "A_drag_fnc_object_release"],10,false,true,"", "([" + str(_player) + "] call A_drag_fnc_object_active)"];
_actions set [count(_actions), _action_id];

private["_type"];
_type = [_object, "type", ""] call A_object_fnc_getVariable;
if (not((_type == "Fort")  || (isPlayer _object))) then {
	_action_id = _player addAction [format["Put %1 in inventory", _label], A_actions_fnc_action,
	[[_player, _object], "A_interaction_fnc_object_put"],10,false,true,"",  "([(objectFromNetId(" + str(netId(_object)) + ")), " + str(_player) + "] call A_drag_fnc_put_inventory_avalable)"];
	_actions set [count(_actions), _action_id];
};


_action_id = _player addAction [format["Put %1 in vehicle", _label], A_actions_fnc_action, 
	[[_player, _object], "A_drag_fnc_interact_object_put_vehicle"],10,false,true,"", 
	"([" + str(_player) + "] call A_drag_fnc_object_active) && {([" + str(_player) + ", objectFromNetId("+  str(netId(_object)) + ")] call A_drag_fnc_put_vehicle_active)}"];
_actions set [count(_actions), _action_id];

private["_item_actions"];
_item_actions = [_player, _object] call A_drag_fnc_object_add_item_actions;
_actions = _actions + _item_actions;

[_player, "attach_actions", _actions] call A_object_fnc_setVariable;
