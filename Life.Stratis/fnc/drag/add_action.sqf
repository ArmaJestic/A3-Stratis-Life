// A_drag_fnc_add_action

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_player);
ARGV(1,_target);
if (undefined(_player)) exitWith {};
if (undefined(_target)) exitWith {};
if ([_player, "restrained", false] call A_object_fnc_getVariable) exitWith {};
if (typeName _target != "OBJECT" || {isNull _target}) exitWith {};


if ((_player distance _target) > 2) exitWith {};
if (!(isPlayer _target) && {([_target, "item", ""] call A_object_fnc_getVariable) == ""}) exitwith {};
if ((isPlayer _target) && {!([_target, "restrained", false] call A_object_fnc_getVariable)}) exitWith {};
if (!([_target, "draggable", true] call A_object_fnc_getVariable)) exitwith {};


private["_label"];
_label = [_target] call A_drag_fnc_object_label;
	
private["_action_id"];
_action_id = _player addAction [
	format["Take %1", _label], A_other_fnc_noscript, 
	format['[%1, objectFromNetId("%2")] call A_drag_fnc_take_object', _player, netId(_target)], 1, false, true, "", 
	format['([%1, objectFromNetId("%2")] call A_drag_fnc_take_object_available)',  _player, netId(_target)]
];

//player groupChat format["ADDED: _action_id = %1", _action_id];
[_player, "active_target", _target] call A_object_fnc_setVariable;
[_player, "active_action", _action_id] call A_object_fnc_setVariable;
