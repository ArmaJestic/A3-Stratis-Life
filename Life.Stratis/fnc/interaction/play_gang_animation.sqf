// A_interaction_fnc_play_gang_animation

#include "header.h"


ARGV(0,_player);
if (!([_player] call A_player_fnc_human)) exitWith {null};

A_interaction_var_gang_animation = true;
player playmove "AinvPknlMstpSlayWrflDnon_medic";
sleep 5;
waitUntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};
A_interaction_var_gang_animation = false;
