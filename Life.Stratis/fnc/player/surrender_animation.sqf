// A_player_fnc_surrender_animation

#include "..\..\includes\macro.h"


player groupChat format["A_player_fnc_surrender_animation %1", _this];
ARGV(0,_player);
if (!([_player] call A_player_fnc_exists)) exitWith {};

_player playmove "TestSurrender";
_player playmovenow "AmovPercMstpSnonWnonDnon_AmovPercMstpSsurWnonDnon";
_player playmove "TestSurrender";
