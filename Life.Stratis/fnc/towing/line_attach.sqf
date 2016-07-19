// A_towing_fnc_line_attach

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


//player groupChat format["A_towing_fnc_line_attach %1", _this];
ARGV(0,_this);
ARGV(0,_player);
ARGV(1,_vehicle);
ARGV(2,_endpoint_type);

if (undefined(_player)) exitWith {};
if (undefined(_vehicle)) exitWith {};
if (undefined(_endpoint_type)) exitWith {};

private["_towing_line"];
_towing_line = _player getVariable ["towing_line", null];
if (undefined(_towing_line)) exitWith {};

[_towing_line, _endpoint_type, _vehicle] call A_towing_fnc_line_setup_endpoint;
