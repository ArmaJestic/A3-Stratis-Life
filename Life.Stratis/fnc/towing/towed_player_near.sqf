// A_towing_fnc_towed_player_near

#include "../../includes/constants.h"
#include "../../includes/macro.h"


ARGV(0,_player);

private["_object"];
_object = cursorTarget;

if ((_object distance _player) > 10) exitWith {null};

private["_towed_class"];
_towed_class = typeOf _object;
if ((towed_classes find _towed_class) == -1) exitWith {null};

private["_towed_data"];
_towed_data = [_towed_class] call A_towing_fnc_data_lookup_class;
if (undefined(_towed_data)) exitWith {null};

private["_towed_hitch_offset", "_pos"];
_towed_hitch_offset = _towed_data select A_towing_var_data_towed_hitch_offset;

_pos = _object modelToWorld _towed_hitch_offset;
if ((_pos distance _player) > 3) exitWith {null};

(netId _object)
