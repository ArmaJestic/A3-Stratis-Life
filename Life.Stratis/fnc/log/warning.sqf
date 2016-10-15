// A_log_fnc_warning

#include "header.h"


params[["_text",null,[""]]];
if (UNDEFINED(_text)) exitWith{};

_text = format["WARNING: %1%2", _text, toString[13,10]];
_text call A_log_fnc_log;