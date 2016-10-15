// A_camera_fnc_keyDownHandler

#include "..\..\includes\dikcodes.h"
#include "..\..\includes\macro.h"


params["_disp","_key","_shift","_ctrl","_alt"];
private["_player","_handled"];
_player = camera_unit;
_handled = false;

private["_left_click_target"];
_left_click_target = [_player] call A_camera_fnc_get_left_click_target;
	
[true, _key] call A_camera_fnc_update_key_tracker;
//player groupChat format["_key = %1", _key];

if (_shift) then {
	A_camera_var_shift_held = true;
};
if (_ctrl) then {
	A_camera_var_control_held = true;
};
if (_alt) then {
	A_camera_var_alt_held = true;
};

if (_key == DIK_LWIN) then {
	A_camera_var_lwin_held = true;
};
if (_key == DIK_SPACE) then {
	A_camera_var_space_held = true;
	
	if (!(isNull _left_click_target) && {!(A_camera_var_space_hold_reset)}) then {
		[_left_click_target] call A_camera_fnc_reset_target_offsets;
		A_camera_var_space_hold_reset = true;
	};
};
if (_key == DIK_DELETE) then {
	if (isNull _left_click_target) exitWith {false};
	deleteVehicle _left_click_target;
};

private["_camera"];
_camera = [_player, "camera"] call A_object_fnc_getVariable;
if (UNDEFINED(_camera)) exitWith {null};

[_player, _key, _shift] call A_camera_fnc_update_map;
if ([_player] call A_camera_fnc_get_map_open) exitWith {false};

[_player, _key] call A_camera_fnc_update_nightvision;


_handled = [_player, _key, _shift] call A_camera_fnc_update_target;	

[_player, _key, _shift] call A_camera_fnc_update_position;


_handled