// A_voting_menu_fnc_nomination_menu_update_list

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"

 _this spawn {
//player groupChat format["A_voting_menu_fnc_nomination_menu_update_list = %1", _this];
disableSerialization;
ARGV(0,_election_data);
ARGV(1,_list);

if (undefined(_election_data)) exitWith {};
if (undefined(_list)) exitWith {};

private["_election_id"];
_election_id = _election_data select A_voting_menu_var_election_data_id;

private["_version"];
_version = [_election_id] call A_voting_menu_fnc_get_nomination_version;
[_election_id] call A_voting_menu_fnc_nomination_menu_update_list_reload;


waitUntil {
	private["_new_version"];
	_new_version = [_election_id] call A_voting_menu_fnc_get_nomination_version;
	if (_new_version != _version) then {
		_version = _new_version;
		[_election_id] call A_voting_menu_fnc_nomination_menu_update_list_reload;
	};
	not(ctrlShown _list)
};
};
