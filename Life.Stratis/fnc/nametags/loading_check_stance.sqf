// A_nametags_fnc_loading_check_stance

#include "..\..\includes\macro.h"
#include "..\..\constants.h"


private["_player"];
_player = player;

if (not(loading_active)) exitWith {};
if ([_player] call A_object_fnc_in_water) exitWith {};
_player switchMove "amovpercmstpsnonwnondnon";
