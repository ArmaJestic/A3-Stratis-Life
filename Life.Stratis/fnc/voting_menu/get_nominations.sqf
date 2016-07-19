// A_voting_menu_fnc_get_nominations

#include "../../includes/constants.h"
#include "../../includes/macro.h"


ARGV(0,_election_id);

private["_default"];
_default = [[],[]];

if (undefined(_election_id)) exitWith {null};
if (typeName _election_id != "STRING") exitWith {null};

private["_variable_name"];
_variable_name = format["%1_nominiations", _election_id];

private["_nominations"];
_nominations = server getVariable [_variable_name, _default];
(_nominations)
