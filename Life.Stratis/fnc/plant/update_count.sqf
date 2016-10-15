// A_plant_fnc_update_count

#include "header.h"


params[["_item",null,[""]],["_amount",null]];
if (UNDEFINED(_item)) exitWith {};
if (UNDEFINED(_amount)) exitWith {};

private _count_variable = format["%1_count", _item];
private _plant_count = server getVariable [_count_variable, 0];

_plant_count pushBack _amount;
server setVariable[_count_variable, _plant_count, true];