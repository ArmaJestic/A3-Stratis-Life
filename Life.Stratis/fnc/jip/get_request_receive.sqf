// A_jip_fnc_get_request_receive

#include "../../includes/macro.h"
#include "../../includes/constants.h"

[format["A_jip_fnc_get_request_receive %1", _this]] call A_jip_fnc_message;

ARGV(0,_variable);
ARGV(1,_this);

ARGV(0,_object);
ARGV(1,_jip_variable);

if (undefined(_object)) exitWith {};
if (undefined(_jip_variable)) exitWith {};

private["_data"];
_data = missionNamespace getVariable [_jip_variable, null];
[_object, _jip_variable, _data] call A_jip_fnc_set;
