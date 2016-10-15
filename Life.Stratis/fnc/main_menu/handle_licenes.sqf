// A_main_menu_fnc_handle_licenes

#include "header.h"


params["_title"];
private _list = [toUpper(_title), 0.14, 0.14, 0.6, 0.7] call A_main_menu_fnc_right_setup;
lbClear (ctrlIDC _list);

{
	if ((_x select LICENSE_INDEX_ID) call A_inventory_fnc_has_license) then {
		_list lbAdd (_x select LICENSE_INDEX_NAME);
	};
} forEach A_license_var_licenses;