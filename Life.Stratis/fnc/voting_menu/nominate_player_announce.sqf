// A_voting_menu_fnc_nominate_player_announce

#include "header.h"


ARGV(0,_election_data);
ARGV(1,_voter);
ARGV(2,_nominee);

if (UNDEFINED(_election_data)) exitWith {};
if (!([_voter] call A_player_fnc_exists)) exitWith {};
if (!([_nominee] call A_player_fnc_exists)) exitWith {};

private["_election_role"];
_election_role = _election_data select INDEX_DATA_ELEC_ROLE;

if (_voter == _nominee) then {
	player groupChat format["%1-%2 has nominated himself %3", _voter, (name _voter), _election_role];
}else{
	player groupChat format["%1-%2 has nominated %3-%4 for %5", _voter, (name _voter), _nominee, (name _nominee), _election_role];
};
