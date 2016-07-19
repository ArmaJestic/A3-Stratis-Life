// A_inventory_fnc_get_license_name

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


private ["_c"];
for "_c" from 0 to (count A_license_var_INV_Licenses - 1) do {
	if (((A_license_var_INV_Licenses select _c) select 0) == _this) exitWith {
		((A_license_var_INV_Licenses select _c) select 2)
	};
};
