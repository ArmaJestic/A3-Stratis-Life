// A_inventory_fnc_storage_remove_kind

#include "header.h"


ARGV(0,_object);
ARGV(1,_Arrayname);
ARGV(2,_Itemart);

[_object, _Arrayname] call A_inventory_fnc_check_array;

private["_Array", "_i"];
_Array = [_object, _Arrayname] call A_object_fnc_getVariable;

_i = 0;
while { _i < (count _Array) } do {
	private["_citem"];
	_citem = ((_Array select _i) select 0);
	if ( (_citem call A_inventory_fnc_get_item_kind)  == _Itemart) then {
		(_Array select _i) set [1, 0];
	};
	_i = _i + 1;
};

[_object, _Arrayname, _Array, true] call A_object_fnc_setVariable;
true
