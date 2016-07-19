// A_plant_fnc_get_count

#include "../../includes/macro.h"
#include "../../includes/constants.h"


ARGV(0,_item);
if (typeName _item != "STRING") exitWith {0};
private["_plant_count", "_count_variable"];
_count_variable = format["%1_count", _item];
(server getVariable [_count_variable, 0])
