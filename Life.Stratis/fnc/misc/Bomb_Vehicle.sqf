// A_misc_fnc_Bomb_Vehicle

#include "..\..\includes\macro.h"

if (count _this > 1) then {
	if (not(isNull (_this select 1))) then {
		_obj = _this select 1;
		if (((getPosATL _obj) select 2) > 5) then {
			liafu = true;
			_obj setDamage 1;
		} 
		else {
			createVehicle ["Bo_GBU12_LGB", (_this select 0), [], 0, "NONE"];
			_obj setDamage 1;
		};
	};
}
else {
	createVehicle ["Bo_GBU12_LGB", (_this select 0), [], 0, "NONE"];
};

if (count _this > 2) then {
	format ["
	if ((random 100) < 10) then {
		hint format[localize ""STRS_vehiclebomb_public_explode"", %1];
		[""Bomb"", %1] spawn A_misc_fnc_Isse_AddCrimeLogEntry;
	};
	", player] call broadcast;
};
