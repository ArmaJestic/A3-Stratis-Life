// A_client_fnc_check_prison_actions

#include "..\..\includes\macro.h"


//player groupChat format["A_client_fnc_check_lotto_actions"];
private["_player"];
_player = player;
private["_vehicle", "_in_vehicle"];
_vehicle = (vehicle _player);
_in_vehicle = (_vehicle != _player);

private["_prison"];
_prison = [_player, 2] call A_prison_menu_fnc_player_near;
//player groupChat format["_prison = %1",_prison];
if (undefined(_prison) || !(INV_shortcuts) || _in_vehicle || !(alive _player)) exitWith {
	[_player] call A_prison_menu_fnc_remove_actions;
};

private["_prison_id"];
_prison_id = _prison select A_prison_menu_var_data_id;
[_player, _prison_id] call A_prison_menu_fnc_add_actions;
