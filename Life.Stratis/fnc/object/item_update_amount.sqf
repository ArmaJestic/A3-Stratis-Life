// A_object_fnc_item_update_amount

#include "..\..\includes\macro.h"


//player groupChat format["A_object_fnc_item_update_amount %1", _this];
ARGV(0,_object);
ARGV(1,_amount);

if (typeName _object != "OBJECT") exitWith {};
if (UNDEFINED(_amount)) exitWith {};

private["_label_template"];
_label_template = [_object, "label_template", ""] call A_object_fnc_getVariable;
[_object, "label", format[_label_template, _amount], true] call A_object_fnc_setVariable;
[_object, "amount", ([_amount] call A_encoding_fnc_encode_number), true] call A_object_fnc_setVariable;
