// A_player_fnc_rejoin_suicide

#include "..\..\includes\macro.h"


player_rejoin_suicide_active = true;
private["_pos"];
_pos = getPos player;
player setPos [(_pos select 0),(_pos select 1) ,10000];
player setDamage 1;
//waitUntil {not(isNil "player_rejoin_camera_complete") && {player_rejoin_camera_complete}};
