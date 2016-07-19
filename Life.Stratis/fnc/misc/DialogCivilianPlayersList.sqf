// A_misc_fnc_DialogCivilianPlayersList

#include "../../includes/macro.h"

private["_control_id"];
_control_id = _this select 0;
([_control_id, true, false, false, false] call A_misc_fnc_DialogPlayerList)
