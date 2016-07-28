// A_bombs_fnc_edit

#include "..\..\includes\macro.h"


private["_id", "_settings", "_i"];
_id       = (_this select 0);
_settings = (_this select 1);

for [{_i=0}, {_i < (count A_bombs_var_inv_serverbombarray)}, {_i=_i+1}] do {
	if (((A_bombs_var_inv_serverbombarray select _i) select 0) == _id) exitWith {
		(A_bombs_var_inv_serverbombarray select _i) set [4, _settings];
	};
};
