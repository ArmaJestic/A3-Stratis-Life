// A_towing_fnc_setup_towing_data

#include "header.h"


//player groupChat format["A_towing_fnc_setup_towing_data %1", _this];
ARGV(0,_vehicle);
if (UNDEFINED(_vehicle)) exitWith {};

private["_towing_line"];
_towing_line = _vehicle getVariable ["towing_line", null];
if (UNDEFINED(_towing_line)) exitWith {};

private["_towing_data", "_towed_data"];

towing = _towing_line getVariable ["towing", null];
towed = _towing_line getVariable ["towed", null];
if (towing == towed) exitWith {};
if (towing isKindOf "Man") exitWith {};

if (UNDEFINED(towing)) exitWith {};
if (UNDEFINED(towed)) exitWith {};


private["_towing_data", "_towed_data"];
_towing_data = _towing_line getVariable ["towing_data", null];
_towed_data = _towing_line getVariable ["towing_data", null];
if (UNDEFINED(_towing_data)) exitWith {};
if (UNDEFINED(_towed_data)) exitWith {};


towing_hitch_offset = _towing_data select INDEX_TOWING_HITCH_OFFSET;
towed_hitch_offset = _towed_data select INDEX_TOWED_HITCH_OFFSET;
towed_front_axle = _towed_data select INDEX_TOWED_FRONT_AXLE;
towed_back_axle = _towed_data select INDEX_TOWED_BACK_AXLE;

A_towing_var_loop_data_setup = true;
