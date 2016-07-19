// A_doors_fnc_house_player_owner

#include "../../includes/constants.h"
#include "../../includes/macro.h"
#include "../../includes/dikcodes.h"


ARGV(0,_object);
ARGV(1,_player);
if (undefined(_player)) exitWith {};
if (undefined(_object)) exitWith {};

private["_puid", "_ouid"];
_puid = getPlayerUID _player;
_ouid = _object getVariable ["owner_uid", ""];

(_puid == _ouid)
