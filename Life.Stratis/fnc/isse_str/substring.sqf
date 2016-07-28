// A_isse_str_fnc_substring

#include "..\..\includes\macro.h"


private["_arr", "_str", "_start", "_end", "_re", "_i"];

_str = _this select 0;
_start = _this select 1;
_end = _this select 2;
_arr = _str call A_isse_str_fnc_strtoarr;
_re = [];

if ((_end < 0) or (_start < 0)) then {
	_start = 0; _end = 0;
};

if ( (count _arr) <= _end) then {
	_end = ((count _arr)-1);
};

if ( (count _arr) <= _start) then {
	_start = ((count _arr)-1);
};

if (_end < _start) then {
	_start = _end;
};

for [{_i = _start}, {_i < _end}, {_i=_i+1}] do {
	_re = _re + [_arr select _i];
};

(_re call A_isse_str_fnc_arrtostr)
