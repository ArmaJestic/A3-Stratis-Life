// A_player_fnc_side_prefix

#include "../../includes/macro.h"


ARGV(0,_side);
if (undefined(_side)) exitWith {""};
if (typeName _side != "SIDE") exitWith {""};

if (_side == west) exitWith {"cop"};
if (_side == east) exitWith {"opf"};
if (_side == resistance) exitWith {"ins"};
if (_side == civilian) exitWith {"civ"};
""
