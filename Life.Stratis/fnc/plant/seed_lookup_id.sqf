// A_plant_fnc_seed_lookup_id

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


ARGV(0,_id);
if (undefined(_id)) exitWith {null};

private["_data"];
_data = null;

{
	private["_cdata", "_cid"];
	_cdata = _x;
	_cid = _cdata select A_plant_var_seed_data_id;
	if (_cid == _id) exitWith {
		_data = _cdata;
	};
} forEach A_plant_var_seed_data;
_data
