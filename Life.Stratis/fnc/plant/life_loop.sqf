// A_plant_fnc_life_loop

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"

 _this spawn {
ARGV(0,_plant);
ARGV(1,_death_time);

if (typeName _plant != "OBJECT") exitWith {};
if (undefined(_death_time)) exitWith {};
if (typeName _death_time != "SCALAR") exitWith {};

if (!([_plant, "isPlant", false] call A_object_fnc_getVariable)) exitWith {};

private["_item"];
_item = [_plant, "item", ""] call A_object_fnc_getVariable;

[_item, 1] call A_plant_fnc_update_count;


//give a 5 second buffer so that the plant object is removed before the actual plant particle effect disappears
_death_time = _death_time - 5;

private["_life_time", "_time"];
_time = serverTime ;
_life_time = _death_time - _time;

waitUntil {
	_time = round(serverTime);
	//player groupChat format["_time = %1, _dtime = %2",_time, _death_time];
	if ((_time % 30) == 0) then {
		private["_amount"];
		_amount = [_plant, "amount", 0] call A_object_fnc_getVariable;
		if (_amount == 0) then {
			_amount = ceil(random 4);
			[_plant, _amount] call A_plant_fnc_update_yield;
		};
	};
	sleep 1;
	(_time > _death_time)
};

deleteVehicle _plant;
[_item, -1] call A_plant_fnc_update_count;
};
