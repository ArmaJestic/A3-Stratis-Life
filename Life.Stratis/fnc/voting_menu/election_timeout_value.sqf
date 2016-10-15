// A_voting_menu_fnc_election_timeout_value

#include "header.h"


ARGV(0,_election_id);
private["_variable_name"];
_variable_name = format["%1_election_timeout", _election_id];
(server getVariable [_variable_name, 0])
