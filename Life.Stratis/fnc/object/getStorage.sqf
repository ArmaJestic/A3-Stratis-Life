// A_object_fnc_getStorage

#include "../../includes/macro.h"


ARGV(0,_player);
if (undefined(_player)) exitWith {null};

private["_player_uid", "_storage_object"];
_player_uid = (getPlayerUID _player);
_storage_object = server getVariable [format["%1_storage", _player_uid], null];
if (undefined(_storage_object)) exitWith {null};
_storage_object
