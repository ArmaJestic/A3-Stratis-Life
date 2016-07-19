// A_towing_fnc_setup_towing_data

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


//player groupChat format["A_towing_fnc_setup_towing_data %1", _this];
ARGV(0,_vehicle);
if (undefined(_vehicle)) exitWith {};

private["_towing_line"];
_towing_line = _vehicle getVariable ["towing_line", null];
if (undefined(_towing_line)) exitWith {};

private["_towing_data", "_towed_data"];

towing = _towing_line getVariable ["towing", null];
towed = _towing_line getVariable ["towed", null];
if (towing == towed) exitWith {};
if (towing isKindOf "Man") exitWith {};

if (undefined(towing)) exitWith {};
if (undefined(towed)) exitWith {};


private["_towing_data", "_towed_data"];
_towing_data = _towing_line getVariable ["towing_data", null];
_towed_data = _towing_line getVariable ["towing_data", null];
if (undefined(_towing_data)) exitWith {};
if (undefined(_towed_data)) exitWith {};


towing_hitch_offset = _towing_data select A_towing_var_data_towing_hitch_offset;
towed_hitch_offset = _towed_data select A_towing_var_data_towed_hitch_offset;
towed_front_axle = _towed_data select A_towing_var_data_towed_front_axle;
towed_back_axle = _towed_data select A_towing_var_data_towed_back_axle;

A_towing_var_loop_data_setup = true;
