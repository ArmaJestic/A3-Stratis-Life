// A_doors_fnc_doors_MouseZChangedHandler

#include "header.h"


if (!(A_doors_var_doors_lcontrol_state)) exitWith {};
params["_ctrl","_z_change"];

private _object = cursorTarget;
private _neck_pos = player selectionPosition "neck";
private _pos1 = player modelToWorld _neck_pos;
private _pos2 = player modelToWorld [(_neck_pos select 0), (_neck_pos select 1) + 2, (_neck_pos select 2)];
private _intersect = [_object, "FIRE"] intersect [_pos1, _pos2];

if (count(_intersect) == 0) exitWith {};

private _door = ((_intersect select 0) select 0);

if ([[_object,_door]] call A_doors_fnc_house_door_locked) exitWith {};

private _animation_name = format["%1_rot", _door];
private _animation_phase = _object animationPhase _animation_name;

_door_z_change = _animation_phase + _z_change / 8;

if (_door_z_change <= 0.1) then {
	_door_z_change = 0.001;
};

if (_door_z_change >= 0.9) then {
	_door_z_change = 0.999;
};

_object animate [_animation_name,  _door_z_change];