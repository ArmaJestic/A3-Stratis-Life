// A_inventory_fnc_get_license_name

#include "header.h"


private _name = null;
{
	if ((_x select LICENSE_INDEX_ID) == _this) exitwith {
		_name = (_x select LICENSE_INDEX_NAME);
	};
} forEach A_license_var_licenses;
_name