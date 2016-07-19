// A_inventory_fnc_storage_add_item

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_object);
ARGV(1,_item);
ARGV(2,_quantity);
ARGV(3,_arrname);

[_object, _arrname] call A_inventory_fnc_check_array;

private["_arr", "_arraynum", "_number"];
_arr = [_object, _arrname] call A_object_fnc_getVariable;

_arraynum  = -1;
_number = 0;

//find the array that contains this item, and cleanup empty ones
private["_i"];
_i = 0;
while { _i < (count _arr) } do {
	private["_info", "_citem", "_count"];
	_info = _arr select _i;
	_citem = _info select 0;
	_count = [(_info select 1)] call A_encoding_fnc_decode_number;
	if ( _citem == _item) then {
		_arraynum = _i;
		_number = _count;
	};
	_i = _i + 1;
};

_quantity = _quantity + _number;
if (_quantity < 0) exitWith {false};

_arraynum = if (_arraynum < 0) then { count _arr} else { _arraynum };
_arr set [_arraynum, [_item, ([_quantity] call A_encoding_fnc_encode_number)]];
[_object, _arrname, _arr, true] call A_object_fnc_setVariable;
true
