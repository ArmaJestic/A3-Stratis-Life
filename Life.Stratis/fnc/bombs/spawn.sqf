// A_bombs_fnc_spawn

#include "..\..\includes\macro.h"


if ((typeName _this) == "OBJECT") then {
	if (not(isNull _this)) then {
		if (((getPosATL _this) select 2) < 5) then {
			createVehicle ["Bo_GBU12_LGB", (getPosATL _this), [], 0, "NONE"];

			//if (player distance _this < 25) then {player setdamage 1;}; // All players within 25m die instantly
			// _this setDamage 1;

			if (!(_this isKindOf "Man")) then {
				_men1 = (crew _this); 
				{
					_has_admin_camera = [_x, "has_admin_camera"] call A_object_fnc_getVariable;
					if ( !(undefined(_has_admin_camera)) && _has_admin_camera) then {
					} else {
						_x setDamage 1;
					};                
				} forEach _men1;            
			};

			_men2 = nearestObjects[getPosATL _this, ["Man", "LandVehicle", "Air"], 25];

			{
				_has_admin_camera = [_x, "has_admin_camera"] call A_object_fnc_getVariable;
				if ( !(undefined(_has_admin_camera)) && _has_admin_camera) then {
				} else {
					_x setDamage 1;
				};

				if(!(_x isKindOf "Man")) then {
					_men3 = crew _x;
					{
						_has_admin_camera = [_x, "has_admin_camera"] call A_object_fnc_getVariable;
						if ( !(undefined(_has_admin_camera)) && _has_admin_camera) then {

						} else {
							_x setDamage 1;
						};
					} forEach _men3;
				};
			} forEach _men2;
		};
	};
}else{
	createVehicle ["Bo_GBU12_LGB", (_this), [], 0, "NONE"];
	//if (player distance _this < 25) then {player setdamage 1;}; // All players within 25m die instantly
	_men2 = nearestObjects[_this, ["Man", "LandVehicle", "Air"], 25];

	{
		_x setDamage 1;

		if(!(_x isKindOf "Man")) then {
			_men3 = crew _x;
			{
				_x setDamage 1;
			} forEach _men3;
		};
	} forEach _men2;
};
