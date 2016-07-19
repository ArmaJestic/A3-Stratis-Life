// A_stats_fnc_init_variable

#include "..\..\includes\macro.h"

private["_variable", "_value"];
_variable = _this select 0;
_value = _this select 1;
[player, _variable, _value] call A_stats_fnc_init_entry;
