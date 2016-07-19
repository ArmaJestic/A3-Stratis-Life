// A_gang_fnc_make_leader

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
_members = [_member_uid] + _members;
_gang set[A_gang_var_members, _members];

[_gang] call A_gang_fnc_update_list;
sleep 1;

[_gang_id] call A_gang_fnc_update_leader;

};
