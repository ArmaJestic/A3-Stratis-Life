// A_encoding_fnc_decode_number

#include "..\..\includes\macro.h"


params[["_value",null,[[]]]];

if (UNDEFINED(_value)) exitWith {0};

private _value_str = toString _value;
private _value_number = parseNumber(_value_str);
if UNDEFINED(_value_number) exitWith {0};
if (typeName _value_number != "SCALAR") exitWith {0};

_value_number