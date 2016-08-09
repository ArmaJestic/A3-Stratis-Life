// A_doors_fnc_doors_wait_display

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


private["_display"];
waitUntil {
	_display = findDisplay 46;
	!(isNil "_display" || {isNull _display})
};
_display
