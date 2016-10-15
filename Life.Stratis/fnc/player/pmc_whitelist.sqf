// A_player_fnc_pmc_whitelist

#include "header.h"


ARGV(0,_player);

if (UNDEFINED(_player)) exitWith {null};

private["_uid"];
_uid = getPlayerUID _player;

if (UNDEFINED(_uid)) exitWith {false};
if (typeName _uid != "STRING") exitWith {false};
if (_uid == "") exitWith {false};

["pmc_whitelist", _uid] call A_list_fnc_contains_key;
