// A_gang_fnc_create

#include "header.h"


if (!(isServer)) exitWith {null};
ARGV(0,_player);
ARGV(1,_name);
if (!([_player] call A_player_fnc_human)) exitWith {null};
if (UNDEFINED(_name)) exitWith {null};
if (typeName _name != "STRING") exitWith {null};

private["_gang","_gang_id", "_gang_group"];
_gang = [];
_gang_id = [_player] call A_gang_fnc_generate_id;

private["_side"];
_side = [_player] call A_player_fnc_side;
_gang_group = [_side, null] call A_gang_fnc_recreate_group;
	
[_player] joinSilent _gang_group;

_gang set [GANG_INDEX_ID, _gang_id];
_gang set [GANG_INDEX_NAME, _name];
_gang set [GANG_INDEX_MEMBERS, [([_player] call A_gang_fnc_player_uid)]];
_gang set [GANG_INDEX_OPEN, true];
_gang set [GANG_INDEX_GROUP, _gang_group];

[_gang] call A_gang_fnc_update_list;