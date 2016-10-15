// A_player_fnc_unsurrender_animation

#include "header.h"


player groupChat format["A_player_fnc_unsurrender_animation %1", _this];
ARGV(0,_player);
if (!([_player] call A_player_fnc_exists)) exitWith {};
_player playMoveNow "AmovPercMstpSnonWnonDnon";
