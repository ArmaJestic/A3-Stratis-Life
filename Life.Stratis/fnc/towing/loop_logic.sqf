// A_towing_fnc_loop_logic

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


private["_player"];
_player = player;

private["_vehicle"];
_vehicle = (vehicle _player);

private["_is_driver"];
_is_driver  = (driver(_vehicle) == _player && {!(_vehicle == _player)});

if (!(_is_driver) && A_towing_var_loop_data_setup) exitWith {
	[] call A_towing_fnc_clear_towing_data;
};

if (_is_driver && !(A_towing_var_loop_data_setup)) exitWith {
	[_vehicle] call A_towing_fnc_setup_towing_data;
};

if (!(A_towing_var_loop_data_setup)) exitWith {};

private["_towing", "_towing_hitch_offset"];
_towing = towing;
_towing_hitch_offset = towing_hitch_offset;

private["_towed", "_towed_hitch_offset", "_towed_front_axle", "_towed_back_axle"];
_towed = towed;
_towed_hitch_offset = towed_hitch_offset;
_towed_front_axle = towed_front_axle;
_towed_back_axle = towed_back_axle;

private["_distance", "_max_angle"];
_distance = 2.5;
_max_angle = 60;

private["_anchor", "_towed_target_offset"];
_anchor = _towing_hitch_offset;
_towed_target_offset = [(_anchor select 0), ((_anchor select 1) - _distance), (_anchor select 2)];

if (undefined(towed_hitch_position)) then {
	towed_hitch_position = _towed modelToWorld _towed_target_offset;
};

//[_towing, _anchor, _towed_target_offset]call A_vector_fnc_drawModel;

private["_towed_target_vector"];
_towed_target_vector = [_towed_target_offset, _anchor] call A_vector_fnc_subtract;

private["_towed_actual_offset"];
_towed_actual_offset = (_towing worldToModel towed_hitch_position);
//[_towing,_anchor,  _towed_actual_offset] call A_vector_fnc_drawModel;

private["_towed_actual_vector"];
_towed_actual_vector = [_towed_actual_offset, _anchor] call A_vector_fnc_subtract;

private["_angle"];
_angle = [_towed_target_vector, _towed_actual_vector] call A_vector_fnc_angle;

private["_lin", "_speed"];
_speed = (speed _towing);
_lin = [_speed, _angle] call A_towing_fnc_interpolation_percent;

private["_towed_interpolated_vector"];
_towed_interpolated_vector = [_towed_target_vector, _towed_actual_vector, _lin] call A_vector_fnc_interpolate;
_towed_interpolated_vector set [2, (_towed_target_vector select 2)];
_towed_interpolated_vector = [_towed_interpolated_vector, _distance] call A_vector_fnc_resize;

private["_towed_interpolated_offset"];
_towed_interpolated_offset = [_towed_interpolated_vector, _anchor] call A_vector_fnc_add;
//[_towing, _anchor,  _towed_interpolated_offset] call A_vector_fnc_drawModel;

private["_dir_vector"];
_dir_vector = [(_towing modelToWorld _anchor), (_towed modelToWorld _towed_hitch_offset)] call A_vector_fnc_subtract;


private["_towed_front_axle_offset", "_towed_back_axle_offset"];
_towed_front_axle_offset = (_towed modelToWorld _towed_front_axle);
_towed_back_axle_offset = (_towed modelToWorld _towed_back_axle);

private["_towed_front_surface_normal_unit", "_towed_back_surface_normal_unit"];
_towed_front_surface_normal_unit = (surfaceNormal _towed_front_axle_offset);
_towed_back_surface_normal_unit = (surfaceNormal _towed_back_axle_offset);

private["_towed_front_surface_normal", "_towed_back_surface_normal"];
_towed_front_surface_normal = [_towed_front_surface_normal_unit, 10] call A_vector_fnc_resize;
_towed_back_surface_normal = [_towed_back_surface_normal_unit, 10] call A_vector_fnc_resize;

private["_towed_front_surface_normal_offset", "_towed_back_surface_normal_offset"];

_towed_front_surface_normal_offset = [_towed_front_axle_offset, _towed_front_surface_normal] call A_vector_fnc_add;
_towed_back_surface_normal_offset = [_towed_back_axle_offset, _towed_back_surface_normal] call A_vector_fnc_add;
//drawLine3D [_towed_front_axle_offset, _towed_front_surface_normal_offset, [1,0,0,1]];	
//drawLine3D [_towed_back_axle_offset, _towed_back_surface_normal_offset, [1,0,0,1]];	

private["_interpolated_normal_unit", "_interpolated_normal", "_interpolated_normal_offset"];
//player groupChat format["%1", _towed_front_surface_normal_unit];
_interpolated_normal_unit = [_towed_front_surface_normal_unit, _towed_back_surface_normal_unit, 0.5]  call A_vector_fnc_interpolate;
_interpolated_normal = [_interpolated_normal_unit, 10] call A_vector_fnc_resize;
_interpolated_normal_offset = [(_towed modelToWorld [0,0,0]), _interpolated_normal] call A_vector_fnc_add;
//drawLine3D [(_towed modelToWorld [0,0,0]), _interpolated_normal_offset, [1,0,0,1]];	

if (_angle > _max_angle && !(_speed > 0) && _speed < -0.01) exitWith {
	_towing setVelocity [0,0,0];
	_towed setVelocity [0,0,0];
};

if (abs(_speed) < 0.5) exitWith {};
if (!(_is_driver)) exitWith {};

towed_hitch_position =  (_towing modelToWorld _towed_interpolated_offset);
towed_hitch setPos towed_hitch_position;
towed_hitch setVectorDir _dir_vector;

[_towing, _towed, towed_hitch, _dir_vector, _interpolated_normal, _anchor, _towed_hitch_offset] call A_towing_fnc_update_position;
