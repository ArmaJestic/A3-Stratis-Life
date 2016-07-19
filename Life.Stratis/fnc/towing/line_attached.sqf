// A_towing_fnc_line_attached

#include "../../includes/constants.h"
#include "../../includes/macro.h"


ARGV(0,_object);
ARGV(1,_endpoint_type);
if (undefined(_object)) exitWith {false};

private["_towing_line"];
_towing_line = _object getVariable ["towing_line", null];
if (undefined(_towing_line)) exitWith {false};

if (undefined(_endpoint_type)) exitWith {true};

private["_endpoint"];
_endpoint = _towing_line getVariable [_endpoint_type, null];
if (undefined(_endpoint)) exitWith {false};

(_endpoint == _object)
