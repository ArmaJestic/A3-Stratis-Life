// A_isse_fnc_arr_delete

#include "..\..\includes\macro.h"

private["_arr", "_key", "_del", "_i"];
_arr = _this select 0;
_key = _this select 1;
for [{_i=0}, {_i <(count _arr)}, {_i=_i+1}] do {
	if ( ((_arr select _i) select 0) == _key ) exitWith {
		_arr SET [_i, ""];
		_arr = _arr - [""];
	};   
};
_arr