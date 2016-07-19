// A_stun_fnc_close_range

#include "..\..\includes\macro.h"


player groupChat format["A_stun_fnc_close_range %1", _this];
ARGV(0,_unit);

private["_safe_distance"];
_safe_distance = 100;
if (_unit distance getMarkerpos "respawn_west" < _safe_distance) exitWith {};
if (_unit distance getMarkerpos "respawn_east" < _safe_distance) exitWith {};
if (_unit distance getMarkerpos "respawn_guerrila" < _safe_distance) exitWith {};
if (_unit distance getMarkerpos "respawn_civilian" < _safe_distance) exitWith {};

private["_currentw"];
_currentw = [_unit] call A_gear_fnc_getCW_class;

private["_men", "_man"];
_men = nearestobjects [getpos _unit, ["CAManBase"], 3] - [_unit];
_man = _men select 0;

if ((_man in A_farming_var_shopusearray) || (_man == bailflag)) exitWith {};
if (_unit in (list jail)) exitWith {};

if (_currentw == "pistol" || _currentw == "rifle") exitWith {
	[_unit, _man] spawn A_stun_fnc_pistol;
};
