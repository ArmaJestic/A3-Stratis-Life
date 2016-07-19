// A_markers_fnc_side_loop

#include "../../includes/macro.h"


if (undefined(marker_side_array)) then {
	marker_side_array = call A_markers_fnc_side_init;
};

private["_marker_loop_i"];
_marker_loop_i = 0;
while {true} do {
	private["_player"];
	_player = player;

	{ 
		if ([_player] call A_camera_fnc_enabled) then {
			[_x] call A_markers_fnc_loop_draw;
		}
		else {
			[_x] call A_markers_fnc_side_loop_draw; 
		};
	} forEach marker_side_array;
	_marker_loop_i = _marker_loop_i + 1;
	sleep 0.5;
	if (_marker_loop_i > 5000) exitWith {};
};

[] spawn A_markers_fnc_side_loop; 
