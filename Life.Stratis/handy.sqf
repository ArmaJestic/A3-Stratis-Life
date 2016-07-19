#include "includes\macro.h"

private["_action"];
_action = _this select 0;

if (_action == "use") then {
	call A_interaction_fnc_mobile_use;
};
