// A_isse_fnc_arr_keys

#include "..\..\includes\macro.h"


private["_result", "_i"];
_result = [];
for [{_i=0}, {_i < (count _this)}, {_i=_i+1}] do {
	_result = _result + [ ((_this select _i) select 0)];
};
_result