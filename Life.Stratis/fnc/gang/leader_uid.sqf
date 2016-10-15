// A_gang_fnc_leader_uid

#include "header.h"


ARGV(0,_gang_id);
if (UNDEFINED(_gang_id)) exitWith {""};
if (typeName _gang_id != "STRING") exitWith {""};

private["_gang"];
_gang = [_gang_id] call A_gang_fnc_lookup_id;
if (UNDEFINED(_gang)) exitWith {""};

private["_gang_members"];
_gang_members = _gang select GANG_INDEX_MEMBERS;
if (count (_gang_members) == 0) exitWith {""};

private["_leader_uid"];
_leader_uid = _gang_members select 0;
(_leader_uid)