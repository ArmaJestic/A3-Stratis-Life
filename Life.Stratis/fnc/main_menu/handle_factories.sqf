// A_main_menu_fnc_handle_factories

#include "../../includes/macro.h"
#include "../../includes/constants.h"


ARGV(0,_title);
private["_list"];
_list = [toUpper(_title), 0.14, 0.14, 0.6, 0.7] call A_main_menu_fnc_right_setup;
lbClear (ctrlIDC _list);

private["_i"];
_i = 0;
while {_i <  (count all_factories)} do {
	if (((all_factories select _i) select 1) in INV_Fabrikowner) then {
		private["_workers"];
		_workers = missionNamespace getVariable [format["%1workers",((all_factories select _i) select 8)], 0];
		_list lbAdd format['%1: %2 workers', ((all_factories select _i) select 2), _workers];
	};
	_i = _i + 1;
};
