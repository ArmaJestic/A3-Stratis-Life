// A_voting_menu_fnc_update_nomination_version

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_election_id);

if (undefined(_election_id)) exitWith {};

private["_version_value"];
_version_value = [_election_id] call A_voting_menu_fnc_get_nomination_version;
_version_value = _version_value + 1;
[_election_id, _version_value] call A_voting_menu_fnc_set_nomination_version;
