// A_towing_fnc_player_near

#include "header.h"


ARGV(0,_player);

private["_object"];
_object = cursorTarget;

if ((_object distance _player) > 10) exitWith {null};

private["_towing_class"];
_towing_class = typeOf _object;
if ((towing_classes find _towing_class) == -1) exitWith {null};

private["_towing_data"];
_towing_data = [_towing_class] call A_towing_fnc_data_lookup_class;
if (UNDEFINED(_towing_data)) exitWith {null};

private["_towing_hitch_offset", "_pos"];
_towing_hitch_offset = _towing_data select INDEX_TOWING_HITCH_OFFSET;

_pos = _object modelToWorld _towing_hitch_offset;
if ((_pos distance _player) > 3) exitWith {null};

(netId _object)
