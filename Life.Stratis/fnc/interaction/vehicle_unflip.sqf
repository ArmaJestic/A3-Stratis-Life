// A_interaction_fnc_vehicle_unflip

#include "header.h"

 _this spawn {
player groupChat format["A_interaction_fnc_vehicle_unflip %1", _this];
ARGV(0,_this);
ARGV(0,_player);
ARGV(1,_vehicle);

if (!([_player] call A_player_fnc_exists)) exitWith {};
if (!([_vehicle] call A_vehicle_fnc_exists)) exitWith {};

player grouPChat format["adadas!"];
if (!([player, _vehicle] call A_vehicle_fnc_owner)) exitWith {
	player groupchat "You need the keys to unflip a vehicle.";
};

if ((count crew _vehicle) > 0) exitWith {
	player groupChat "The vehicle must be empty to be unflipped.";
};

player groupChat "Turning your vehicle over, wait 10 seconds within 10 meters.";
sleep 10;

if ((_player distance _vehicle) > 10) exitWith {
	player groupchat "Could not unflip vehicle, you must stay within 10 meters.";
};

[[_vehicle,[0,0,1]], "A_object_fnc_setVectorUp", true, false] call BIS_fnc_MP;
player groupchat "Your vehicle has been unflipped";
};
