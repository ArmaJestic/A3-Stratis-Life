// A_voting_menu_fnc_nomination_menu_update_timeout

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
	_timeout =  [_election_id] call A_voting_menu_fnc_nomination_timeout_value;
	if (UNDEFINED(_timeout)) then {
		_timeout = "(unknown)";
	};
	_control ctrlSetText format["%1", _timeout];
	(!(ctrlShown _control))
};
};
