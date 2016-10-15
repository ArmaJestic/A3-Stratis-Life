// A_voting_menu_fnc_election_start

#include "header.h"


//player groupChat format["A_voting_menu_fnc_election_start %1", _this];
ARGV(0,_election_data);

if (UNDEFINED(_election_data)) exitWith {};

private["_election_id", "_election_role"];
_election_id = _election_data select INDEX_DATA_ELEC_ID;
_election_role = _election_data select INDEX_DATA_ELEC_ROLE;

[] call A_voting_menu_fnc_menu_close_all;
private["_player"];
_player = player;

private["_auto_show_window"];
_auto_show_window = [_player, format["%1_auto_show_window", _election_id], 1] call A_player_fnc_get_scalar;

if (_auto_show_window == 0) exitWith {
	player groupChat format["%1-%2, the election for %3 is starting now.", _player, (name _player), _election_role];
};

[_election_data] call A_voting_menu_fnc_menu_create;	
