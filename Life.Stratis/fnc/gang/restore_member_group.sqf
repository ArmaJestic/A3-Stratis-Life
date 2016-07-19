// A_gang_fnc_restore_member_group

#include "..\..\includes\macro.h"


ARGV(0,_member_uid);

private["_member"];
_member = [_member_uid] call A_player_fnc_lookup_gang_uid;
if (undefined(_member)) exitWith {null};

private["_side"];
_side = [_member] call A_player_fnc_side;
_group = [_member] call A_player_fnc_get_saved_group;

//recreate the group if it does not exist
_group = [_side, _group] call A_gang_fnc_recreate_group;

[_member] joinSilent _group;
_group selectLeader _member;
