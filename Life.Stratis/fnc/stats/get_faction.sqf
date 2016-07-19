// A_stats_fnc_get_faction

#include "../../includes/macro.h"

private ["_player"];
_player = _this select 0;
private["_side"];
_side = [_player] call A_stats_fnc_human_side;
if (_side == east) exitWith {"Opfor"};
if (_side == west) exitWith {"Cop"};
if (_side == civilian) exitWith {"Civilian"};
if (_side == resistance) exitWith {"Insurgent"};
""
