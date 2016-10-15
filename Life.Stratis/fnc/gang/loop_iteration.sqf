// A_gang_fnc_loop_iteration

#include "header.h"


private _player = player;
{
	private _gang_area = _x;
	private _cgang_id  = [_gang_area] call A_gang_fnc_area_get_control;
	private _player_uid = [_player] call A_gang_fnc_player_uid;
	private _gang = [_player_uid] call A_gang_fnc_lookup_player_uid;
	
	if (UNDEFINED(_gang)) exitWith {};
	
	private _gang_id = _gang select GANG_INDEX_ID;
	if (_gang_id != _cgang_id) exitWith {};
	if (((_player distance _gang_area) > 10) || {[_gang_area] call A_gang_fnc_flag_at_max}) exitWith {};

	[_gang_area, 0.1] call A_gang_fnc_flag_set_offset;
} forEach A_main_var_gangareas;