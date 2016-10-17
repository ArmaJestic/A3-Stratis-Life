// A_misc_fnc_setPitchBank

#include "..\..\includes\macro.h"


params["_obj","_pitch","_bank"];

if UNDEFINED(_bank) exitWith {null};
if UNDEFINED(_pitch) exitWith {null};
if UNDEFINED(_obj) exitWith {null};

private _yaw = 360-(getdir _obj);

//function to rotate a 2d vector around the origin
_rotate = {
	private _v =+ (_this select 0); //we don't want to modify the originally passed vector
	private _d = _this select 1;
	if UNDEFINED(_d) then {
		_d = 0;
	};
	
	private _x = _v select 0;
	private _y = _v select 1;
	_v set[0, (cos _d)*_x - (sin _d)*_y];
	_v set[1, (sin _d)*_x + (cos _d)*_y];
	_v
};

//find vector dir (pitch)
private _sign = [1,-1] select (_pitch < 0);

//while {abs _pitch > 180} do {_pitch = _sign*(abs _pitch - 180)};
if (abs _pitch > 180) then {
	_pitch = _sign*(abs _pitch % 180);
};

if(abs _pitch == 90) then {_pitch = _sign*(89.9)};

if(abs _pitch > 90) then {
	_obj setdir (getdir _obj)-180;
	_yaw = 360-(getdir _obj);
	_bank = _bank + 180;
	_pitch = (180 - abs _pitch)*_sign;
};

private _vdir = [0, cos _pitch, sin _pitch];
_vdir = [_vdir, _yaw] call _rotate;

//find vector up (bank)

_sign = [1,-1] select (_bank < 0);

//while {abs _bank > 360} do {_bank = _sign*(abs _bank - 360)};
if (abs _bank > 360) then {
	_bank = _sign * (abs _bank % 360);
};

if(abs _bank > 180) then {
	_sign = -1*_sign; 
	_bank = (360-_bank)*_sign;
};

private _vup = [sin _bank, 0, cos _bank];
_vup = [_vup select 0] + ([[_vup select 1, _vup select 2], _pitch] call _rotate);
_vup = [_vup, _yaw] call _rotate;

//apply the vectors
_obj setVectorDirAndUp [_vdir, _vup];