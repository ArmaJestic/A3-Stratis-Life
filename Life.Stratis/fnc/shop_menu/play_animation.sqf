// A_shop_menu_fnc_play_animation

#include "header.h"


private["_move"];
_move = if (primaryweapon player == "" && secondaryweapon player == "") then { "AmovPercMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon" } else  {"AinvPknlMstpSlayWrflDnon"};
if ((vehicle player) == player) then {
	player playMove _move;
	format['%1 playMove "%2;"', player, _move] call A_broadcast_fnc_broadcast;
};
