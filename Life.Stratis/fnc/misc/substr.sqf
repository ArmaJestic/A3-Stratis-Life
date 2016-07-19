// A_misc_fnc_substr

#include "..\..\includes\macro.h"

private["_string", "_start", "_length"];
_string = _this select 0;
_start = _this select 1;
_length = _this select 2;

if (undefined(_string)) exitWith {""};
if (undefined(_start)) exitWith {""};

if (typeName _string != "STRING") exitWith {""};
if (typeName _start != "SCALAR") exitWith {""};


private["_string_data", "_string_out_data"];
_string_data = toArray _string;
_string_out_data = [];

if (undefined(_length)) then {
	_length = count(_string_data) - _start;
};

private["_i", "_count"];
_i = _start;
_count = 0;
while {(_i < (count _string_data)) && (_count < _length)} do {
	_string_out_data set [_count, (_string_data select _i)];
	_count = _count + 1;
	_i = _i + 1;
};

(toString _string_out_data)
