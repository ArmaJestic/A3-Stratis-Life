// A_stats_fnc_get_faction

#include "header.h"


params["_player"];

private _side = [_player] call A_stats_fnc_human_side;
if (_side == east) exitWith {"Opfor"};
if (_side == west) exitWith {"Cop"};
if (_side == civilian) exitWith {"Civilian"};
if (_side == resistance) exitWith {"Insurgent"};
""