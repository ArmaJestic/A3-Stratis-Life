// A_vehicle_fnc_init_stats

#include "..\..\includes\macro.h"


//player groupChat format["A_vehicle_fnc_init_stats %1", _this];
ARGV(0,_vehicle);
if (undefined(_vehicle)) exitWith {null};
if (typeName _vehicle != "OBJECT") exitWith {null};

private["_driver", "_velocity", "_position_atl", "_vector_direction", "_vector_up", "_fuel", "_damage", "_engine_state", "_weapons", "_magazines"];

_velocity = [_vehicle, "velocity"] call A_vehicle_fnc_get_array;
_position_atl = [_vehicle, "position_atl"] call A_vehicle_fnc_get_array;
			
_vector_direction = [_vehicle, "vector_direction"] call A_vehicle_fnc_get_array;
_vector_up =[_vehicle, "vector_up"] call A_vehicle_fnc_get_array;
_fuel = [_vehicle, "fuel"] call A_vehicle_fnc_get_scalar;
_damage = [_vehicle, "damage"] call A_vehicle_fnc_get_scalar;
_engine_state = [_vehicle, "engine_state"] call A_vehicle_fnc_get_bool;
_weapons = [_vehicle, "weapons"] call A_vehicle_fnc_get_array;
_magazines= [_vehicle, "magazines"] call A_vehicle_fnc_get_array;

private["_gear"];
_gear = [];
_gear set [A_vehicle_var_gear_weapons_cargo, _weapons];
_gear set [A_vehicle_var_gear_magazines_cargo, _magazines];

[_vehicle,_gear] call A_vehicle_fnc_set_gear;

/*
player groupChat format["_position_atl = %1", _position_atl];
player groupChat format["_vector_direction = %1", _vector_direction];
player groupChat format["_vector_up = %1", _vector_up];
player groupChat format["_velocity = %1", _velocity];
player groupChat format["_engine_state = %1", _engine_state];
player groupChat format["_damage = %1", _damage];
player groupChat format["_fuel = %1", _fuel];
*/
_vehicle enableSimulation false; //disable simulation so that the vehicle does not get damaged while being teleported

//set the position
if (typeName _position_atl == "ARRAY" && {count(_position_atl) == 3}) then {
	_vehicle setPosATL _position_atl;
}
else {
	player globalChat format["WARNING: Could not load vehicle stat: _position_atl"];
};

//set the velocity
if (typeName _velocity == "SCALAR") then {
	_vehicle setVelocity _velocity;
}
else {
	player globalChat format["WARNING: Could not load vehicle stat: _velocity"];
};

//set the direction
if (typeName _vector_direction == "ARRAY" && {typename _vector_up == "ARRAY"}) then {
	_vehicle setVectorDirAndUp [_vector_direction, _vector_up];
}
else {
	player globalChat format["WARNING: Could not load vehicle stat: _vector_direction, _vector_up"];
};

//set the engine state
if (typeName _engine_state == "BOOL") then {
	_vehicle engineOn _engine_state;
}
else {
	player globalChat format["WARNING: Could not load vehicle stat: _damage"];
};

//set the fuel
if (typeName _fuel == "SCALAR") then {
	_vehicle setFuel _fuel;
}
else {
	player globalChat format["WARNING: Could not load vehicle stat: _fuel"];
};


_vehicle enableSimulation true;
