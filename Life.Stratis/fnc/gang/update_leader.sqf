// A_gang_fnc_update_leader

#include "header.h"


if (!(isServer)) exitWith {null};

player groupChat format["A_gang_fnc_update_leader %1", _this];
ARGV(0,_gang_id);
if (UNDEFINED(_gang_id)) exitWith {null};
if (typeName _gang_id != "STRING") exitWith {null};

private["_gang"];
_gang = [_gang_id] call A_gang_fnc_lookup_id;
if (UNDEFINED(_gang)) exitWith {null};

private["_leader_uid"];
_leader_uid = [_gang_id] call A_gang_fnc_leader_uid;

private["_leader"];
_leader = [_leader_uid] call A_player_fnc_lookup_gang_uid;

private["_i", "_member_uids", "_members", "_group"];
_member_uids = _gang select GANG_INDEX_MEMBERS;
_group = _gang select GANG_INDEX_GROUP;


	
_members = [_member_uids] call A_gang_fnc_uids_2_players;
if (count _members > 0) then {
	_members joinSilent _group;
};

if ([_leader] call A_player_fnc_exists) then {
	player groupChat format["making %1 leader of %2", _leader, _group];
	_group selectLeader _leader;
};
