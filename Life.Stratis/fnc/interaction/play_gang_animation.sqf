// A_interaction_fnc_play_gang_animation

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"


ARGV(0,_player);
if (not([_player] call A_player_fnc_human)) exitWith {null};

A_interaction_var_gang_animation = true;
player playmove "AinvPknlMstpSlayWrflDnon_medic";
sleep 5;
waitUntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};
A_interaction_var_gang_animation = false;
