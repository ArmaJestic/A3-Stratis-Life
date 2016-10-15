// A_gang_fnc_remove_member

#include "header.h"

 _this spawn {
if (!(isServer)) exitWith {null};
ARGV(0,_gang_id);
ARGV(1,_member_uid);
if (UNDEFINED(_member_uid)) exitWith {null};
if (typeName _member_uid != "STRING") exitWith {null};

private["_gang"];
_gang = [_gang_id] call A_gang_fnc_lookup_id;
if (UNDEFINED(_gang)) exitWith {null};



private["_members"];
_members = _gang select GANG_INDEX_MEMBERS;
_members = _members - [_member_uid];
_gang set[GANG_INDEX_MEMBERS, _members];

if ((count _members) == 0) then {
	_gang set [GANG_INDEX_OPEN, true];
	format['["%1"] call A_gang_fnc_schedule_deletion;', _gang_id] call A_broadcast_fnc_broadcast;
};

[_gang] call A_gang_fnc_update_list;
sleep 1;

[_gang_id] call A_gang_fnc_update_leader;
sleep 1;

[_member_uid] call A_gang_fnc_restore_member_group;
};
