// A_bunker_fnc_match_doors

#include "../../includes/constants.h"
#include "../../includes/macro.h"


//player groupChat format["A_bunker_fnc_match_doors %1", _this];
ARGV(0,_doors1);
ARGV(1,_doors2);

if (undefined(_doors1)) exitWith {};
if (undefined(_doors2)) exitWith {};

//match the doors with each other
private["_i"];
_i = 0;
while {_i < (count(_doors1)) && _i < (count(_doors2))} do {
	private["_door1", "_door2"];
	_door1 = _doors1 select _i;
	_door2 = _doors2 select _i;
	
	private["_door1_data", "_door2_data"];
	_door1_data = [_door1, "bunker_door_data"] call A_object_fnc_getVariable;
	_door2_data = [_door2, "bunker_door_data"] call A_object_fnc_getVariable;
	
	private["_door1_netid", "_door2_netid"];
	_door1_netid = netId _door1;
	_door2_netid = netId _door2;
	
	_door1_data set [A_bunker_var_door_data_target_netid, _door2_netid];
	_door2_data set [A_bunker_var_door_data_target_netid, _door1_netid];
	
	[_door1, "bunker_door_data", _door1_data, true] call A_object_fnc_setVariable;
	[_door2, "bunker_door_data", _door2_data, true] call A_object_fnc_setVariable;

	_i = _i + 1;
};
