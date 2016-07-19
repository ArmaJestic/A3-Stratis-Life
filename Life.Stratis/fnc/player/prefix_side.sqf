// A_player_fnc_prefix_side

#include "../../includes/macro.h"


ARGV(0,_prefix);
if (undefined(_prefix)) exitWith { sideUnknown };
if (typeName _prefix != "STRING") exitWith {sideUnknown};

_prefix = toLower(_prefix);
if (_prefix == "cop") exitWith {west};
if (_prefix == "opf") exitWith {east};
if (_prefix == "civ") exitWith {civilian};
if (_prefix == "ins") exitWith {resistance};

sideUnknown
