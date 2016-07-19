// A_drag_fnc_object_attach

#include "../../includes/constants.h"
#include "../../includes/macro.h"


player grouPChat format["A_drag_fnc_object_attach %1", _this];
ARGV(0,_player);
ARGV(1,_object);

if (not([_player] call A_player_fnc_exists)) exitWith {};
if (not([_object] call A_object_fnc_exists)) exitWith {};

_object = [_object] call A_object_fnc_nonNetwork_convert;

private["_last_holder"];
_last_holder = [_object, "last_holder", objNull] call A_object_fnc_getVariable;
if (isNull _last_holder) then {
	[] call A_interaction_fnc_play_pickup_animation;
}
else {
	_player playActionNow "PutDown";
};

if (not(local _object)) then {
	player groupChat format["object is NOT lcoal"];
	[[_object, _player], "A_drag_fnc_remote_attach", _object, false] call BIS_fnc_MP;
}
else {
	player groupChat format["object is local"];
	[_object, _player] call A_drag_fnc_remote_attach;
};



player groupChat format["Waiting for last holder"];
waitUntil {
	
	_last_holder = [_object, "last_holder", objNull] call A_object_fnc_getVariable;
	//player groupChat format["_last_holder = %1", _last_holder];
	(_last_holder == _player)
};

player groupChat format["Last holder wait complete"];

[_player, "held_target", _object, true] call A_object_fnc_setVariable;

[_player, _object] call A_drag_fnc_object_add_attach_actions;

_player forceWalk true;
waitUntil {
	//player groupChat format["_object = %1", _object];
	if (isNil "_player" || {isNull _player || {not(alive _player) || {not((vehicle _player) == _player)}}}) exitWith {true};
	if (isNil "_object" || {isNull _object || {isPlayer _object && {not(alive _object)}}}) exitWith {true};
	if (not([_player] call A_drag_fnc_object_active)) exitWith {true};
	
	//player groupChat format["owner(object) = %1, owner(player) = %2", (owner _object), (owner player)];
	private["_last_holder"];
	_last_holder = [_object, "last_holder", objNull] call A_object_fnc_getVariable;
	//player groupChat format["_last_holder = %1", _last_holder];
	if (not(_last_holder == _player)) exitWith {true};
	
	false
};

[[_player]] call A_drag_fnc_object_release;
_player forceWalk false;
//[[_object, _player], "A_drag_fnc_remote_detach", _object, false] call BIS_fnc_MP;

if (not(local _object)) then {
	[[_object, _player], "A_drag_fnc_remote_detach", _object, false] call BIS_fnc_MP;
}
else {
	[_object, _player] call A_drag_fnc_remote_detach;
};

[_player] call A_drag_fnc_object_remove_attach_actions;
