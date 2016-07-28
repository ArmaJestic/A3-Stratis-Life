// A_item_fnc_lockpick

#include "..\..\includes\macro.h"


_art = _this select 0;

if (_art == "use") then {	
	[(_this select 1)] call A_vehicle_fnc_lockpick;
};
