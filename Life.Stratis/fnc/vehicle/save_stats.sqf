// A_vehicle_fnc_save_stats

#include "..\..\includes\macro.h"


/*
private["_str"];
_str = format["A_vehicle_fnc_save_stats %1, %2", _this, (driver(_this select 0))];
diag_log _str;
player groupChat _str;
*/
//diag_log format["item_name = %1", ([_vehicle, "item_name"] call A_vehicle_fnc_get_string)];
ARGV(0,_vehicle);

if (undefined(_vehicle)) exitWith {null};
if (typeName _vehicle != "OBJECT") exitWith {null};
if (_vehicle isKindOf "Man") exitWith {null};

private["_dirver"];
_driver = driver(_vehicle);

private["_name", "_class", "_driver_uid", "_velocity", "_position_atl", "_vector_direction", "_vector_up", "_fuel", "_damage", "_engine_state", "_fuel"];

_name = vehicleVarName _vehicle;
_class = typeOf _vehicle;
_velocity = velocity _vehicle;
_position_atl = getPosATL _vehicle;
_vector_direction = vectorDir _vehicle;
_vector_up = vectorUp _vehicle;
_fuel = fuel _vehicle;
_damage = damage _vehicle;
_engine_state = isEngineOn _vehicle;

private["_driver_uid"];
//_driver_uid = [_vehicle, "active_driver_uid"] call A_vehicle_fnc_get_string;
_driver_uid = "";
if ([_driver] call A_player_fnc_exists) then {
	_driver_uid = [_driver] call A_stats_fnc_get_uid;
};

/*
private["_str"];
_str = format[ "_driver_uid = %1, typeName _driver_uid = %2 ", _driver_uid,  (typeName _driver_uid)];
diag_log _str;
player groupChat _str;
*/

[_vehicle, "name", _name] call A_vehicle_fnc_set_string;
[_vehicle, "saved_driver_uid", _driver_uid] call A_vehicle_fnc_set_string;
[_vehicle, "class", _class] call A_vehicle_fnc_set_string;
[_vehicle, "velocity", _velocity] call A_vehicle_fnc_set_array;
[_vehicle, "position_atl", _position_atl] call A_vehicle_fnc_set_array;
[_vehicle, "vector_direction", _vector_direction] call A_vehicle_fnc_set_array;
[_vehicle, "vector_up", _vector_up] call A_vehicle_fnc_set_array;
[_vehicle, "fuel", _fuel] call A_vehicle_fnc_set_scalar;
[_vehicle, "damage", _damage] call A_vehicle_fnc_set_scalar;
[_vehicle, "engine_state", _engine_state] call A_vehicle_fnc_set_bool;
[_vehicle] call A_vehicle_fnc_save_gear;
[_vehicle] call A_vehicle_fnc_save_storage;
[_vehicle, "item_name", ([_vehicle, "item_name"] call A_vehicle_fnc_get_string), false] call A_vehicle_fnc_set_string_checked; 
