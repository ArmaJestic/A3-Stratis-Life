// A_money_fnc_lose_money

#include "..\..\includes\macro.h"


ARGV(0,_player);
ARGV(1,_amount);

if (!([_player] call A_player_fnc_human)) exitWith {null};
if (undefined(_amount)) exitWith {null};
if (typeName _amount != "SCALAR") exitWith {null};

_fac_money = [_player] call A_money_fnc_get_factory_money;
_priv_money = [_player] call A_money_fnc_get_private_storage_money;
_bank_money = [_player] call A_bank_fnc_get_value;
_inv_money = [_player] call A_money_fnc_get_inventory_money;

private["_lost_amount"];

/////////////////////////////////////////////
// Raid factories 
_lost_amount = (_fac_money) min (_amount);
[_player, _lost_amount] call A_money_fnc_lose_factory_money;
_amount = _amount - _lost_amount;
if (_amount <= 0) exitWith {null};

/////////////////////////////////////////////
// Raid private storage
_lost_amount = (_priv_money) min (_amount);
[_player, _lost_amount] call A_money_fnc_lose_private_storage_money;
_amount = _amount - _lost_amount;
if (_amount <= 0) exitWith {null};

/////////////////////////////////////////////
// Raid inventory
_lost_amount =  (_inv_money) min (_amount);
[_player, _lost_amount] call A_money_fnc_lose_inventory_money;
_amount = _amount - _lost_amount;
if (_amount <= 0) exitWith {null};

/////////////////////////////////////////////
// Raid bank (it can go negative, it's on purpose)
[_player, -(_amount)]  call A_bank_fnc_transaction;
