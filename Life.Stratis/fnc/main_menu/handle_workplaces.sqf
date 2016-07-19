// A_main_menu_fnc_handle_workplaces

#include "../../includes/macro.h"
#include "../../includes/constants.h"


ARGV(0,_title);
private["_list"];
_list = [toUpper(_title), 0.14, 0.14, 0.6, 0.7] call A_main_menu_fnc_right_setup;
lbClear (ctrlIDC _list);

private["_i"];
_i = 0;
while {_i < (count BuyAbleBuildingsArray)} do {
	private["_owned", "_owned_str"];
	_owned = ((BuyAbleBuildingsArray select _i) select 0) in BuildingsOwnerArray;
	_owned_str = if (_owned) then {"Owned"} else {"Available"};
	_list lbAdd (format ["%1 - (%2)", ((BuyAbleBuildingsArray select _i) select 1), _owned_str]);
	_i = _i + 1;
};
