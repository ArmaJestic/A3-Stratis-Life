// A_wbl_fnc_refresh_r

#include "..\..\includes\macro.h"


private[ "_pvariable_name", "_pvariable_value", "_variable", "_pv_s", "_i"];

_pvariable_name 	= _this select 0;
_pvariable_value 	= _this select 1;

{
	_variable 	= _x select 1;
	_pv_s		= _x select 3;

	if (_pvariable_name == _pv_s) then {
		missionNamespace setVariable [_variable, []];
		_i = 0;
		for [{_i=0}, {_i < (count _pvariable_value)}, {_i=_i+1}] do {
			call compile format["%1 set[%2, ""%3""];", _variable, _i, _pvariable_value select _i];
		};
	};
} forEach A_wbl_var_lists;
