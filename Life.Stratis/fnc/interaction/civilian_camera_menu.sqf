// A_interaction_fnc_civilian_camera_menu

#include "../../includes/macro.h"
#include "../../includes/constants.h"
#include "../../includes/dikcodes.h"

_this spawn {
if (!(createDialog "civcamdialog")) exitWith {hint "Dialog Error!";};

[1] call A_misc_fnc_DialogCivilianPlayersList;
lbSetCurSel    [1, 0];
sliderSetRange [2, 5, 30];
sliderSetSpeed [2, 1, 5];

while {ctrlVisible 1002} do {
	private["_seconds", "_cost"];
	_seconds =  round(sliderPosition 2);
	_cost = _seconds * A_interaction_var_civilian_camera_cost_per_second;
	ctrlSetText [3, strM(_cost)]; 
	ctrlSetText [5, str(_seconds)];
};
};
