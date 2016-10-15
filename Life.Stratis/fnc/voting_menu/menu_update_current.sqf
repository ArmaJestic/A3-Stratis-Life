// A_voting_menu_fnc_menu_update_current

#include "header.h"

 _this spawn {
disableSerialization;
ARGV(0,_election_data)
ARGV(1,_control);
if (UNDEFINED(_election_data)) exitWith {};

private["_election_id"];
_election_id = _election_data select INDEX_DATA_ELEC_ID;

waitUntil {
	private["_timeout"];
	_timeout =  [_election_id] call A_voting_menu_fnc_election_timeout_value;
	if (UNDEFINED(_timeout)) then {
		_timeout = "(unknown)";
	};
	

	
	
	(!(ctrlShown _control))
};
};
