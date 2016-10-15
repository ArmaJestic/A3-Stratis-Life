// A_voting_menu_fnc_menu_update_fields

#include "header.h"

 _this spawn {
disableSerialization;
ARGV(0,_election_data)
ARGV(1,_timeout_control);
ARGV(2,_current_control);
if (UNDEFINED(_election_data)) exitWith {};

private["_election_id"];
_election_id = _election_data select INDEX_DATA_ELEC_ID;

waitUntil {
	private["_timeout"];
	_timeout =  [_election_id] call A_voting_menu_fnc_election_timeout_value;
	_timeout = if (UNDEFINED(_timeout)) then {"(unknown)"} else {_timeout};
	_timeout_control ctrlSetText format["%1", _timeout];
	
	private["_current_candidate_data", "_current_candidate_name"];
	_current_candidate_data = [_election_id] call A_voting_menu_fnc_get_incumbent_candidate;
	_current_candidate_name = if (UNDEFINED(_current_candidate_data)) then {"(none)"} else {_current_candidate_data select INDEX_DATA_ELEC_CAND_DATA_ENTRY_NAME};
	_current_control ctrlSetText _current_candidate_name;
	
	(!(ctrlShown _timeout_control))
};
};
