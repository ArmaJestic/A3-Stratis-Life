// A_pos_fnc_is_prone

#include "..\..\includes\macro.h"


ARGV(0,_unit);
if (UNDEFINED(_unit)) exitWith {false};
private["_stance"];
_stance = toLower(stance _unit);
private["_prone_stances"];
_prone_stances = ["prone", "lying"];
((_prone_stances find _stance) >= 0)
