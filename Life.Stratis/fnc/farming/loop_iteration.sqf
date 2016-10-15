// A_farming_fnc_loop_iteration

#include "..\..\includes\macro.h"


for [{_i = 0}, {_i < (count A_inv_var_farmitemarray)}, {_i = _i + 1}] do {
	_arr    = (A_inv_var_farmitemarray select _i);
	_added  = (A_farming_var_arr select _i);
	_isInArea = false;
	
	if(isblu and ((_arr select 1) == "Whale" or (_arr select 1) == "Unprocessed_cocain")) exitWith {null}; 
	
	{
		if (((vehicle player) distance (getMarkerPos (_x select 0))) < (_x select 1)) then {_isInArea = true;};
	} forEach (_arr select 0);

	// change to count
	_hasVehicle = false;
	{
		if ((vehicle player) isKindOf _x) exitwith {_hasVehicle = true;};
	} forEach (_arr select 4);

	if ((_isInArea) and (_hasVehicle) and (speed (vehicle player) > 2 or ((_arr select 4) select 0) == "Ship")) then {
		[(_arr select 1), (_arr select 2), (_arr select 3), (_arr select 4)] call A_farming_fnc_gathergen;
	};
};
