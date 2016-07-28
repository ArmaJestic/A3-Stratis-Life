// A_client_fnc_check_bunker

#include "..\..\includes\macro.h"


//player groupChat format["A_client_fnc_check_bunker %1", _this];
private["_player"];
_player = player;

private["_bunker"];
_bunker = [_player] call A_bunker_fnc_player_near;

if (undefined(_bunker) || {not(INV_shortcuts) || {not(alive _player)}}) exitWith {
	[_player] call A_bunker_fnc_remove_actions;
};

[_player, _bunker] call A_bunker_fnc_add_actions;
