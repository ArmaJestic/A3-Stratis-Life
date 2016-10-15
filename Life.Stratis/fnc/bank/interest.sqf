// A_bank_fnc_interest

#include "header.h"


private _bank_account = [player] call A_bank_fnc_get_value;
if (_bank_account > 0) then {
	private _interest = round(_bank_account*(BANK_INTEREST_PERCENT/100));
	[player, _interest] call A_bank_fnc_transaction;
	_bank_account = [player] call A_bank_fnc_get_value;
	player groupChat format [localize "STRS_bank_zinsen", strM(_bank_account), strM(BANK_INTEREST_PERCENT)];
};