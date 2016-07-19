// A_gang_fnc_recreate_group

#include "../../includes/macro.h"


ARGV(0,_side);
ARGV(1,_group);
if (undefined(_side)) exitWith {grpNull};
if (typeName _side != "SIDE") exitWith {grpNull};

_group = if (undefined(_group)) then {grpNull} else {_group};
_group = if (typeName _group != "GROUP") then {grpNull} else {_group};

private["_original_group"];
_original_group = _group;
_group = if (isNull _group) then {createGroup _side} else {_group};

player groupChat format["_original_group = %1, _group = %2", _original_group, _group];

(_group)
