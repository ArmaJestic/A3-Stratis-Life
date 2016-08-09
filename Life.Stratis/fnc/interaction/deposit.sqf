// A_interaction_fnc_deposit

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"


ARGV(0,_player);
ARGV(1,_target);
ARGV(2,_amount);

if (!([_player] call A_player_fnc_human)) exitWith {null};
if (!([_target] call A_player_fnc_human)) exitWith {null};

if (_player != player) exitWith {null};

if (undefined(_amount)) exitWith {null};
if (typeName _amount != "SCALAR") exitWith {null};
if (_amount <= 0) exitWith {null};

if ([_amount] call A_interaction_fnc_check_trx_minimum) exitWith {null};
	
if (_player == _target) exitWith {
	(_this call A_interaction_fnc_deposit_self)
};

(_this call A_interaction_fnc_deposit_other)	
