// A_gang_fnc_leader_uid

#include "..\..\includes\macro.h"


ARGV(0,_gang_id);
if (undefined(_gang_id)) exitWith {""};
if (typeName _gang_id != "STRING") exitWith {""};

private["_gang"];
_gang = [_gang_id] call A_gang_fnc_lookup_id;
if (undefined(_gang)) exitWith {""};

private["_gang_members"];
_A_gang_var_members = _gang select A_gang_var_members;
if (count (_gang_members) == 0) exitWith {""};

private["_leader_uid"];
_leader_uid = _gang_members select 0;
(_leader_uid)
