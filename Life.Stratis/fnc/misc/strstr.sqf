// A_misc_fnc_strstr

#include "..\..\includes\macro.h"

private["_needle", "_haystack"];
_needle = _this select 0;
_haystack = _this select 1;

if (undefined(_needle)) exitWith {false};
if (undefined(_haystack)) exitWith {false};
if (typeName _needle != "STRING") exitWith {false};
if (typeName _haystack != "STRING") exitWith {false};

_needle_array = toArray _needle;
_haystack_array = toArray _haystack;

private["_i", "_j", "_k", "_matches", "_chr1", "_chr2"];
_i = 0;
_matches = false;

while { not(_matches) && _i < (count _haystack_array) } do {
	private["_haystack_char"];
	_k = _i;
	_j = 0;
	while { _j < (count _needle_array)  && _k < (count _haystack_array)} do {
		_chr1 = _needle_array select _j;
		_chr2 = _haystack_array select _k;
		if ( _chr1 != _chr2) exitWith {null};
		_j = _j + 1;
		_k = _k + 1;
	};
	_matches = (_chr1 == _chr2);	
	_i = _i + 1;
};

_matches 
