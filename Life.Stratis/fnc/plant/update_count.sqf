// A_plant_fnc_update_count

#include "../../includes/macro.h"
#include "../../includes/constants.h"


ARGV(0,_item);
ARGV(1,_amount);
if (typeName _item != "STRING") exitWith {};
if (undefined(_amount)) exitWith {};

private["_plant_count", "_count_variable"];
_count_variable = format["%1_count", _item];
_plant_count = server getVariable [_count_variable, 0];

_plant_count = _plant_count + _amount;
server setVariable [_count_variable, _plant_count, true];
