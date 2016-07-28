// A_wbl_fnc_gettype_num

#include "..\..\includes\macro.h"


private["_uid", "_return"];

_uid	= _this select 0;
_return = -1;

if (_uid in A_wbl_var_a_list_admins) then {
		_return = 0;
} else { if (_uid in A_wbl_var_a_list_donators) then {
		_return = 1;
} else {
	_return = 2;
};};
	
_return
