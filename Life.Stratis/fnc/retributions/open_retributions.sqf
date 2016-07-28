// A_retributions_fnc_open_retributions

#include "..\..\includes\macro.h"


if (dialog) exitWith { closeDialog 0; };
_ok = createDialog "Retribution";
if (not(_ok)) then { 
	player groupChat "Unable to open the retributions dialog";
};

[] call A_retributions_fnc_fill_retributions;	
