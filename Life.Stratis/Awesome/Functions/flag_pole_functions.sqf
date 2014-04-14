#include "macro.h"
if (not(undefined(flag_pole_functions_defined))) exitWith {null};

flag_pole_position = 0;
flag_pole_flag_object = 1;
flag_pole_mast_object = 2;
flag_pole_max_z = 3;
flag_pole_min_z = 4;
flag_pole_flag_object_offset = 5;

flag_pole_init_handler_persistent = {
	ARGV(0,_object);
	ARGV(1,_name);
	
	if (undefined(_object)) exitWith {};
	if (undefined(_name)) exitWith {};
	if (typeName _object != "OBJECT") exitWith {};
	if (isNull _object) exitWith {};
	if (typeName _name != "STRING") exitWith {};
	
	_object setVehicleVarName _name;
	_object allowDamage false;
	missionNamespace setVariable [_name, _object];
};

flag_pole_banner_init_handler_persistent = {
	ARGV(0,_object);
	ARGV(1,_name);
	ARGV(2,_texture);
	
	if (undefined(_object)) exitWith {};
	if (undefined(_name)) exitWith {};
	if (typeName _object != "OBJECT") exitWith {};
	if (isNull _object) exitWith {};
	if (typeName _name != "STRING") exitWith {};
	if (typeName _texture != "STRING") exitWith {};
	
	_object setVehicleVarName _name;
	_object allowDamage false;
	_object setFlagTexture _texture;
	missionNamespace setVariable [_name, _object];
};


flag_pole_create = {
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
	
	//[[_pole_2, format["%1_pole2", _name]], "flag_pole_init_handler_persistent", true, true] spawn BIS_fnc_MP;
	[[_pole_2, format["%1_pole2", _name]], "flag_pole_init_handler_persistent", true, true] spawn jip_register;
	//[[_flag, format["%1_flag", _name], "a3\data_f\Flags\flag_fd_red_co.paa" ], "flag_pole_banner_init_handler_persistent", true, true] spawn BIS_fnc_MP;
	[[_flag, format["%1_flag", _name], "a3\data_f\Flags\flag_fd_red_co.paa" ], "flag_pole_banner_init_handler_persistent", true, true] spawn jip_register;

	

	private["_min_z", "_max_z"];
	_min_z = -6.8;
	_max_z = 0;
	 
	private["_offset"];
	_offset = [0,0,_min_z];
	_flag attachTo [_pole_2, _offset];

	private["_flag_pole"];
	_flag_pole = [];
	_flag_pole set [flag_pole_position, _position];
	_flag_pole set [flag_pole_flag_object, _flag];
	_flag_pole set [flag_pole_mast_object, _pole_2];
	_flag_pole set [flag_pole_max_z, _max_z];
	_flag_pole set [flag_pole_min_z, _min_z];
	_flag_pole set [flag_pole_flag_object_offset, _offset];
	
	_flag_pole
};

flag_pole_move_flag = {
	ARGV(0,_pole);
	ARGV(1,_amount);
	if (undefined(_pole)) exitWith {null};
	if (undefined(_amount)) exitWith {null};
	if (typeName _pole != "ARRAY") exitWith {null};
	if (typeName _amount != "SCALAR") exitWith {null};
	
	private["_max_z", "_min_z", "_mast", "_flag"];
	
	_mast = _pole select flag_pole_mast_object;
	_flag = _pole select flag_pole_flag_object;
	_max_z = _pole select flag_pole_max_z;
	_min_z = _pole select flag_pole_min_z;
	
	private["_offset", "_z_offset"];
	_offset = _pole select flag_pole_flag_object_offset;
	_z_offset = _offset select 2;
	
	
	private["_new_z"];
	_new_z = _z_offset + _amount;
	
	if (_new_z < _min_z) then {
		_new_z = _min_z;
	};
	
	if (_new_z > _max_z) then {
		_new_z = _max_z;
	};
	
	_offset set [2, _new_z];
	
	_flag attachTo [_mast, _offset];
};

flag_pole_flag_at_min_z = {
	ARGV(0,_pole);
	if (undefined(_pole)) exitWith {false};
	if (typeName _pole != "ARRAY") exitWith {false};

	
	private["_min_z", "_offset", "_z_offset"];
	_offset = _pole select flag_pole_flag_object_offset;
	_z_offset = _offset select 2;
	_min_z = _pole select flag_pole_min_z;
	
	(_z_offset <= _min_z)
};

flag_pole_flag_at_max_z = {
	ARGV(0,_pole);
	if (undefined(_pole)) exitWith {false};
	if (typeName _pole != "ARRAY") exitWith {false};

	private["_max_z", "_offset", "_z_offset"];
	_offset = _pole select flag_pole_flag_object_offset;
	_z_offset = _offset select 2;
	_max_z = _pole select flag_pole_max_z;
	(_z_offset >= _max_z)
};


flag_pole_functions_defined = false;