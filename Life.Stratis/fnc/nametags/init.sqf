// A_nametags_fnc_init

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


A_nametags_var_watter_edge_effect = objNull;
A_nametags_var_water_edge_colorized = false;

A_nametags_var_cursortarget__ = objNull;
A_nametags_var_heldtarget__ = objNull;
A_nametags_var_firsttarget__ = objNull;
A_nametags_var_secondtarget__ = objNull;

A_nametags_var_name_tags_side_units = [];


[A_nametags_fnc_onEachFrame] call A_frame_fnc_perFrame;
[A_nametags_fnc_tags_loop] call A_frame_fnc_perFrame;