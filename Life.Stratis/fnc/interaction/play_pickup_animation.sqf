// A_interaction_fnc_play_pickup_animation

#include "header.h"


private["_animation"];

if ([player] call A_object_fnc_in_water) exitWith {};
sleep 1;
_animation = if((primaryWeapon player) == "" && (secondaryWeapon player) == "") then{ "AmovPercMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon"} else { "AinvPknlMstpSlayWrflDnon"};
//player playMove _animation;
//format['%1 playMove "%2;"', player, _animation] call A_broadcast_fnc_broadcast;
player playMoveNow _animation;
sleep 1;
