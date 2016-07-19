// A_interaction_fnc_warrants_menu

#include "../../includes/macro.h"
#include "../../includes/constants.h"
#include "../../includes/dikcodes.h"

 _this spawn {
if (!(createDialog "wantedrelease")) exitWith {hint "Dialog Error!";};
[1] call A_misc_fnc_DialogNotCopsList;
lbSetCurSel [1, 0];
[11] call A_misc_fnc_DialogNotCopsList;
lbSetCurSel [11, 0];
};
