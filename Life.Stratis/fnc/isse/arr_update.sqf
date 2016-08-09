// A_isse_fnc_arr_update

#include "..\..\includes\macro.h"

private["_arr", "_key", "_val", "_upd", "_i"];
_arr = _this select 0;
_key = _this select 1;
_val = _this select 2;
_upd = false;
for [{_i=0}, {_i < (count _arr)}, {_i=_i+1}] do {
	if ( ((_arr select _i) select 0) == _key ) exitWith {
		(_arr select _i) SET [1, _val];
		_upd = true;
		
	};
};
if (!_upd) then {
	_arr = _arr + [ [_key, _val] ];
	
};
_arr