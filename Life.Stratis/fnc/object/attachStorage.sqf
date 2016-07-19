// A_object_fnc_attachStorage

#include "../../includes/macro.h"


ARGV(0,_player);
private["_storage_object"];
_storage_object = [_player] call A_object_fnc_getStorage;
//player groupChat format["_storage_object = %1", _storage_object];
if (undefined(_storage_object)) exitWith {null};
_storage_object attachTo [_player, [0,0,0]];
_player setVariable ["storage", _storage_object, true];
