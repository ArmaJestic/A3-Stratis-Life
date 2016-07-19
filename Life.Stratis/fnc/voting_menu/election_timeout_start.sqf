// A_voting_menu_fnc_election_timeout_start

#include "../../includes/constants.h"
#include "../../includes/macro.h"

 _this spawn {
ARGV(0,_election_data);

if (undefined(_election_data)) exitWith {};

private["_election_id", "_election_role", "_election_period"];
_election_id = _election_data select A_voting_menu_var_election_data_id;
_election_role = _election_data select A_voting_menu_var_election_data_role;
_election_period = _election_data select A_voting_menu_var_election_data_election_period;
	
private["_i"];
_i = _election_period;
while {_i >= 0} do {
	[_election_id, _i] call A_voting_menu_fnc_election_timeout_update;
	sleep 1;
	_i = _i - 1;
};
[_election_id, nil] call A_voting_menu_fnc_election_timeout_update;

[_election_data] call A_voting_menu_fnc_election_over;
};
