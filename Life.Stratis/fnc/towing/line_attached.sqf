// A_towing_fnc_line_attached

#include "header.h"


ARGV(0,_object);
ARGV(1,_endpoint_type);
if (UNDEFINED(_object)) exitWith {false};

private["_towing_line"];
_towing_line = _object getVariable ["towing_line", null];
if (UNDEFINED(_towing_line)) exitWith {false};

if (UNDEFINED(_endpoint_type)) exitWith {true};

private["_endpoint"];
_endpoint = _towing_line getVariable [_endpoint_type, null];
if (UNDEFINED(_endpoint)) exitWith {false};

(_endpoint == _object)
