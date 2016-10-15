// A_markers_fnc_side_loop

#include "..\..\includes\macro.h"


{ 
	if ([player] call A_camera_fnc_enabled) then {
		[_x] call A_markers_fnc_loop_draw;
	}else{
		[_x] call A_markers_fnc_side_loop_draw; 
	};
} forEach marker_side_array;