// A_player_fnc_vulnerable

#include "header.h"


ARGV(0,_player);
if (UNDEFINED(_player)) exitWith { false };

_state  = animationState _player;
 
//player groupChat format["_state = %1", _state];
if (toLower(_state) in ([A_player_var_vulnerable_states] call A_misc_fnc_toLowerArray)) exitWith { true };

private["_stunned", "_restrained"];
_stunned = [_player, "stunned"] call A_player_fnc_get_bool;
_restrained = [_player, "restrained"] call A_player_fnc_get_bool;
(_stunned || _restrained)
