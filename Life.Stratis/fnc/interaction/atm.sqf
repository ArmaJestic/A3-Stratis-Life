// A_interaction_fnc_atm

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"


ARGV(0,_player);
ARGV(1,_target);

if (undefined(_player)) exitWith {false};
if (undefined(_target)) exitWith {false};

if (not([_target] call A_object_fnc_atm)) exitWith {};

if(!A_bank_var_local_usebankpossible) exitWith {
	hint "The ATM rejected your card";
	false
};

call A_bank_menu_fnc_dialog;
true
