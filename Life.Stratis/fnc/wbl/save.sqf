// A_wbl_fnc_save

#include "..\..\includes\macro.h"


private["_section_change", "_section_value", "_section", "_file", "_array", "_value", "_change", "_i"];

_section_change		= _this select 0;
_section_value		= _this select 1;

_section = "";
_file = "";

{
	_section	= _x select 0;
	_file		= _x select 2;

	if (_section == _section_change) then {
		_array = [];
		_array = _section_value;
		_change = [];

		for [{_i = 0}, {_i < (count _array)}, {_i = _i + 1}] do {
			if ((_array select _i) == "1337") then {
				_change set[(count _change), _i];
			};
		};

		{
			_array = _array - ["1337"];
		} forEach _change;

		"stdio" callExtension format["write(%1)%2", _file, "[""1337""]"];

		{
			_value = _x;
			"stdio" callExtension (format["append(%1) +%2", _file, toString [10]] + format["%1",[_value]]);
		} forEach _array;
	};
} forEach A_wbl_var_lists;
