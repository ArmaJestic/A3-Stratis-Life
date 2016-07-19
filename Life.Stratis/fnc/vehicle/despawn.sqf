// A_vehicle_fnc_despawn

#include "../../includes/macro.h"

 _this spawn {
if (not(isServer)) exitWith {null};
private["_vehicle", "_delay"];

//diag_log format["A_vehicle_fnc_despawn %1", _this];

ARGV(0,_vehicle);
ARGV(1,_delay);

if (undefined(_vehicle)) exitWith {null};
if (typeName _vehicle != "OBJECT") exitWith {null};

if (undefined(_delay)) exitWith {null};
if (typeName _delay != "SCALAR") exitWith {null};

[_vehicle, "saved_driver_uid", ""] call A_vehicle_fnc_set_string;
[_vehicle] call A_vehicle_fnc_stop_track;

//diag_log format["A_vehicle_fnc_despawn %1, waiting", _this];
[_delay] call A_player_fnc_isleep;
//diag_log format["A_vehicle_fnc_despawn %1, deleting", _this];
deleteVehicle _vehicle;	
};
