// A_camera_fnc_MouseButtonUp_handler

#include "../../includes/dikcodes.h"
#include "../../includes/macro.h"


//player groupChat format["A_camera_fnc_MouseButtonUp_handler %1", _this];
ARGV(0,_this);

private["_player"];
_player = camera_unit;

ARGV(0,_display);
ARGV(1,_button);
ARGV(2,_x);
ARGV(3,_y);
ARGV(5,_control);

if (_button == 0) then {
	
	private["_left_click_target"];
	_left_click_target = [_player] call A_camera_fnc_get_left_click_target;
	
	if (not(isNull _left_click_target)) then {
		offset_x = 0;
		offset_y = 0;
		offset_z = 0;
	};
	
	A_camera_var_space_hold_reset = false;

	[_player, null] call A_camera_fnc_set_left_click_target;
};

true
