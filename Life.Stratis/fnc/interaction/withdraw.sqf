// A_interaction_fnc_withdraw

#include "header.h"

 
ARGV(0,_player);
ARGV(1,_amount);

if (!([_player] call A_player_fnc_human)) exitWith {null};
if (_player != player) exitWith {null};

if (UNDEFINED(_amount)) exitWith {null};
if (typeName _amount != "SCALAR") exitWith {null};
if (_amount <= 0) exitWith {null};

if ([_amount] call A_interaction_fnc_check_trx_minimum) exitWith {null};

private["_bank_amount"];
_bank_amount = [_player] call A_bank_fnc_get_value;

if (_amount > _bank_amount) exitWith {
	player groupChat format["You do not have enough money on your bank account to withdraw $%1", strM(_amount)];
};

[_player, -(_amount)] call A_bank_fnc_transaction;
[_player, 'money', (_amount)] call A_inventory_fnc_add_item;
player groupChat format["You have withdrawn $%1 from your bank account", strM(_amount)];
