// A_voting_menu_fnc_election_timeout_update

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_election_id);
ARGV(1,_value);

private["_variable_name"];
_variable_name = format["%1_election_timeout", _election_id];
server setVariable [_variable_name, _value, true];	
