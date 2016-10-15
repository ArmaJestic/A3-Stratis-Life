// A_other_fnc_smoke

#include "..\..\includes\macro.h"


diag_log format['A_other_fnc_smoke %1: start', _this];

params["_unit","_weapon","_muzzle","_mode","_ammo","_magazine","_projectile"];


if ((typeName _projectile) != "OBJECT") exitWith {diag_log format['A_other_fnc_smoke %1: exit1', _this];};

_Tear_gas = {
	_pos = _this select 0;
	_timenow = time;
	_array = [];	
	
	while {time < (_timenow + 10) || (!(isnull _pos))} do {
	  if (!gasmask) then {
			sleep 1;
			if (!(isnull _pos))then {
				if (count(nearestObjects [_pos, ["Man"], 10]) > 0) then {
					{
						[_x, "flashed", true, true] call A_object_fnc_setVariable;
						_array set [count _array,_x];
					} foreach nearestObjects [_pos, ["Man"], 10];	
				}else{
					{
						_unit = _x;
						[_unit, "flashed", false, true] call A_object_fnc_setVariable;
						{
							if (_x == _unit) then{
								_array = _array - [_x];
							};
						} foreach _array;
					}foreach _array;
				};
			};
		};
	};	
};



_BPos = [];

while {!isNull _projectile and ((velocity _projectile)select 0 > 0.1)} do {
	_BPos = getPosATL _projectile;
};

switch (_ammo) do {
	case "SmokeShell": {
		[_projectile] spawn _Tear_gas;
	};   
	case "G_40mm_Smoke": {
		[_projectile] spawn _Tear_gas;
	};   
};

diag_log format['A_other_fnc_smoke %1: end', _this];