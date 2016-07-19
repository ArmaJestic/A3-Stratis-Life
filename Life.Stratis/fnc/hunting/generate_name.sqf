// A_hunting_fnc_generate_name

#include "..\..\includes\macro.h"


ARGV(0,_base);
_base = if (undefined(_base)) then {"generated"} else {_base};

private["_restart_count", "_name"];
_restart_count = server getVariable "restart_count";
_name = format["%1_%2_%3_%4", _base, "server", _restart_count, round(time)];
_name
