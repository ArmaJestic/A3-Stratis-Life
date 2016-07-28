// A_wbl_fnc_gettype_name

#include "..\..\includes\macro.h"


private["_num", "_return"];

_num	= _this select 0;
_return = "";

switch _num do {
	case -1: {
		_return = "ERROR";
	};
	case 0: {
		_return = "ADMIN";
	};
	case 1: {
		_return = "DONATOR";
	};
	case 2: {
		_return = "PLAYER";
	};
};
	
_return
