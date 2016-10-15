// A_doors_fnc_house_player_owner

#include "header.h"


ARGV(0,_object);
ARGV(1,_player);
if (UNDEFINED(_player)) exitWith {};
if (UNDEFINED(_object)) exitWith {};

private["_puid", "_ouid"];
_puid = getPlayerUID _player;
_ouid = _object getVariable ["owner_uid", ""];

(_puid == _ouid)
