// A_oil_derrick_fnc_barrel_setup

#include "..\..\includes\dikcodes.h"
#include "..\..\includes\macro.h"


ARGV(0,_barrel);
if (typeName _barrel != "OBJECT") exitWith {};

[_barrel, "isPumpBarrel", true, true] call A_object_fnc_setVariable;
[_barrel, "icon", "img\icons\crude_oil.paa", true] call A_object_fnc_setVariable;
[_barrel, "label_template", format["Crude Oil (%1 pumped)", "%1", "%"], true] call A_object_fnc_setVariable;
[_barrel, "draggable", false, true] call A_object_fnc_setVariable;
[_barrel, 0] call A_oil_derrick_fnc_barrel_update;
[_barrel, "item", "crudeoil", true] call A_object_fnc_setVariable;
A_oil_derrick_var_barrels = A_oil_derrick_var_barrels + [_barrel];
