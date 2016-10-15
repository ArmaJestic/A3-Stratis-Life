// A_plant_fnc_get_count

#include "header.h"


params[["_item",null,[""]]];
if (typeName _item != "STRING") exitWith {0};

private _count_variable = format["%1_count", _item];
(server getVariable [_count_variable, 0])