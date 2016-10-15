// A_gang_fnc_add_member

#include "header.h"

 _this spawn {
if (!(isServer)) exitWith {null};
ARGV(0,_gang_id);
ARGV(1,_player);
if (!([_player] call A_player_fnc_human)) exitWith {null};

private["_gang"];
_gang = [_gang_id] call A_gang_fnc_lookup_id;
if (UNDEFINED(_gang)) exitWith {null};

private["_player_uid"];
[_player, (group _player)] call A_player_fnc_set_saved_group;
_player_uid = [_player] call A_gang_fnc_player_uid;

private["_side"];
_side = [_player] call A_player_fnc_side;

private["_members", "_group"];
_group = _gang select GANG_INDEX_GROUP;
//recreate the group if it does not exist
_group = [_side, _group] call A_gang_fnc_recreate_group;
_gang set [GANG_INDEX_GROUP, _group];

_members = _gang select GANG_INDEX_MEMBERS;
_members = _members + [_player_uid];
_gang set [GANG_INDEX_MEMBERS, _members];
[_gang] call A_gang_fnc_update_list;

sleep 1;
[_player]  joinSilent _group;
sleep 1;
[_gang_id] call A_gang_fnc_update_leader;
};
