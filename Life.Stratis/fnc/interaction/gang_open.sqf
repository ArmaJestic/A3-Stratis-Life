// A_interaction_fnc_gang_open

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"


//player groupChat format["A_interaction_fnc_gang_open %1", _this];
ARGV(0,_player);
ARGV(1,_open);
if (not([_player] call A_player_fnc_human)) exitWith {null};
if (undefined(_open)) exitWith {null};
if (typeName _open != "BOOL") exitWith {null};

private["_player_uid", "_gang"];
_player_uid = [_player] call A_gang_fnc_player_uid;
_gang = [_player_uid] call A_gang_fnc_lookup_player_uid;

private["_gang_id"];
_A_gang_var_id = _gang select A_gang_var_id;
if (not(([_gang_id] call A_gang_fnc_leader_uid) == _player_uid)) exitWith {
	player groupChat format["%1-%2, you are not the leader of this gang", _player, (name _player)];
};

_gang set [A_gang_var_open, _open];
[_gang] call A_gang_fnc_update_list;

if (not(_open)) then {
	player groupChat format["%1-%2, you have closed your gang", _player, (name _player)];
}
else {
	player groupChat format["%1-%2, you have opened your gang", _player, (name _player)];
};
