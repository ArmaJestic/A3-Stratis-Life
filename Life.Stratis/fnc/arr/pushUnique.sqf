// A_arr_fnc_pushUnique
// pushes given item (or items) onto array
// ensures item is not already in array first

#include "header.h"


params[["_arr",null,[[]]],["_args",null,[]]];
if UNDEFINED(_arr) exitwith {};
if UNDEFINED(_args) exitwith {};


if ((typeName _args) != "ARRAY") then {
	// turn into array
	_args = [_args];
};

{
	if !([_arr,_x] call A_arr_fnc_exists) then {
		_arr pushBack _x;
	};
	false;
} count _args;