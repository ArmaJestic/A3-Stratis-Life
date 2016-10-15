// A_gear_fnc_getClass

#include "header.h"


ARGV(0,_class);
if ([_class] call A_gear_fnc_isPistol_class) exitWith { "pistol" };
if ([_class] call A_gear_fnc_isRifle_class) exitWith { "rifle" };
if ([_class] call A_gear_fnc_isMG_class) exitWith { "MG" };
if ([_class] call A_gear_fnc_isLauncher_class) exitWith { "launcher" };
if ([_class] call A_gear_fnc_isThrow_class) exitWith { "throw" };
if ([_class] call A_gear_fnc_isPut_class) exitWith { "put" };
"none"
