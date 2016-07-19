// A_admin_menu_fnc_logAdmin

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


ARGV(0,_text);
if (undefined(_text)) exitWith {null};
if (typeName _text != "STRING") exitWith {null};

private["_player"];
_player = player;

_text = (format["ADMIN (%1, %2): ", (name _player), (getPlayerUID _player)] + _text + toString [13,10]);
[_text] call A_invokeJava_fnc_logThis;
