// A_plant_fnc_update_yield

#include "../../includes/macro.h"
#include "../../includes/constants.h"


ARGV(0,_plant);
ARGV(1,_amount);
if (undefined(_plant)) exitWith {};
if (typeName _plant != "OBJECT") exitWith {};
if (not([_plant, "isPlant", false] call A_object_fnc_getVariable)) exitWith {};
if (undefined(_amount)) exitWith {};

private["_label_template"];
_label_template = [_plant, "label_template", ""] call A_object_fnc_getVariable;
[_plant, "label", format[_label_template, _amount], true] call A_object_fnc_setVariable;
[_plant, "amount", _amount, true] call A_object_fnc_setVariable;
