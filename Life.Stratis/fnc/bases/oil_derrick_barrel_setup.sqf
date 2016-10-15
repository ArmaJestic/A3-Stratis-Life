// A_bases_fnc_oil_derrick_barrel_setup

#include "header.h"


params[["_barrel",objNull,[objNull]]];
if (isNull _barrel) exitwith {};

[_barrel, "isPumpBarrel", true, true] call A_object_fnc_setVariable;
[_barrel, "icon", "img\icons\crude_oil.paa", true] call A_object_fnc_setVariable;
[_barrel, "label_template", format["Crude Oil (%1 pumped)", "%1", "%"], true] call A_object_fnc_setVariable;
[_barrel, "draggable", false, true] call A_object_fnc_setVariable;
[_barrel, 0] call A_bases_fnc_oil_derrick_barrel_update;
[_barrel, "item", "crudeoil", true] call A_object_fnc_setVariable;

A_bases_var_oil_derrick_barrels pushBack _barrel;