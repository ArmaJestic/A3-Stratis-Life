// A_client_fnc_check_lotto_actions

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


private _player = player;
private _vehicle = (vehicle _player);
private _in_vehicle = (_vehicle != _player);

private _lotto = [_player, 2] call A_lotto_menu_fnc_player_near;
if (UNDEFINED(_lotto) || {!A_inv_var_shortcuts} || {_in_vehicle} || {!(alive _player)}) exitWith {
	[_player] call A_lotto_menu_fnc_remove_actions;
};

private _lotto_id = _lotto select DLLG_LOTTO_DATA_INDEX_ID;
[_player, _lotto_id] call A_lotto_menu_fnc_add_actions;