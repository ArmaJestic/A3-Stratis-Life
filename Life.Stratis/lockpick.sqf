#include "Awesome\Functions\macro.h"

_art = _this select 0;

if (_art == "use") then {	
	[(_this select 1)] call vehicle_lockpick;
};
