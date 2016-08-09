// A_towing_fnc_line_clear_endpoint

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_towing_line);
ARGV(1,_endpoint_type);

if (undefined(_towing_line)) exitWith {};
if (undefined(_endpoint_type)) exitWith {};
if (typeName _towing_line != "OBJECT") exitWith {};
if (isNull _towing_line) exitWith {};

private["_endpoint_object"];
_endpoint_object = _towing_line getVariable [format["%1", _endpoint_type], null];
if (!(undefined(_endpoint_object))) then {
	_endpoint_object setVariable ["towing_line", nil, true];
};

_towing_line setVariable [format["%1", _endpoint_type], nil, true];
_towing_line setVariable [format["%1_data", _endpoint_type], nil, true];
