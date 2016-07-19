// A_flag_pole_fnc_create

#include "..\..\includes\macro.h"


ARGV(0,_name);
ARGV(1,_position);

if (undefined(_name)) exitWith {null};
if (undefined(_position)) exitWith {null};
if (typeName _name != "STRING") exitWith {null};
if (typeName _position != "ARRAY") exitWith {null};

private["_pole_class", "_flag_class", "_pole1", "_flag", "_flag_offset", "_object_init_function"];
_pole_class = "FlagPole_F";
_flag_class = "FlagPole_F";


_pole_2 = createVehicle [_pole_class, _position, [], 0, "CAN_COLLIDE"];
_flag = createVehicle [_flag_class, _position, [], 0, "CAN_COLLIDE"];

//[[_pole_2, format["%1_pole2", _name]], "A_flag_pole_fnc_init_handler_persistent", true, true] spawn BIS_fnc_MP;
[[_pole_2, format["%1_pole2", _name]], "A_flag_pole_fnc_init_handler_persistent", true, true] spawn A_jip_fnc_register;
//[[_flag, format["%1_flag", _name], "a3\data_f\Flags\flag_fd_red_co.paa" ], "A_flag_pole_fnc_banner_init_handler_persistent", true, true] spawn BIS_fnc_MP;
[[_flag, format["%1_flag", _name], "a3\data_f\Flags\flag_fd_red_co.paa" ], "A_flag_pole_fnc_banner_init_handler_persistent", true, true] spawn A_jip_fnc_register;



private["_min_z", "_max_z"];
_min_z = -6.8;
_max_z = 0;
 
private["_offset"];
_offset = [0,0,_min_z];
_flag attachTo [_pole_2, _offset];

private["_flag_pole"];
_flag_pole = [];
_flag_pole set [A_flag_pole_var_position, _position];
_flag_pole set [A_flag_pole_var_flag_object, _flag];
_flag_pole set [A_flag_pole_var_mast_object, _pole_2];
_flag_pole set [A_flag_pole_var_max_z, _max_z];
_flag_pole set [A_flag_pole_var_min_z, _min_z];
_flag_pole set [A_flag_pole_var_flag_object_offset, _offset];

_flag_pole
