// A_inventory_fnc_get_storage_weight

#include "../../includes/constants.h"
#include "../../includes/macro.h"


//player groupChat format["A_inventory_fnc_get_storage_weight %1", _this];
ARGV(0,_object);
ARGV(1,_Arrayname);

[_object, _Arrayname] call A_inventory_fnc_check_array;

private["_weight"];
_weight = 0;

{if (true) then {
	private["_entry", "_item", "_count", "_infos", "_item_weight"];
	_entry = _x;
	_item = _entry select 0;
	_count = [(_entry select 1)] call A_encoding_fnc_decode_number;
	_infos  = _item call A_inventory_fnc_get_item_array;
	
	if (undefined(_infos) || {typeName _infos != "ARRAY" || {count(_infos) == 0}}) exitWith {};
	
	_item_weight = ITEM_DATA_WEIGHT(_infos);
	_weight = _weight + (_count) * (_item_weight);
}} forEach ([_object, _Arrayname] call A_object_fnc_getVariable);

_weight
