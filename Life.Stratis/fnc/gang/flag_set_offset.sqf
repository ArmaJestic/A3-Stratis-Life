// A_gang_fnc_flag_set_offset

#include "header.h"


ARGV(0,_anchor);
ARGV(1,_amount);

if (UNDEFINED(_anchor)) exitWith {null};
if (typeName _anchor !="OBJECT") exitWith {null};
if (isNull _anchor) exitWith {null};
if (UNDEFINED(_amount)) exitWith {null};
if (typeName _amount != "SCALAR") exitWith {null};

private["_banner"];
_banner = [_anchor, "banner"] call A_object_fnc_getVariable;
[_banner, _amount] call A_flag_pole_fnc_move_flag;
[_anchor, "banner", _banner, true] call A_object_fnc_setVariable;
