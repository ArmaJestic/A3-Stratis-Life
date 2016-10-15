// A_inventory_fnc_set_storage_amount

#include "header.h"


//player groupChat format["A_inventory_fnc_set_storage_amount %1", _this];
ARGV(0,_object);
ARGV(1,_item_name);
ARGV(2,_amount);
ARGV(3,_array_name);

diag_log format['A_inventory_fnc_set_storage_amount: %1', _this];

[_object, _array_name] call A_inventory_fnc_check_array;

private["_found", "_array", "_i"];
_found = false;
_array = [_object, _array_name] call A_object_fnc_getVariable;
if !(UNDEFINED(_array)) then {
	_i = 0;
	while {_i < (count _array)} do {
		private _citem = ((_array select _i) select 0);
		if (_citem == _item_name) exitWith {
			(_array select _i) set [1, ([_amount] call A_encoding_fnc_encode_number)];
			_found = true;
		};
		_i = _i + 1;
	};

	[_object, _array_name, _array, true] call A_object_fnc_setVariable;

	if (_found || {_amount == 0}) exitWith {_found};
}else{
	diag_log format['%1 A_inventory_fnc_set_storage_amount: _array undefined', _this];
};

_found = [_object, _item_name, _amount, _array_name] call A_inventory_fnc_storage_add_item;
_found