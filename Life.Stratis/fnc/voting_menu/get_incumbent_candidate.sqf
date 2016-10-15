// A_voting_menu_fnc_get_incumbent_candidate

#include "header.h"


ARGV(0,_election_id);
if (UNDEFINED(_election_id)) exitWith {null};

private["_variable_name"];
_variable_name = format["%1_incumbent", _election_id];

(server getVariable [_variable_name, null])
