#include "macro.h"

is_prone = {
	ARGV(0,_unit);
	if (undefined(_unit)) exitWith {false};
	private["_stance"];
	_stance = toLower(stance _unit);
	private["_prone_stances"];
	_prone_stances = ["prone", "lying"];
	((_prone_stances find _stance) >= 0)
};

is_facing = {
	ARGV(0,_unit1);
	ARGV(1,_unit2);

	private ["_return"];
	_return = [getpos _unit1, getdir _unit1, 45, getpos _unit2] call angle_sector;
	_return;
};

is_frontback = {
	ARGV(0,_unit1);
	ARGV(1,_unit2);
	
	private ["_return", "_check"];
	_return = "";
	_check = [getpos _unit2, getdir _unit2, 180, getpos _unit1] call angle_sector;
	if (_check) then {
		_return = "front";
	} else {
		_return = "back";
	};

	_return;
};

angle_sector = {
	private["_dir1","_dir2","_dir3","_small","_large","_x","_y","_r"];
	_r = false;

	_small = (_this select 1) - ((_this select 2) / 2);
	_large = (_this select 1) + ((_this select 2) / 2);

	_x = ((_this select 3) select 0) - ((_this select 0) select 0);
	_y = ((_this select 3) select 1) - ((_this select 0) select 1);

	_dir1 = _x atan2 _y;

	if (_dir1 < 0) then {_dir1 = _dir1 + 360};

	_dir2 = _dir1 - 360;
	_dir3 = _dir1 + 360;

	if ((_dir1 >= _small && _dir1 <= _large) ||
		(_dir2 >= _small && _dir2 <= _large) || 
		(_dir3 >= _small && _dir3 <= _large)) then {
		_r = true
	};
	_r
};
