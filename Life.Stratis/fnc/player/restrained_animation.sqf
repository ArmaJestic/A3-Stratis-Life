// A_player_fnc_restrained_animation

#include "header.h"


player groupChat format["A_player_fnc_restrained_animation %1", _this];
ARGV(0,_player);

if (!([_player] call A_player_fnc_exists)) exitWith {};
_player switchMove "AmovPercMstpSnonWnonDnon_Ease";
_player playMoveNow "UnaErcPoslechVelitele4";
