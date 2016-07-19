// A_voting_menu_fnc_set_incumbent_candidate

#include "../../includes/constants.h"
#include "../../includes/macro.h"


ARGV(0,_election_id);
ARGV(1,_candidate_data);

if (undefined(_election_id)) exitWith {null};
if (undefined(_candidate_data)) exitWith {null};

private["_variable_name"];
_variable_name = format["%1_incumbent", _election_id];

server setVariable [_variable_name, _candidate_data, true];
(_candidate_data)
