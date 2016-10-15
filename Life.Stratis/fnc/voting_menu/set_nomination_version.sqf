// A_voting_menu_fnc_set_nomination_version

#include "header.h"


ARGV(0,_election_id);
ARGV(1,_version_value);

if (UNDEFINED(_election_id)) exitWith {};

private["_variable_name"];
_variable_name = format["%1_nomination_version", _election_id];

server setVariable[_variable_name, _version_value, true];
_version_value
