// A_inventory_fnc_get_script_from_class_weap

#include "header.h"


private ["_c", "_result"];
_result = "";
for "_c" from 0 to (count A_main_var_alllifemissionobjects - 1) do {
	if ((((A_main_var_inv_allweaponobjects select _c) select 2) select 0) == _this) exitWith {
		_result = ((A_main_var_inv_allweaponobjects select _c) select 0);
	};
};
_result
