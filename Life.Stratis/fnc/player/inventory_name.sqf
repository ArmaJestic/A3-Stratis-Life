// A_player_fnc_inventory_name

#include "..\..\includes\macro.h"


ARGV(0,_player);
if (not([_player] call A_player_fnc_exists)) exitWith {""};
private["_player_name"];
_player_name = vehicleVarName _player;
private["_side"];
_side = ([_player] call A_player_fnc_side);
_side = toLower(str(_side));
(format["inventory_%1", _side])
