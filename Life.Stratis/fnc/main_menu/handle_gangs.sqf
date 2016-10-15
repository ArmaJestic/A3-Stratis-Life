// A_main_menu_fnc_handle_gangs

#include "header.h"


ARGV(0,_title);
private["_list"];
_list = [toUpper(_title), 0.14, 0.14, 0.6, 0.7] call A_main_menu_fnc_right_setup;
lbClear (ctrlIDC _list);

private["_gangs_list"];
_gangs_list = call A_gang_fnc_get_list;

{if (true) then {
	private["_gang"];
	_gang = _x;
	private["_gang_name"];
	_gang_name = _gang select GANG_INDEX_NAME;
	
	private["_member_uids", "_member_names"];
	_member_uids = _gang select GANG_INDEX_MEMBERS;
	_member_names = [_member_uids] call A_gang_fnc_uids_2_names;
	
	if (count(_member_names) == 0) exitWith {null};
	private["_leader_name"];
	_leader_name = _member_names select 0;
	
	_list lbAdd format["%1 (%2)", _gang_name, _leader_name];
	
	private["_i"];
	_i = 1; //(starting at 1 because 0 is the leader)
	while {_i < (count _member_names) } do {
		private["_member_name"];
		_member_name = _member_names select _i;
		_list lbAdd format["    %1. %2", _i, _member_name];
		_i = _i + 1;
	};
};} forEach _gangs_list;
