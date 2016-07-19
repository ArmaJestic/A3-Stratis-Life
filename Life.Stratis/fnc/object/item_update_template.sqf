// A_object_fnc_item_update_template

#include "../../includes/macro.h"


ARGV(0,_object);
ARGV(1,_item);

if (typeName _object != "OBJECT") exitWith {};
if (typeName _item != "STRING") exitWith {};

_name = MASTER_ARRAY_ITEM_NAME(_item);
private["_label_template", "_prefix"];
_prefix = if (_item == "money") then {"$"} else{""};
_label_template = format["%1 (%2)", _name, _prefix + "%1"];
[_object, "label_template", _label_template, true] call A_object_fnc_setVariable;
