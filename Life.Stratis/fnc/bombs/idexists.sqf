// A_bombs_fnc_idexists

#include "..\..\includes\macro.h"


private["_result", "_i"];
_result = false;

for [{_i=0}, {_i < (count A_bombs_var_inv_serverbombarray)}, {_i=_i+1}] do {
	if (((A_bombs_var_inv_serverbombarray select _i) select 0) == _this) exitWith {_result = true;};
};
_result;
