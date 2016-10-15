// A_doors_fnc_player_current_house

#include "header.h"


ARGV(0,_player);
if (UNDEFINED(_player)) exitWith {null};

private["_house_id"];
_house_id = [_player, "house_id", ""] call A_object_fnc_getVariable;

if (_house_id == "") exitWith {null};

private["_house"];
_house = objectFromNetId _house_id;

if (isNil "_house" || {(typeName _house != "OBJECT") || {isNull _house}}) exitWith {null};

_house
