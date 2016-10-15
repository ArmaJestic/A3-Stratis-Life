// A_voting_menu_fnc_set_nominations

#include "header.h"


ARGV(0,_election_id);
ARGV(1,_nominations);

if (UNDEFINED(_election_id)) exitWith {null};
if (UNDEFINED(_nominations)) exitWith {null};
if (typeName _election_id != "STRING") exitWith {null};
if (typeName _nominations != "ARRAY") exitWith {null};

private["_variable_name"];
_variable_name = format["%1_nominiations", _election_id];

private["_nominations"];
server setVariable[_variable_name, _nominations, true];
(_nominations)
