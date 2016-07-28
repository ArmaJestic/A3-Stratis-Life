// A_client_fnc_check_lotto_actions

#include "..\..\includes\macro.h"


//player groupChat format["A_client_fnc_check_lotto_actions"];
private["_player"];
_player = player;
private["_vehicle", "_in_vehicle"];
_vehicle = (vehicle _player);
_in_vehicle = (_vehicle != _player);

private["_lotto"];
_lotto = [_player, 2] call A_lotto_menu_fnc_player_near;
//player groupChat format["_lotto = %1",_lotto];
if (undefined(_lotto) || not(INV_shortcuts) || _in_vehicle || not(alive _player)) exitWith {
	[_player] call A_lotto_menu_fnc_remove_actions;
};

private["_lotto_id"];
_lotto_id = _lotto select A_lotto_menu_var_data_id;
[_player, _lotto_id] call A_lotto_menu_fnc_add_actions;
