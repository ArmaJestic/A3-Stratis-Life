// A_interaction_fnc_side_ai_class

#include "header.h"


ARGV(0,_side);
if (UNDEFINED(_side)) exitWith {""};
if (typeName _side != "SIDE") exitWith {""};

if (_side == west) exitWith {"UN_CDF_Soldier_EP1"};
if (_side == east) exitWith {"TK_Soldier_EP1"};
if (_side == resistance) exitWith {"TK_GUE_Soldier_EP1"};
""
