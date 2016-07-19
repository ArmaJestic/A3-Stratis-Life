// A_towing_fnc_line_setup_endpoint

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_towing_line);
ARGV(1,_endpoint_type);
ARGV(2,_endpoint_object);

if (undefined(_towing_line)) exitWith {};
if (undefined(_endpoint_type)) exitWith {};
if (undefined(_endpoint_object)) exitWith {};
if (typeName _towing_line != "OBJECT") exitWith {};
if (isNull _towing_line) exitWith {};

private["_endpoint_data"];
_endpoint_data = [typeOf _endpoint_object] call A_towing_fnc_data_lookup_class;

_towing_line setVariable [format["%1", _endpoint_type], _endpoint_object, true];
_towing_line setVariable [format["%1_data", _endpoint_type], _endpoint_data, true];

_endpoint_object setVariable ["towing_line", _towing_line, true];
