// A_bunker_fnc_traverse_door

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"

 _this spawn {
ARGV(0,_player);
ARGV(1,_bunker_door_data);

if (undefined(_player)) exitWith {};
if (undefined(_bunker_door_data)) exitWith {};

private["_netid"];
_netid = _bunker_door_data select A_bunker_var_door_data_target_netid;
private["_target"];

_target = objectFromNetId _netid;

if (undefined(_target)) exitWith {};

private["_target_door_data"];
_target_door_data = [_target, "bunker_door_data"] call A_object_fnc_getVariable;



titleText ["", "BLACK OUT", 1];
[_player] call A_bunker_fnc_door_sound;	

sleep 2;
private["_offset_human", "_heading", "_offset_vehicle"];
_heading = _bunker_door_data select A_bunker_var_door_data_target_heading;
_offset_human = _bunker_door_data select A_bunker_var_door_data_target_offset_human;
_offset_vehicle = _bunker_door_data select A_bunker_var_door_data_target_offset_vehicle;

private["_offset"];

_offset = _offset_human;
if ((vehicle _player) != _player) then {
	_offset = _offset_vehicle;
};

(vehicle _player) allowDamage false;
(vehicle _player) enableSimulation false;

[(vehicle _player), _target, _offset, _heading] call A_object_fnc_fake_attach;
detach (vehicle _player);

(vehicle _player) enableSimulation true;


waitUntil {
	if ([_player] call A_underwater_base_fnc_underground_base_player_inside) exitWith {
		!(sunOrMoon > 0)
	};
	true
};


titleText ["", "BLACK IN", 3];
(vehicle _player) allowDamage true;
(vehicle _player) setVelocity [0,0,0];

};
