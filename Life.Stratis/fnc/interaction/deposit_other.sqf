// A_interaction_fnc_deposit_other

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


private["_player_variable", "_player_variable_name", "_bank_amount"];
private["_tax_fee", "_total_due", "_bank_tax"];
_bank_tax = ["Bank"] call A_economy_menu_fnc_lookup_tax_value_type;
_tax_fee = round(_amount * (_bank_tax/100));	
_total_due = _tax_fee + _amount;
_bank_amount = [_player] call A_bank_fnc_get_value;

if (_bank_amount < _total_due) exitWith {
	player groupChat format["You do not have enough money in your account to send $%1, with tax fee $%2", strM(_amount), strM(_tax_fee)];
};

[_player, -(_total_due)] call A_bank_fnc_transaction;
[_tax_fee] call shop_update_taxes;

player groupChat format["You have sent $%1 to %2-%3, your tax fee was $%4", strM(_amount), _target, (name _target), strM(_tax_fee)];
format['[%1, %2, %3] call A_interaction_fnc_deposit_receive;', _target, _player, strN(_amount)] call broadcast;
