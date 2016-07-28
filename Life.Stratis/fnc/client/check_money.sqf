// A_client_fnc_check_money

#include "..\..\includes\macro.h"


private ["_player", "_money"];
_player = player;

_money = [player, 'money'] call A_inventory_fnc_get_item_amount;
if (_money < 0) then {
	[_player, 'money', 0] call A_inventory_fnc_set_item_amount; 
	_money = 0;
};
	
if (_money > A_main_var_money_limit) then {
	[_player, 'money', A_main_var_money_limit] call A_inventory_fnc_set_item_amount; 
	player groupChat format["You can't carry more than $%1 in your inventory. Money was removed.", strM(A_main_var_money_limit)];
}; 
