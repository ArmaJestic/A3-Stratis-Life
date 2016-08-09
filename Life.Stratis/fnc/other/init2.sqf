// A_other_fnc_init2

#include "..\..\includes\macro.h"

if (!isServer) then {
	[] call A_other_fnc_triggers;
	[] call A_other_fnc_briefing;
};