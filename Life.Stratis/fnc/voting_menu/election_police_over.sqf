// A_voting_menu_fnc_election_police_over

#include "header.h"


ARGV(0,_election_data);
ARGV(1,_first_place_votes);
ARGV(2,_first_place_data);
ARGV(3,_tie);

private["_player"];
_player = player;
	
private["_election_id", "_election_title", "_election_role"];
_election_id = _election_data select INDEX_DATA_ELEC_ID;
_election_title = _election_data select INDEX_DATA_ELEC_TITLE;
_election_role = _election_data select INDEX_DATA_ELEC_ROLE;

if (_first_place_votes == 0) exitWith {
	hint format["%1 election has ended with no votes cast. The current %2 stays.", _election_title, _election_role];
};

if (_tie) exitWith {
	hint format["%1 election has ended in a tie. The current %2 stays.", _election_title, _election_role];
};

private["_first_place_name", "_first_place_uid"];
_first_place_name = _first_place_data select INDEX_DATA_ELEC_CAND_DATA_ENTRY_NAME;
_first_place_uid = _first_place_data select INDEX_DATA_ELEC_CAND_DATA_ENTRY_UID;

private["_player_uid"];
_player_uid = getPlayerUID player;
if (_player_uid == _first_place_uid) then {
	[_first_place_uid] call A_player_fnc_set_chief_uid;
	hint format["%1-%2, Congratutations!\n You have won the %3 election with %4 votes.", _player, (name _player), toLower(_election_title), _first_place_votes];
}else{
	hint format["%1 has won the %2 election with %3 votes.", _first_place_name, toLower(_election_title), _first_place_votes];
};

