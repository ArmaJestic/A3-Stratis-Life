// A_voting_menu_fnc_menu_create

#include "header.h"


ARGV(0,_election_data);
if (UNDEFINED(_election_data)) exitWith {};
private["_list"];
_list = [_election_data] call A_voting_menu_fnc_menu_setup;
[_election_data, _list] call A_voting_menu_fnc_menu_update_list;
