// A_camera_fnc_MouseButtonDown_handler

#include "..\..\includes\dikcodes.h"
#include "..\..\includes\macro.h"


//player groupChat format["A_camera_fnc_MouseButtonDown_handler %1", _this];
ARGV(0,_this);

private["_player"];
_player = camera_unit;


ARGV(0,_display);
ARGV(1,_button);
ARGV(2,_x);
ARGV(3,_y);
ARGV(4,_shift);
ARGV(5,_control);


if (_button == 0) then {

	[_player] spawn {
		ARGV(0,_player);
		private["_current_target"];
		_current_target = [_player] call A_camera_fnc_get_current_target;
		[_current_target] call A_camera_fnc_reset_target_offsets;
		[_player, _current_target] call A_camera_fnc_set_left_click_target;
	};
};

true
