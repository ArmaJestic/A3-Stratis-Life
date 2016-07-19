// A_gang_fnc_remove_member

#include "..\..\includes\macro.h"

 _this spawn {
if (not(isServer)) exitWith {null};
ARGV(0,_gang_id);
ARGV(1,_member_uid);
if (undefined(_member_uid)) exitWith {null};
if (typeName _member_uid != "STRING") exitWith {null};

private["_gang"];
_gang = [_gang_id] call A_gang_fnc_lookup_id;
if (undefined(_gang)) exitWith {null};



private["_members"];
_members = _gang select A_gang_var_members;
_members = _members - [_member_uid];
_gang set[A_gang_var_members, _members];

if ((count _members) == 0) then {
	_gang set [A_gang_var_open, true];
	format['["%1"] call A_gang_fnc_schedule_deletion;', _gang_id] call broadcast;
};

[_gang] call A_gang_fnc_update_list;
sleep 1;

[_gang_id] call A_gang_fnc_update_leader;
sleep 1;

[_member_uid] call A_gang_fnc_restore_member_group;
};
