// A_misc_fnc_strlen

#include "..\..\includes\macro.h"

private["_text"];
_text = _this select 0;
if (UNDEFINED(_text)) exitWith {0};
if (typeName _text != "STRING") exitWith {null};
(count (toArray _text))