// A_inventory_fnc_get_script_from_class_mag

#include "../../includes/constants.h"
#include "../../includes/macro.h"


private ["_c", "_result"];
_result = "";
for "_c" from 0 to (count AllLifeMissionObjects - 1) do {
	if ((((INV_AllMagazineObjects select _c) select 2) select 0) == _this) exitWith {
		_result = ((INV_AllMagazineObjects select _c) select 0);
	};
};
_result
