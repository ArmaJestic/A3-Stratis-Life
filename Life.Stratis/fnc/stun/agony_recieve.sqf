// A_stun_fnc_agony_recieve

#include "..\..\includes\macro.h"

_this spawn {
ARGV(0,_player);
if (UNDEFINED(_player)) exitWith {};

if ([_player] call A_pos_fnc_is_prone) exitWith {};

if (_player getVariable ["agony_active", false]) exitWith {};
_player setVariable["agony_active", true];

playSound3D ["a3\sounds_f\characters\movements\bodyfalls\bodyfall_concrete_3.wss", _player];
playSound3D [format["a3\sounds_f\characters\human-sfx\Person0\P0_hit_0%1.wss", (floor(random 8) + 1)], _player];

_player switchMove "aparpercmstpsnonwnondnon_amovppnemstpsnonwnondnon";
sleep 3;
_player setVariable["agony_active", false];
};
