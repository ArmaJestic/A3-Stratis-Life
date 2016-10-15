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
		if (isNil "_array") then {
			_array = [];
		};
		
		missionNamespace setVariable[_variable, []];
		missionNamespace setVariable[_pv_s, []];
		missionNamespace setVariable[_pv_c, []];
		
		if (count _array > 0) then {
			private _vArr = missionNamespace getVariable[_variable,[]];
			private _pvArr = missionNamespace getVariable[_pv_s,[]];
			
			{
				_x = str(_x);
				_vArr pushBack _x;
				_pvArr pushBack _x;
			} forEach _array;
			
			// shouldn't need to missionNamespace setVariable for the arrays, should be pointing to them already
			missionNamespace setVariable[_variable,_vArr];
			missionNamespace setVariable[_pv_s,_pvArr];
		};
		
		publicVariable _pv_s;
	};
} forEach A_wbl_var_lists;