// A_client_fnc_check_bank

#include "..\..\includes\macro.h"


private ["_bank_account", "_player"];
_player = player;
_bank_account = [_player] call A_bank_fnc_get_value;

if (_bank_account > A_main_var_bank_limit) exitWith {
	[_player, A_main_var_bank_limit] call A_bank_fnc_set_value; 
	player groupChat format["You can't have more than $%1 in your bank account. Money has been removed.", strM(A_main_var_bank_limit)];
};
