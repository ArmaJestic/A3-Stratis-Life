// A_voting_menu_fnc_get_candidates

#include "../../includes/constants.h"
#include "../../includes/macro.h"


ARGV(0,_election_id);

private["_default"];
_default = [[],[]];

if (undefined(_election_id)) exitWith {null};

private["_variable_name"];
_variable_name = format["%1_candidates", _election_id];

(server getVariable [_variable_name, _default])
