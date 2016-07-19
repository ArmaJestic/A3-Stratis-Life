// A_misc_fnc_DialogNotCopsList

#include "..\..\includes\macro.h"

private["_control_id"];
_control_id = _this select 0;
([_control_id, true, false, true, true] call A_misc_fnc_DialogPlayerList)
