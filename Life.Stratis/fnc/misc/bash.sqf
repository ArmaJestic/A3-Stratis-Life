// A_misc_fnc_bash

#include "..\..\includes\macro.h"


private _damage = damage player;
[player, 10, 0] call A_misc_fnc_setPitchBank;
sleep 0.01;
[player, -5, 0] call A_misc_fnc_setPitchBank;

"dynamicBlur" ppEffectEnable true;
"dynamicBlur" ppEffectAdjust [10];
"dynamicBlur" ppEffectCommit 0;
waitUntil {ppEffectCommitted "dynamicBlur"};
"dynamicBlur" ppEffectEnable true;
"dynamicBlur" ppEffectAdjust [0];
"dynamicBlur" ppEffectCommit (0.4 + _damage);
waitUntil {ppEffectCommitted "dynamicBlur"};