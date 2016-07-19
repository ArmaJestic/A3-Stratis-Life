// A_bunker_fnc_underground_base_check_animation

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


private["_player"];
_player = player;
if (([_player] call A_underwater_base_fnc_underground_base_player_inside) && {(animationState _player) == "halofreefall_non"}) then {
	_player switchMove "amovpercmstpsnonwnondnon";
	_player playMoveNow "amovpercmstpsnonwnondnon";
};
