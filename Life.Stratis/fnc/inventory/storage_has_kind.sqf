// A_inventory_fnc_storage_has_kind

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_object);
ARGV(1,_Arrayname);
ARGV(2,_Itemart);

[_object, _Arrayname] call A_inventory_fnc_check_array;
private["_Array", "_i", "_re"];
_re = false;
_Array = [_object, _Arrayname] call A_object_fnc_getVariable;
_i = 0;
while { _i < (count _Array) } do {
	private["_citem", "_count"];
	_citem = ((_Array select _i) select 0);
	_count = ([((_Array select _i) select 1)] call A_encoding_fnc_decode_number);
	if (((_citem call A_inventory_fnc_get_item_kind) == _Itemart) and (_count > 0)) exitWith {
		_re = true;
	};
	_i = _i + 1;
};
_re
