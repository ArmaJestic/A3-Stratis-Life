// A_voting_menu_fnc_menu_update_current

#include "../../includes/constants.h"
#include "../../includes/macro.h"

 _this spawn {
disableSerialization;
ARGV(0,_election_data)
ARGV(1,_control);
if (undefined(_election_data)) exitWith {};

private["_election_id"];
_election_id = _election_data select A_voting_menu_var_election_data_id;

waitUntil {
	private["_timeout"];
	_timeout =  [_election_id] call A_voting_menu_fnc_election_timeout_value;
	if (undefined(_timeout)) then {
		_timeout = "(unknown)";
	};
	

	
	
	(not(ctrlShown _control))
};
};
