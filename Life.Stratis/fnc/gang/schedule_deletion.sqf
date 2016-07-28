// A_gang_fnc_schedule_deletion

#include "..\..\includes\macro.h"

 _this spawn {
if (not(isServer)) exitWith {null};
player groupChat format["A_gang_fnc_schedule_deletion %1", _this];

ARGV(0,_gang_id);
if (undefined(_gang_id)) exitWith {null};
if (typeName _gang_id != "STRING") exitWith {null};

private["_wait_time"];
_wait_time = A_main_var_gangdeltime;
//player groupChat format["Waiting for %1 seconds to delete %2", _wait_time, _gang_id];
[_wait_time] call A_player_fnc_isleep;
//player groupChat format["Waiting to delete %1 compelete", _gang_id];

private["_gang"];
_gang = [_gang_id] call A_gang_fnc_lookup_id;
if (undefined(_gang)) exitWith {null};

//some-one else has joined the gang while it was scheduled for deletion
private["_gang_members"];
_A_gang_var_members = _gang select A_gang_var_members;
if (count(_gang_members) > 0) exitWith {null};

[_gang_id] call A_gang_fnc_delete_id;
};
