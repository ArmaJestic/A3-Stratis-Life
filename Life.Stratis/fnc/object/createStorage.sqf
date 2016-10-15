// A_object_fnc_createStorage

#include "..\..\includes\macro.h"


ARGV(0,_player);
if (UNDEFINED(_player)) exitWith {null};

private["_storage_object", "_player_uid"];
_storage_object = "Sign_Sphere10cm_F" createVehicle [0,0,0];
_storage_object hideObject true;
[[_storage_object, true], "A_object_fnc_hide", _storage_object] call A_jip_fnc_register;
_player_uid = (getPlayerUID _player);
server setVariable[format["%1_storage", _player_uid], _storage_object, true];
_player setVariable["storage", _storage_object, true];
_storage_object setVariable["storage", _storage_object, true];
_storage_object