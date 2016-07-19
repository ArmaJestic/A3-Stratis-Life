// A_inventory_fnc_get_storage_amount

#include "../../includes/constants.h"
#include "../../includes/macro.h"


ARGV(0,_object);
ARGV(1,_Itemname);
ARGV(2,_arrname);

[_object, _arrname] call A_inventory_fnc_check_array;
private["_Array"];
_Array = [_object, _arrname, null] call A_object_fnc_getVariable;

if (undefined(_Array)) exitWith {0};

private["_Result", "_i"];
_Result = 0;
_i = 0;
while { _i <  (count _Array) } do {
	private["_citem"];
	_citem = ((_Array select _i) select 0);
	if ( _citem == _Itemname) exitWith {
		_Result = ((_Array select _i) select 1);
		_Result = [_Result] call A_encoding_fnc_decode_number;
	};
	_i = _i + 1;
};

_Result
