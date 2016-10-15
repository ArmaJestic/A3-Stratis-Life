// A_admin_menu_fnc_logAdmin

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


params[["_text",null,[""]]];
if (UNDEFINED(_text)) exitWith {null};

private _player = player;

_text = (format["ADMIN (%1, %2): ", (name _player), (getPlayerUID _player)] + _text + toString[13,10]);
_text call A_log_fnc_log;