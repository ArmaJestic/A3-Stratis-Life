// A_camera_fnc_init_pre

#include "..\..\includes\dikcodes.h"
#include "..\..\includes\macro.h"


if (isServer) exitwith {};

A_camera_var_tracked_objects = [];
A_camera_var_export_reference_object = objNull;
A_camera_var_space_hold_reset = false;
A_camera_var_shift_held = false;
A_camera_var_control_held = false;
A_camera_var_alt_held = false;
A_camera_var_lwin_held = false;
A_camera_var_space_held = false;
A_camera_var_key_tracker = [];

[] call A_camera_fnc_create_setPos_reference;