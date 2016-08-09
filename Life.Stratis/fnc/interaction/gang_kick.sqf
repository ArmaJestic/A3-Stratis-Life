// A_interaction_fnc_gang_kick

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"

 _this spawn {
ARGV(0,_player);
ARGV(1,_member_variable);
if (!([_player] call A_player_fnc_human)) exitWith {null};
if (undefined(_member_variable)) exitWith {null};
if (typeName _member_variable != "STRING") exitWith {null};

_member = missionNamespace getVariable [_member_variable, null];
if (!([_member] call A_player_fnc_human)) exitWith {null};

private["_player_uid", "_member_uid"];
_player_uid = [_player] call A_gang_fnc_player_uid;
_member_uid = [_member] call A_gang_fnc_player_uid;

private["_gang"];
_gang = [_player_uid] call A_gang_fnc_lookup_player_uid;
if (undefined(_gang)) exitWith {
	player groupChat format["%1-%2, you are no in a gang", _player, (name _player)];
};

private["_gang_id"];
_A_gang_var_id = _gang select A_gang_var_id;
if (!(([_gang_id] call A_gang_fnc_leader_uid) == _player_uid)) exitWith {
	player groupChat format["%1-%2, you are not the leader of this gang", _player, (name _player)];
};

if (_player_uid == _member_uid) exitWith {
	player groupChat format["%1-%2, you cannot kick yourself from the gang", _player, (name _player)];
};

private["_members"];
_members = _gang select A_gang_var_members;
if (!(_member_uid in _members)) exitWith {
	player groupChat format["%1-%2, %3-%4 is not a member of your gang", _player, (name _player), _member, (name _member)];
};

player groupChat format["%1-%2, you have kicked %3-%4 from your gang!", _player, (name _player), _member, (name _member)];

format['["%1", "%2"] call A_gang_fnc_remove_member;', _gang_id, _member_uid] call A_broadcast_fnc_broadcast;
sleep 1;  //sleep a second to give enought time for the changes to take effect

private["_message"];
_message = format["%1-%2, you have been kicked out of your gang!", _member, (name _member)];
format['if (player == %1) then {player groupChat toString(%2);};', _member, toArray(_message)] call A_broadcast_fnc_broadcast;
};
