// A_plant_fnc_seed_lookup_id

#include "header.h"


params["_id"];
if (UNDEFINED(_id)) exitWith {null};

private _data = null;

{
	private _cdata = _x;
	private _cid = _cdata select INDEX_ID;
	if (_cid == _id) exitWith {
		_data = _cdata;
	};
} forEach A_plant_var_seed_data;
_data