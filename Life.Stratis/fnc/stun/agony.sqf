// A_stun_fnc_agony

#include "../../includes/macro.h"


ARGV(0,_player);
[[_player], "A_stun_fnc_agony_recieve", true, false] call BIS_fnc_MP;
waitUntil {
	sleep 1;
	(toLower(animationState _player) != toLower("aparpercmstpsnonwnondnon_amovppnemstpsnonwnondnon"))
};

//playSound3D ["a3\sounds_f\sfx\movements\bodyfalls\bodyfall_concrete_3.wss", _player];

_player playMoveNow "unconscious";
