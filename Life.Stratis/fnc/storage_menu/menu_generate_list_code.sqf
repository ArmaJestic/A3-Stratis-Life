// A_storage_menu_fnc_menu_generate_list_code

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_object);
ARGV(1,_storage);

if (undefined(_object)) exitWith {{}};
if (undefined(_storage)) exitWith {{}};
if (typeName _object != "OBJECT") exitWith {{}};
if (typeName _storage != "STRING") exitWith {{}};

private["_code"];
_code = compile (format[
'
	_entries = [];
	{if (true) then {
		private["_entry", "_item", "_count", "_data"];
		_entry = _x;
		_item = _entry select 0;
		_count = [(_entry select 1)] call A_encoding_fnc_decode_number;
		_data  = _item call A_inventory_fnc_get_item_array;
		
		if (count(_data) == 0) exitWith {};
		private["_item_weight", "_name", "_droppable", "_loseable", "_class", "_icon"];
		_item_weight = ITEM_DATA_WEIGHT(_data);
		_name = (ITEM_DATA_NAME(_data));
		_droppable = (_data call A_inventory_fnc_get_item_droppable);
		_loseable = (_data call A_inventory_fnc_get_item_loseable);
		
		
		private["_picture", "_class", "_type"];
		_class = ITEM_DATA_CLASS(_data);
		_type = ITEM_DATA_TYPE(_data);
		_picture = [_item, _class, _type] call A_object_fnc_icon;
		
		//player groupChat ("_name = " + str(_name) + ", _loseable = " + str(_loseable));;
		if (_count > 0 && _droppable && _loseable) then {
			private["_text"];
			_text = _name + " (" + strM(_count) + " - " + str(_item_weight * _count ) + "Kg)";
			_entries = _entries + [[_text, _item, _picture]];	
		};
	};} forEach ([%1, "%2"] call A_object_fnc_getVariable);
	(_entries)
', _object, _storage]);

_code
