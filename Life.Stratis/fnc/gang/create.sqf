// A_gang_fnc_create

#include "..\..\includes\macro.h"


if (not(isServer)) exitWith {null};
ARGV(0,_player);
ARGV(1,_name);
if (not([_player] call A_player_fnc_human)) exitWith {null};
if (undefined(_name)) exitWith {null};
if (typeName _name != "STRING") exitWith {null};

private["_gang","_gang_id", "_gang_group"];
_gang = [];
_gang_id = [_player] call A_gang_fnc_generate_id;

private["_side"];
_side = [_player] call A_player_fnc_side;
_gang_group = [_side, null] call A_gang_fnc_recreate_group;
	
[_player] joinSilent _gang_group;

_gang set [A_gang_var_id, _A_gang_var_id];
_gang set [A_gang_var_name, _name];
_gang set [A_gang_var_members, [([_player] call A_gang_fnc_player_uid)]];
_gang set [A_gang_var_open, true];
_gang set [A_gang_var_group, _A_gang_var_group];

[_gang] call A_gang_fnc_update_list;
