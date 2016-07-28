#include "macro.h"
if (not(undefined(farming_functions_defined))) exitWith {null};

#include "macro.h"


private["_b1", "_b2", "_b3"];
_b1 = 0; _b2 = 0; _b3 = 0;

private["_c1", "_c2", "_c3"];
_c1 = 0; _c2 = 0; _c3 = 0;



for [{_i=0}, {_i < (count A_inv_var_itemshops)}, {_i=_i+1}] do {
	private["_object"];
	_object   = ((A_inv_var_itemshops select _i) select 0);
	shopusearray = shopusearray + [_object];
};


for [{_i = 0}, {_i < (count A_inv_var_farmitemarray)}, {_i = _i + 1}] do {
	_arr    = (A_inv_var_farmitemarray select _i);
	_added  = (_Arr1 select _i);
	_isInArea = false;
	
	if(isblu and ((_arr select 1) == "Whale" or (_arr select 1) == "Unprocessed_cocain")) exitWith {null}; 
	
	{
		if (((vehicle player) distance (getMarkerPos (_x select 0))) < (_x select 1)) then {_isInArea = true;};
	} forEach (_arr select 0);

	_hasVehicle = false;

	{
		if ((vehicle player) isKindOf _x) then {_hasVehicle = true;};
	} forEach (_arr select 4);

	if ((_isInArea) and (_hasVehicle) and (speed (vehicle player) > 2 or ((_arr select 4) select 0) == "Ship")) then {
		[(_arr select 1), (_arr select 2), (_arr select 3), (_arr select 4)] execVM "gathergen.sqf";
	};
};
