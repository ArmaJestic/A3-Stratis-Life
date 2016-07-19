// A_gang_fnc_loop_iteration

#include "../../includes/macro.h"


//player groupChat format["A_gang_fnc_loop_iteration"];
private["_player"];
_player = player;

{if (true) then {
	private["_gang_area"];
	_gang_area = _x;
	
	private["_cgang_id", "_gang", "_player_uid"];
	_cgang_id  = [_gang_area] call A_gang_fnc_area_get_control;
	_player_uid = [_player] call A_gang_fnc_player_uid;
	_gang = [_player_uid] call A_gang_fnc_lookup_player_uid;
	
	if (undefined(_gang)) exitWith {null};
	private["_gang_id"];
	_A_gang_var_id = _gang select A_gang_var_id;
	if (not (_gang_id == _cgang_id)) exitWith {null};
	

	if (not((_player distance _gang_area) < 10 && not([_gang_area] call A_gang_fnc_flag_at_max))) exitWith {null};

	[_gang_area, 0.1] call A_gang_fnc_flag_set_offset;
	
	
};} forEach gangareas;
