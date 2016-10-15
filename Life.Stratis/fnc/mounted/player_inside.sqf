// A_mounted_fnc_player_inside

#include "header.h"


//player groupChat format["Checking player inside"];
ARGV(0,_player);
ARGV(1,_vehicle);
if (UNDEFINED(_player)) exitWith {false};
if (UNDEFINED(_vehicle)) exitWith {false};

if (((vehicle _player) == _vehicle) && (_vehicle != _player)) exitWith {true};

private["_inMountedSlot"];
_inMountedSlot = [_player, "inMountedSlot"] call A_object_fnc_getVariable;
if (UNDEFINED(_inMountedSlot)) exitWith {false};
if (typeName _inMountedSlot != "BOOL") exitWith {false};
_inMountedSlot
