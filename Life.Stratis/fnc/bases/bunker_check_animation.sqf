// A_bases_fnc_bunker_check_animation

#include "header.h"


private _player = player;
if (([_player] call A_bases_fnc_underground_player_inside) && {(animationState _player) == "halofreefall_non"}) then {
	_player switchMove "amovpercmstpsnonwnondnon";
	_player playMoveNow "amovpercmstpsnonwnondnon";
};