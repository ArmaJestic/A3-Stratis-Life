// A_object_fnc_item_set_data

#include "..\..\includes\macro.h"


//player groupChat format["A_object_fnc_item_set_data %1", _this];
ARGV(0,_object);
ARGV(1,_item);
ARGV(2,_amount);
ARGV(3,_data);

if (UNDEFINED(_object)) exitWith {null};
if (UNDEFINED(_item)) exitWith {null};
if (UNDEFINED(_amount)) exitWith {null};
if (typeName _object != "OBJECT") exitWith {null};
if (typeName _item != "STRING") exitWith {null};
if (typeName _amount != "SCALAR") exitWith {null};


private["_name", "_type", "_class", "_label_template"];
_name = MASTER_ARRAY_ITEM_NAME(_item);
_type = MASTER_ARRAY_ITEM_TYPE(_item);
_class = typeOf _object;
_icon = [_item, _class, _type] call A_object_fnc_icon;

[_object, _item] call A_object_fnc_item_update_template;
[_object, "item", _item, true] call A_object_fnc_setVariable;
[_object, "name", _name, true] call A_object_fnc_setVariable;
[_object, "icon", _icon, true] call A_object_fnc_setVariable;
[_object, "type", _type, true] call A_object_fnc_setVariable;
[_object, _amount] call A_object_fnc_item_update_amount;

if (!(UNDEFINED(_data))) then {
	[_object, "data", _data, true] call A_object_fnc_setVariable;
};
