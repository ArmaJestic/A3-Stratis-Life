// A_legislation_menu_fnc_menu_update_list

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


player groupChat format["A_legislation_menu_fnc_menu_update_list %1", _this];
private["_i", "_max_length"];
_i = 0;
_max_length = 50;
lbClear legislation_menu_list_idc;

while {_i < (count legislation_laws)} do {
	private["_law_text", "_index"];
	_law_text = legislation_laws select _i;
	if (([_law_text] call A_misc_fnc_strlen) > _max_length) then {
		_law_text = ([_law_text, 0, _max_length] call A_misc_fnc_substr) + "...";
	};
	_index = lbAdd [legislation_menu_list_idc, format["%1. %2", (_i + 1), _law_text]];
	lbSetData[legislation_menu_list_idc, _index, str(_i)];
	_i = _i + 1;
};
