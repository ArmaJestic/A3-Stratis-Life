// A_towing_fnc_line_detach

#include "header.h"


//player groupChat format["A_towing_fnc_line_detach %1", _this];
ARGV(0,_this);
ARGV(0,_player);
ARGV(1,_vehicle);
ARGV(2,_endpoint_type);

if (UNDEFINED(_player)) exitWith {};
if (UNDEFINED(_vehicle)) exitWith {};
if (UNDEFINED(_endpoint_type)) exitWith {};

private["_towing_line"];
_towing_line = _vehicle getVariable ["towing_line", null];
if (UNDEFINED(_towing_line)) exitWith {};


[_towing_line, _endpoint_type] call A_towing_fnc_line_clear_endpoint;
[_towing_line, _endpoint_type, _player] call A_towing_fnc_line_setup_endpoint;
