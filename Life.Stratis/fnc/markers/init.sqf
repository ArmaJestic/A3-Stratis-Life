// A_markers_fnc_init

#include "..\..\includes\macro.h"


marker_side_array = call A_markers_fnc_side_init;
[A_markers_fnc_side_loop,0.5] call A_frame_fnc_perFrame;
