// A_drag_fnc_take_object

#include "header.h"


params["_player","_target"];
if UNDEFINED(_player) exitWith {};
if UNDEFINED(_target) exitWith {};

[_player] call A_drag_fnc_remove_action;
[_player, _target] call A_drag_fnc_object_attach;