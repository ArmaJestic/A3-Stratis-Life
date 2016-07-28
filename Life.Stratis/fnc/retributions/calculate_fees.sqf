// A_retributions_fnc_calculate_fees

#include "..\..\includes\macro.h"


private ["_damages", "_fees"];
_damages = _this select 0;
_fees = 0;

_all_money = [player] call A_money_fnc_get_total_money;
_p20 = ceil(_all_money * 0.2);
if (_p20 > _damages) then {
	_fees = _p20 - _damages;
};

_fees
