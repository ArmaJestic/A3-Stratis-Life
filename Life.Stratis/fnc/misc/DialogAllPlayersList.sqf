// A_misc_fnc_DialogAllPlayersList

#include "../../includes/macro.h"

private["_control_id"];
_control_id = _this select 0;
([_control_id, true, true, true, true] call A_misc_fnc_DialogPlayerList)
