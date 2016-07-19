// A_misc_fnc_toLowerArray

#include "..\..\includes\macro.h"

private["_array"];
_array = _this select 0;
if (undefined(_array)) exitWith {[]};
if (typeName _array != "ARRAY") exitWith {[]};

private["_i"];
_i = 0;
while {_i < count(_array)} do {
	_array set [_i, toLower(_array select _i)];
	_i = _i + 1;
};

(_array)
