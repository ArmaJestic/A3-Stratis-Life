// A_wbl_fnc_load_s

#include "..\..\includes\macro.h"


private["_variable", "_file", "_pv_s", "_pv_c", "_list_name", "_i", "_true", "_text", "_array", "_out"];

_list_name 	= _this select 0;

{
	if ((_x select 0) == _list_name) then {
		_variable 	= _x select 1;
		_file		= _x select 2;
		_pv_s		= _x select 3;
		_pv_c		= _x select 4;
			
		_i = 0;
		_true = true;
		_text = "";
		_array = [];
	
		_out = "stdio" callExtension format["read(%1,%2)", _file, _i];

		while {_true} do {
			_text = _text + _out;
			_i = _i + 1;
			_out = "stdio" callExtension format["read(%1,%2)", _file, _i];
			if (_out == "") then {_true = false};
		};
			
		_array = call compile _text;
		
		missionNamespace setVariable [_variable, []];
		missionNamespace setVariable [_pv_s, []];
		missionNamespace setVariable [_pv_c, []];
					
		_i = 0;
		for [{_i=0}, {_i < (count _array)}, {_i=_i+1}] do {
			call compile format["%1 set[%2, ""%3""];", _variable, _i, _array select _i];
			call compile format["%1 set[%2, ""%3""];", _pv_s, _i, _array select _i];
		};
		publicVariable _pv_s;
	};
} forEach A_wbl_var_lists;
