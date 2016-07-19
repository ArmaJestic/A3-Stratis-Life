// A_voting_menu_fnc_get_nomination_version

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_election_id);
private["_default"];
_default = 0;

if (undefined(_election_id)) exitWith {_default};

private["_variable_name"];
_variable_name = format["%1_nomination_version", _election_id];
(server getVariable [_variable_name, _default])
