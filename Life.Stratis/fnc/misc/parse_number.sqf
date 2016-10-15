// A_misc_fnc_parse_number

#include "..\..\includes\macro.h"

private ["_number"];
_number = _this select 0;
if (UNDEFINED(_number)) exitWith {0};
if (typeName _number == "SCALAR") exitWith {_number};
if (typeName _number != "STRING") exitWith {0};
_number = parseNumber(_number);
if (UNDEFINED(_number)) exitWith {0};
if (typeName _number != "SCALAR") exitWith {0};
_number
