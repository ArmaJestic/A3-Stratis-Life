// A_voting_menu_fnc_nomination_menu_create

#include "../../includes/constants.h"
#include "../../includes/macro.h"


ARGV(0,_election_data);

if (undefined(_election_data)) exitWith {};
private["_nomination_menu_data"];
_nomination_menu_data = [_election_data] call A_voting_menu_fnc_nomination_menu_setup;

private["_list_nominees", "_list_players"];
_list_nominees = _nomination_menu_data select A_voting_menu_var_nomination_menu_data_list_nominees;
_list_players = _nomination_menu_data select A_voting_menu_var_nomination_menu_data_list_players;

[_election_data, _list_nominees] call A_voting_menu_fnc_nomination_menu_update_list;
[_election_data, _list_players] call A_voting_menu_fnc_nomination_menu_update_options;
