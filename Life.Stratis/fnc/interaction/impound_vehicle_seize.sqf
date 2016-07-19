// A_interaction_fnc_impound_vehicle_seize

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"


player groupChat format["A_interaction_fnc_impound_vehicle_seize %1", _this];
ARGV(0,_this);
ARGV(0,_player);
ARGV(1,_vehicle);

if (not([_player, _vehicle] call A_vehicle_fnc_seize_available)) exitWith {};


private["_storage"];
_storage = "impound_lot";

if ((count crew _vehicle) > 0) exitWith {
	player groupChat format["%1-%2, you cannot impound this vehicle. It's not empty", _player, (name _player)];
};

[_storage, _player, _vehicle] call A_vehicle_storage_fnc_put;


[_vehicle] call A_vehicle_fnc_save_stats;	
[[_vehicle], "A_vehicle_fnc_unload_stats", false] call BIS_fnc_MP; //no need to keep the vehicle stats in memory anymore

deleteVehicle _vehicle;
player groupChat format["%1-%2, you have impounded this vehicle", _player, (name _player)];

private["_message"];
_message = format["%1-%2 has impounded vehicle (%3)", _player, (name _player), str(_vehicle)];
[[_message], "A_interaction_fnc_hint", true, false] call BIS_fnc_MP;
