// A_interaction_fnc_check_trx_minimum

#include "header.h"


ARGV(0,_amount);
private["_minimum"];
_minimum = 10;
if (_amount < _minimum) exitWith {
	player groupChat format["THe minimum about for a bank transaction is $%1", strM(_minimum)];
	true
};
false
