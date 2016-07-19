// A_interaction_fnc_deposit_self

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"


ARGV(0,_player);
ARGV(1,_target);
ARGV(2,_amount);

if (not([_player] call A_player_fnc_human)) exitWith {null};
if (not([_target] call A_player_fnc_human)) exitWith {null};
if (_player != player) exitWith {null};

if (undefined(_amount)) exitWith {null};
if (typeName _amount != "SCALAR") exitWith {null};
if (_amount <= 0) exitWith {null};

if ([_amount] call A_interaction_fnc_check_trx_minimum) exitWith {null};

private["_money"];
_money = [player, 'money'] call A_inventory_fnc_get_item_amount;

if (_money < _amount) exitWith {
	player groupChat format["You do not have enough money in your inventory to deposit $%1", strM(_amount)];
};

player groupChat format["You have deposited $%1 into your bank account", strM(_amount)];
[_player, _amount] call A_bank_fnc_transaction;
[_player, 'money', -(_amount)] call A_inventory_fnc_add_item;
