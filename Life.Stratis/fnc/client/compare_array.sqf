// A_client_fnc_compare_array

#include "..\..\includes\macro.h"


ARGV(0,_a);
ARGV(1,_b);
if (UNDEFINED(_a)) exitWith { false };
if (UNDEFINED(_b)) exitWith { false };
if (typeName _a != "ARRAY") exitWith {false};
if (typeName _b != "ARRAY") exitWith {false};
if (count _a != count _b) exitWith {false};

private["_i"];
_i = (count _a) - 1;
while {_i >= 0} do {
	if (str(_a select _i) != str(_b select _i)) exitWith { false };
	_i = _i - 1;
};

(_i == -1)
