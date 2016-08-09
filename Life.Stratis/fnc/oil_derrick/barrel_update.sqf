// A_oil_derrick_fnc_barrel_update

#include "..\..\includes\dikcodes.h"
#include "..\..\includes\macro.h"


//player groupChat format["A_oil_derrick_fnc_barrel_update %1", _this];
ARGV(0,_barrel);
ARGV(1,_amount);
if (undefined(_barrel)) exitWith {};
if (typeName _barrel != "OBJECT") exitWith {};
if (!([_barrel, "isPumpBarrel", false] call A_object_fnc_getVariable)) exitWith {};
if (undefined(_amount)) exitWith {};

private["_label_template"];
_label_template = [_barrel, "label_template", ""] call A_object_fnc_getVariable;
[_barrel, "label", format[_label_template, _amount], true] call A_object_fnc_setVariable;
[_barrel, "amount", _amount, true] call A_object_fnc_setVariable;
