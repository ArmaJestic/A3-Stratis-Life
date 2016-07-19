// A_money_fnc_get_total_money

#include "../../includes/macro.h"


ARGV(0,_player);
if (not([_player] call A_player_fnc_human)) exitWith {0};

private["_fac_money", "_priv_money", "_bank_money", "_inv_money"];
_fac_money = [_player] call A_money_fnc_get_factory_money;
_priv_money = [_player] call A_money_fnc_get_private_storage_money;
_bank_money = [_player] call A_bank_fnc_get_value;

_inv_money = [_player] call A_money_fnc_get_inventory_money;
//player groupchat format["FSM: %1, PSM: %2, BM: %3, IM: %4", _fac_money, _priv_money, _bank_money, _inv_money];
_total_money = _fac_money + _priv_money + _bank_money + _inv_money;
_total_money
