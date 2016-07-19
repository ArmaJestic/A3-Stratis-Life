// A_encoding_fnc_encode_number

#include "..\..\includes\macro.h"


ARGV(0,_value);
if (undefined(_value)) exitWith { /*player groupChat "ERROR: A_encoding_fnc_encode_number: argument is nil"; toArray "0"*/ toArray "0" };
if (typeName _value != "SCALAR") exitWith { /*player groupChat "ERROR: A_encoding_fnc_encode_number: argument is not SCALAR";*/ toArray "0" };

toArray format["%1", _value];
