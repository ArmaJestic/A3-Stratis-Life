// A_stats_fnc_human_side

#include "header.h"


private _player = _this select 0;
if (UNDEFINED(_player)) exitWith {sideUnknown};
if (typeName _player != "OBJECT") exitWith {sideUnknown};
if (isNull _player) exitWith {sideUnknown};

private _player_str = toUpper(str(_player));
private _data = toArray _player_str;
private _ch1 = (_data select 1);
private _ch2 = (_data select 2);

// only works with the naming structure
// have to change when all players moved to/start as civ

// civ#
if ((_ch1 == ASCII_I) && {_ch2 == ASCII_V}) exitWith {civilian};
// cop#
if ((_ch1 == ASCII_O) && {_ch2 == ASCII_P}) exitWith {west};
// opf#
if ((_ch1 == ASCII_P) && {_ch2 == ASCII_F}) exitWith {east};
// ins#
if ((_ch1 == ASCII_N) && {_ch2 == ASCII_S}) exitWith {resistance};

sideUnknown