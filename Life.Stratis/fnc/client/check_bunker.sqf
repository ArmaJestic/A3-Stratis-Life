// A_client_fnc_check_bunker

#include "..\..\includes\macro.h"


private _player = player;
private _bunker = [_player] call A_bases_fnc_bunker_near;

if (UNDEFINED(_bunker) || {!(A_inv_var_shortcuts) || {!(alive _player)}}) exitWith {
	[_player] call A_bases_fnc_bunker_remove_actions;
};

[_player, _bunker] call A_bases_fnc_bunker_add_actions;