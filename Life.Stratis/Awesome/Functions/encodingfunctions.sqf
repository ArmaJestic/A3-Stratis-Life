#include "macro.h"

if (!undefined(encoding_functions)) exitWith {null};

encode_number = {
	ARGV(0,_value);
	if (undefined(_value)) exitWith { /*player groupChat "ERROR: encode_number: argument is nil"; toArray "0"*/ toArray "0" };
	if (typeName _value != "SCALAR") exitWith { /*player groupChat "ERROR: encode_number: argument is not SCALAR";*/ toArray "0" };
	
	toArray format["%1", _value];
};

decode_number = {
	ARGV(0,_value);
	
	if (undefined(_value)) exitWith { /*player groupChat "ERROR: decode_number: argument is nil";*/ 0};
	if (typeName _value != "ARRAY") exitWith { /*player groupChat "ERROR: decode_number: argument is not ARRRAY";*/ 0};
	
	private["_value_str", "_value_number"];
	_value_str = toString _value;
	_value_number = parseNumber(_value_str);
	if ( undefined(_value_number) ) exitWith { /* player groupChat format["ERROR: decode_number: %1 is not a number", _value_str];*/ 0};
	if ( typeName _value_number != "SCALAR") exitWith { /* player groupChat format["ERROR: decode_number: %1 not parsable as SCALAR", _value_str];*/ 0};
	
	_value_number
};

encoding_functions = true;