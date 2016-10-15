// A_plant_fnc_update_yield

#include "header.h"


params[["_plant",null,[objNull]],["_amount",null]];
if (UNDEFINED(_plant)) exitWith {};
if (!([_plant, "isPlant", false] call A_object_fnc_getVariable)) exitWith {};
if (UNDEFINED(_amount)) exitWith {};

private _label_template = [_plant, "label_template", ""] call A_object_fnc_getVariable;
[_plant, "label", format[_label_template, _amount], true] call A_object_fnc_setVariable;
[_plant, "amount", _amount, true] call A_object_fnc_setVariable;