// A_voting_menu_fnc_nominate_player

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


//player groupChat format["A_voting_menu_fnc_nominate_player %1", _this];
ARGV(0,_election_data);
ARGV(1,_voter);
ARGV(2,_nominee);


if (undefined(_election_data)) exitWith {};	
if (not([_voter] call A_player_fnc_exists)) exitWith {};
if (not([_nominee] call A_player_fnc_exists)) exitWith {};

private["_election_id", "_election_title", "_election_role"];
_election_id = _election_data select A_voting_menu_var_election_data_id;
_election_title = _election_data select A_voting_menu_var_election_data_title;
_election_role = _election_data select A_voting_menu_var_election_data_role;

private["_election_timeout"];
_election_timeout = [_election_id] call A_voting_menu_fnc_election_timeout_value;

if (_election_timeout > 0) exitWith {
	player groupChat format["%1-%2, you cannot nominate players for %3 now. There is a %4 election in progress", (_voter), (name _voter), _election_role, toLower(_election_title)];
};

if ([_election_id, _nominee] call A_voting_menu_fnc_player_nominated) exitWith {
	if (_nominee == _voter) then {
		player groupChat format["%1-%2, you are already nominated for %3", _voter, (name _voter), _election_role];
	}
	else {
		player groupChat format["%1-%2, player %3-%4 has already been nominated for %5", _voter, (name _voter), _nominee, (name _nominee), _election_role];
	};
};

private["_nominations"];
_nominations = [_election_id] call A_voting_menu_fnc_get_nominations;
if (undefined(_nominations)) exitWith {};

private["_nominations_index"];
_nominations_index = _nominations select A_voting_menu_var_election_nominations_index;

if (count(_nominations_index) == 0) then {
	[[_election_data], "A_voting_menu_fnc_nomination_timeout_start", false] call BIS_fnc_MP;
};


[_election_id, _nominee] call A_voting_menu_fnc_update_nominations;
[_election_id] call A_voting_menu_fnc_update_nomination_version;

[[_election_data, _voter,_nominee], "A_voting_menu_fnc_nominate_player_announce", true] call BIS_fnc_MP;
