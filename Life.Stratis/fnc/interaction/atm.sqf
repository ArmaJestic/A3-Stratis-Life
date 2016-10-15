// A_interaction_fnc_atm

#include "header.h"


params[["_player",objNull,[objNull]],["_target",objNull,[objNull]]];
if ((isNull _player)||{isNull _target}) exitwith {false};

if !([_target] call A_object_fnc_atm) exitWith {false};

if(!A_bank_var_local_usebankpossible) exitWith {
	hint "The ATM rejected your card";
	false
};

call A_bank_menu_fnc_dialog;
true