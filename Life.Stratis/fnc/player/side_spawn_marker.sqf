// A_player_fnc_side_spawn_marker

#include "header.h"


params["_side"];

private["_default_respawn"];
_default_respawn = "respawn_civilian";
if (UNDEFINED(_side)) exitWith {_default_respawn};
if (typeName _side != "SIDE") exitWith {_default_respawn};

if (_side == west) exitWith {"respawn_west"};
if (_side == east) exitWith {"respawn_east"};
if (_side == resistance) exitWith {"respawn_guerrila"};
if (_side == civilian) exitWith {"respawn_civilian"};

_default_respawn