// A_main_menu_fnc_handle_licenes

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


ARGV(0,_title);
private["_list"];
_list = [toUpper(_title), 0.14, 0.14, 0.6, 0.7] call A_main_menu_fnc_right_setup;
lbClear (ctrlIDC _list);

private["_i"];
_i = 0;
while {_i < (count A_license_var_INV_Licenses)} do {
	if (((A_license_var_INV_Licenses select _i) select 0) call A_inventory_fnc_has_license) then {
		_list lbAdd (((A_license_var_INV_Licenses select _i) select 2));
	};
	_i = _i + 1;
};
