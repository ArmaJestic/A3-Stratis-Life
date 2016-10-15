// A_interaction_fnc_civilian_camera_menu

#include "header.h"

_this spawn {
if (!(createDialog "civcamdialog")) exitWith {hint "Dialog Error!";};

[1] call A_misc_fnc_DialogCivilianPlayersList;
lbSetCurSel    [1, 0];
sliderSetRange [2, 5, 30];
sliderSetSpeed [2, 1, 5];

while {ctrlVisible 1002} do {
	private["_seconds", "_cost"];
	_seconds =  round(sliderPosition 2);
	_cost = _seconds * INTERACT_CIV_CAM_COST_PER_SEC;
	ctrlSetText [3, strM(_cost)]; 
	ctrlSetText [5, str(_seconds)];
};
};