// A_towing_fnc_init

#include "header.h"


A_towing_var_towing_actions = [];
A_towing_var_towed_actions = [];
A_towing_var_loop_data_setup = false;

call A_towing_fnc_clear_towing_data;
call A_towing_fnc_classes_setup;
call A_towing_fnc_object_setup;
call A_towing_fnc_line_create_setup;