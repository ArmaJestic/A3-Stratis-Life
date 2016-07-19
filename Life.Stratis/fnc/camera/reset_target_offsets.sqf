// A_camera_fnc_reset_target_offsets

#include "../../includes/dikcodes.h"
#include "../../includes/macro.h"


ARGV(0,_current_target);
if (undefined(_current_target)) exitWith {};
if (isNull _current_target) exitWith {};

private["_player"];
_player = camera_unit;

private["_target_marker"];

_target_marker = ([_player] call A_camera_fnc_get_target_marker);
if (undefined(_target_marker)) exitWith {};
		
private["_current_target_pos", "_target_marker_pos"];
_current_target_pos = [_current_target, "offset", null] call A_object_fnc_getVariable;
if (undefined(_current_target_pos)) then {
	_current_target_pos = _current_target modelToWorld [0,0,0];
};

_target_marker_pos = [_current_target] call A_camera_fnc_plane_intersect;
offset_x = ((_target_marker_pos select 0) - (_current_target_pos select 0));
offset_y = ((_target_marker_pos select 1) - (_current_target_pos select 1));
offset_z = ((_target_marker_pos select 2) - (_current_target_pos select 2));

//player groupChat format["offset_x = %1, offset_y = %2,offset_z = %3", offset_x, offset_y, offset_z];
