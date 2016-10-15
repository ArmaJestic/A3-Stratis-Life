// A_convoy_fnc_side2string

#include "header.h"



ARGV(0,_side);

if (_side == east) exitWith {"Opfor"};
if (_side == west) exitWith {"Cop"};
if (_side == civilian) exitWith {"Civilian"};
if (_side == resistance) exitWith {"Insurgent"};
"Neither"
