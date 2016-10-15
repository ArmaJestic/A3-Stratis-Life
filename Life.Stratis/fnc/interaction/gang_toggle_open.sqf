// A_interaction_fnc_gang_toggle_open

#include "header.h"


//player groupChat format["A_interaction_fnc_gang_toggle_open %1", _this];
ARGV(0,_player);
if (!([_player] call A_player_fnc_human)) exitWith {null};

private["_player_uid", "_gang"];
_player_uid = [_player] call A_gang_fnc_player_uid;
_gang = [_player_uid] call A_gang_fnc_lookup_player_uid;

private["_gang_id"];
_gang_id = _gang select GANG_INDEX_ID;
if (!(([_gang_id] call A_gang_fnc_leader_uid) == _player_uid)) exitWith {
	player groupChat format["%1-%2, you are not the leader of this gang", _player, (name _player)];
};

private["_open"];
_open = _gang select GANG_INDEX_OPEN;
_open = !(_open);
_gang set [GANG_INDEX_OPEN, _open];
[_gang] call A_gang_fnc_update_list;

if (!(_open)) then {
	player groupChat format["%1-%2, you have closed your gang", _player, (name _player)];
}else{
	player groupChat format["%1-%2, you have opened your gang", _player, (name _player)];
};
