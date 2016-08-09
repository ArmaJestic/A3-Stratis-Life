// A_client_fnc_check_drag_actions

#include "..\..\includes\macro.h"


private["_player"];
_player = player;

private["_visual_target", "_active_target", "_held_object"];

_visual_target = nearCursorTarget;
_active_target = [_player, "active_target", objNull] call A_object_fnc_getVariable;
_held_object = [_player, "held_target", objNull] call A_object_fnc_getVariable;

//player is already holding an object
if (!(isNull _held_object)) exitWith {};

//the object the player is looking at, is already active as an action
if (!(isNull _visual_target) && {(_visual_target == _active_target) && {(_player distance _active_target) < 2}}) exitWith {};


[_player] call A_drag_fnc_remove_action;	
[_player, _visual_target] call A_drag_fnc_add_action;
