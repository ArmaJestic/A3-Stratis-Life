// A_interaction_fnc_gang_menu

#include "../../includes/macro.h"
#include "../../includes/constants.h"
#include "../../includes/dikcodes.h"


ARGV(0,_player);
if (not([_player] call A_player_fnc_human)) exitWith {null};

if (not(createDialog "gang_menu")) exitWith {
	player groupChat format["ERROR: cannot create gang dialog"];	
};

private["_i", "_gangs_list"];
_gangs_list = call A_gang_fnc_get_list;
_i = 0;
while {_i < count (_gangs_list) } do {
	private["_gang"];
	_gang = _gangs_list select _i;
	private["_gang_id", "_gang_name", "_member_uids"];
	_A_gang_var_id = _gang select A_gang_var_id;
	_A_gang_var_name = _gang select A_gang_var_name;
	_A_gang_var_open = _gang select A_gang_var_open;
	_member_uids = _gang select A_gang_var_members;
	
	private["_member_names", "_open_str"];
	_member_names = [_member_uids] call A_gang_fnc_uids_2_names;
	_open_str = if (_gang_open) then {"open"} else {"closed"};
	
	private["_index"];
	_index = lbAdd [202, format["%1 (%2) - Members: %3", _gang_name, _open_str, _member_names]];
	//player groupChat format["_index = %1, _gang_id = %2", _index, _gang_id];
	lbSetData[202, _index, _gang_id];
	_i = _i + 1;
};
