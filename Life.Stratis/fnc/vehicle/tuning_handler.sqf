// A_vehicle_fnc_tuning_handler

#include "..\..\includes\macro.h"


if (!(A_input_var_w_key_down || A_input_var_s_key_down)) exitWith {};

private["_vehicle", "_player"];
_player = player;
_vehicle = (vehicle _player);
if (_player == _vehicle) exitWith {};

private["_angle"];
_angle = [(velocity _vehicle), (vectorDir _vehicle)] call A_vector_fnc_angle;
if (_angle > 3) exitWith {};

private["_altitude"];
_altitude = (visiblePosition _vehicle) select 2;
//player groupChat format["_altitude = %1", _altitude];
if (_altitude > 0.2) exitWith {};

private["_tuning", "_nitro"];
_tuning = _vehicle getVariable ["tuning", 0];
_A_item_fnc_nitro = _vehicle getVariable ["A_item_fnc_nitro", 0];



private["_velocity", "_direction", "_magnitude", "_speed"];
_velocity = velocity _vehicle;
_direction = (vectorDir _vehicle);
_speed = (speed _vehicle);

if (_speed < 1) exitWith {};

if (_nitro > 0 && A_input_var_lshift_down) then {
	_vehicle setFuel ((fuel _vehicle) - 0.0001);
	_nitro = if (_speed < 250) then {0.08} else {0.01};
	_tuning = _tuning +_nitro;

};

//player groupChat format["_tuning = %1", _tuning];

if (_tuning == 0) exitWith {};


if (!(A_input_var_s_key_down)) then {
	private["_added"];
	_added = [_velocity, _tuning] call A_vector_fnc_resize;
	_added set [2,0];
	_velocity = [_velocity,_added] call BIS_fnc_vectorAdd;
}else{
	//player groupChat format["Braking!"];
	private["_added"];
	_added = [_velocity, 0.4] call A_vector_fnc_resize;
	_velocity = [_velocity, _added] call BIS_fnc_vectorDiff;
};


_magnitude = [_velocity] call A_vector_fnc_magnitude;
if (_speed < 350) then {
	private["_new_velocity"];
	_new_velocity = [_direction, _magnitude] call A_vector_fnc_resize;
	_vehicle setVelocity _new_velocity;
};
