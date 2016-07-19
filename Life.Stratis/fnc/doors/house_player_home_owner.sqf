// A_doors_fnc_house_player_home_owner

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


ARGV(0,_player);
if (undefined(_player)) exitWith {false};
private["_house_id"];
_house_id = [_player, "house_id", null] call A_object_fnc_getVariable;
//player groupChat format["_house_id = %1", _this];
if (undefined(_house_id)) exitWith {false};
true
