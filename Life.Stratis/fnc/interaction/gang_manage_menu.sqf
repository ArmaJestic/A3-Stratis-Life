// A_interaction_fnc_gang_manage_menu

#include "header.h"


//player groupChat format["A_interaction_fnc_gang_manage_menu %1", _this];
ARGV(0,_player);
ARGV(1,_gang_id);

if (!([_player] call A_player_fnc_human)) exitWith {null};
if (UNDEFINED(_gang_id)) exitWith {null};
if (typeName _gang_id != "STRING") exitWith {null};

private["_gang"];
_gang = [_gang_id] call A_gang_fnc_lookup_id;
if (UNDEFINED(_gang)) exitWith {null};

private["_gang_name","_gang_open","_player_uid"];
_gang_name = _gang select GANG_INDEX_NAME;
_gang_open = _gang select GANG_INDEX_OPEN;
_player_uid = [_player] call A_gang_fnc_player_uid;

if (!(([_gang_id] call A_gang_fnc_leader_uid) == _player_uid)) exitWith {
	player groupChat format["%1-%2, you are not allowed to manage gang %3, you are not the leader", _player, (name _player), _gang_name];
};

if (!(createDialog "manage_gang_menu")) exitWith {
	player groupChat format["ERROR: clould not create gang management dialog"];
};

ctrlSetText [101, format["Manage %1", _gang_name]];

selected_gang_id = _gang_id;
call A_interaction_fnc_gang_update_open_cbox;

private["_member_uids", "_members"];
_member_uids = _gang select GANG_INDEX_MEMBERS;
_members = [_member_uids] call A_gang_fnc_uids_2_players;

{
	private["_member", "_member_name", "_member_uid"];
	_member = _x;
	_member_name = (name _member);
	_member_uid = [_member] call A_gang_fnc_player_uid;
	private["_index"];
	_index = lbAdd [102, (format ["%1 (%2)", _member_name, _member])];
	lbSetData [102, _index, str(_member)];
} forEach _members;
