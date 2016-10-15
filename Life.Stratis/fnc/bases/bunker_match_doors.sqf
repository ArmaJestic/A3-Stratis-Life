// A_bases_fnc_bunker_match_doors

#include "header.h"


params["_doors1","_doors2"];
if (UNDEFINED(_doors1)) exitWith {};
if (UNDEFINED(_doors2)) exitWith {};

//match the doors with each other
private _i = 0;
while {(_i < (count(_doors1))) && {_i < (count(_doors2))}} do {
	private _door1 = _doors1 select _i;
	private _door2 = _doors2 select _i;
	
	private _door1_data = [_door1, "bunker_door_data"] call A_object_fnc_getVariable;
	private _door2_data = [_door2, "bunker_door_data"] call A_object_fnc_getVariable;
	
	private _door1_netid = netId _door1;
	private _door2_netid = netId _door2;
	
	_door1_data set [BUNKER_INDEX_DOOR_TARGET_NETID, _door2_netid];
	_door2_data set [BUNKER_INDEX_DOOR_TARGET_NETID, _door1_netid];
	
	[_door1, "bunker_door_data", _door1_data, true] call A_object_fnc_setVariable;
	[_door2, "bunker_door_data", _door2_data, true] call A_object_fnc_setVariable;

	_i = _i + 1;
};