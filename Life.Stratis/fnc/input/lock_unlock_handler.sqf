// A_input_fnc_lock_unlock_handler

#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


player groupChat format["A_input_fnc_lock_unlock_handler %1", _this];
if(not(INV_shortcuts)) exitWith { false };
private["_vehicles"];
_vehicles = nearestObjects [player, ["LandVehicle", "Air", "ship"], 10];
if (not((count _vehicles ) > 0)) exitWith {false};

private["_player"];
_player = player;

private["_vehicle"];
_vehicle = _vehicles select 0;

private["_inside_vehicle"];
_inside_vehicle = ((vehicle _player) != _player);
_vehicle = if (_inside_vehicle) then {(vehicle player)} else {_vehicle};

if (not([_player, _vehicle] call A_vehicle_fnc_owner)) exitWith {
	player groupchat "You do not have the keys to this vehicle";
	true
};

private["_state"];
_state = [_vehicle] call A_vehicle_fnc_toggle_lock;
private["_message"];
_message = if (_state) then {"Vehicle locked"} else {"Vehicle unlocked"};
player groupChat _message;
	
true
