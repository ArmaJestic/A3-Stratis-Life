// A_stun_fnc_close_range

#include "..\..\includes\macro.h"


params["_unit"];

if ([_unit] call A_player_fnc_in_safe_zone) exitwith {};

private["_currentw"];
_currentw = [_unit] call A_gear_fnc_getCW_class;

private["_men", "_man"];
_men = nearestobjects [getpos _unit, ["CAManBase"], 3] - [_unit];
_man = _men select 0;

if (([_man] call A_object_fnc_shop) || {_man == bailflag}) exitWith {};
if (_unit in (list jail)) exitWith {};

if ((_currentw == "pistol") || {_currentw == "rifle"}) exitWith {
	[_unit, _man] spawn A_stun_fnc_pistol;
};
