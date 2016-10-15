// A_drag_fnc_add_action

#include "header.h"


params["_player","_target"];
if (UNDEFINED(_player)) exitWith {};
if (UNDEFINED(_target)) exitWith {};
if ([_player, "restrained", false] call A_object_fnc_getVariable) exitWith {};
if (typeName _target != "OBJECT" || {isNull _target}) exitWith {};


if ((_player distance _target) > 2) exitWith {};
if (!(isPlayer _target) && {([_target, "item", ""] call A_object_fnc_getVariable) == ""}) exitwith {};
if ((isPlayer _target) && {!([_target, "restrained", false] call A_object_fnc_getVariable)}) exitWith {};
if (!([_target, "draggable", true] call A_object_fnc_getVariable)) exitwith {};


private _label = [_target] call A_drag_fnc_object_label;
private _action_id = _player addAction [
	format["Take %1", _label], A_actions_fnc_noscript, 
	format['[%1, objectFromNetId("%2")] call A_drag_fnc_take_object', _player, netId(_target)], 1, false, true, "", 
	format['([%1, objectFromNetId("%2")] call A_drag_fnc_take_object_available)',  _player, netId(_target)]
];

[_player, "active_target", _target] call A_object_fnc_setVariable;
[_player, "active_action", _action_id] call A_object_fnc_setVariable;