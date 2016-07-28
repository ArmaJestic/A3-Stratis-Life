// A_wbl_fnc_r

#include "..\..\includes\macro.h"


private["_name", "_value", "_section"];

_name = _this select 0;
_value = (_this select 1);

{
	if ((_x select 4) == _name) then {
	
			_section	= _x select 0;

			[_section, _value] call A_wbl_fnc_save;
		};		
} forEach A_wbl_var_lists;
