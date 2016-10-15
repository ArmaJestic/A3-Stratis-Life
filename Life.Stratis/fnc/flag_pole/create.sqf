// A_flag_pole_fnc_create

#include "header.h"


params[["_name",null,[""]],["_position",null,[[]]]];

if (UNDEFINED(_name)) exitWith {null};
if (UNDEFINED(_position)) exitWith {null};

private _pole_class = "FlagPole_F";
private _flag_class = "FlagPole_F";

private _pole_2 = createVehicle [_pole_class, _position, [], 0, "CAN_COLLIDE"];
private _flag = createVehicle [_flag_class, _position, [], 0, "CAN_COLLIDE"];

[[_pole_2, format["%1_pole2", _name]], "A_flag_pole_fnc_init_handler_persistent"] spawn A_jip_fnc_register;
[[_flag, format["%1_flag", _name], "a3\data_f\Flags\flag_fd_red_co.paa" ], "A_flag_pole_fnc_banner_init_handler_persistent"] spawn A_jip_fnc_register;


private _min_z = -6.8;
private _max_z = 0;

private _offset = [0,0,_min_z];
_flag attachTo [_pole_2, _offset];


private _flag_pole = [];
_flag_pole set[INDEX_POSITION, _position];
_flag_pole set[INDEX_FLAG_OBJECT, _flag];
_flag_pole set[INDEX_MAST_OBJECT, _pole_2];
_flag_pole set[INDEX_MAX_Z, _max_z];
_flag_pole set[INDEX_MIN_Z, _min_z];
_flag_pole set[INDEX_FLAG_OFFSET, _offset];

_flag_pole