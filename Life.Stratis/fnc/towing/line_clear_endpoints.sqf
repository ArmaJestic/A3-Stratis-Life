// A_towing_fnc_line_clear_endpoints

#include "header.h"


ARGV(0,_towing_line);
if (UNDEFINED(_towing_line)) exitWith {};
if (typeName _towing_line != "OBJECT") exitWith {};
if (isNull _towing_line) exitWith {};

[_towing_line, "towed"] call A_towing_fnc_line_clear_endpoint;
[_towing_line, "towing"] call A_towing_fnc_line_clear_endpoint;
