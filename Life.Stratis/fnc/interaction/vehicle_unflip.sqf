// A_interaction_fnc_vehicle_unflip

#include "header.h"


params["_args"];
_args params["_player","_vehicle"];

if !([_player] call A_player_fnc_exists) exitWith {};
if !([_vehicle] call A_vehicle_fnc_exists) exitWith {};

if (!([player, _vehicle] call A_vehicle_fnc_owner)) exitWith {
	player groupchat "You need the keys to unflip a vehicle.";
};

if ((count crew _vehicle) > 0) exitWith {
	player groupChat "The vehicle must be empty to be unflipped.";
};

systemChat "Turning your vehicle over, wait 10 seconds within 10 meters.";
sleep 10;

if ((_player distance _vehicle) > 10) exitWith {
	systemChat "Could not unflip vehicle, you must stay within 10 meters.";
};

// must execute where vehicle is local, don't jip
// just do setVectorUp now instead of A_object_fnc_setVectorUp
[_vehicle,[0,0,1]] remoteExecCall["setVectorUp",_vehicle,false];

systemChat "Your vehicle has been unflipped";