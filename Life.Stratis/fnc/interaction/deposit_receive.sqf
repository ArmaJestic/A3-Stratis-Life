// A_interaction_fnc_deposit_receive

#include "../../includes/macro.h"
#include "../../includes/constants.h"
#include "../../includes/dikcodes.h"


ARGV(0,_player);
ARGV(1,_sender);
ARGV(2,_amount);

if (not([_player] call A_player_fnc_human)) exitWith {null};
if (not([_sender] call A_player_fnc_human)) exitWith {null};
if (_player != player) exitWith {null};

if (undefined(_amount)) exitWith {null};
if (typeName _amount != "SCALAR") exitWith {null};
if (_amount <= 0) exitWith {null};

[_player, _amount] call A_bank_fnc_transaction;

player groupChat format["You received $%1 from %2-%3 on your bank account", strM(_amount), _sender, (name _sender)];
