// A_bank_fnc_interest

#include "..\..\includes\macro.h"


private ["_bank_account", "_interest"];
_bank_account = [player] call A_bank_fnc_get_value;
if (_bank_account > 0) then {
	_interest = round(_bank_account*(A_bank_var_zinsen_prozent/100));
	[player, _interest] call A_bank_fnc_transaction;
	_bank_account = [player] call A_bank_fnc_get_value;
	player groupChat format [localize "STRS_bank_zinsen", strM(_bank_account), strM(A_bank_var_zinsen_prozent)];
};
