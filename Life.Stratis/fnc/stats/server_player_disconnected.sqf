// A_stats_fnc_server_player_disconnected

#include "header.h"


params["_id", "_name", ["_uid","",[""]]]; 

if (_uid == "") exitWith {null};

private _player = server getVariable _uid;
[_player, "isGhost", true, true] call A_object_fnc_setVariable;

[_player] call A_player_fnc_save_side_gear;
[_player] call A_player_fnc_save_side_inventory;
[_player] call A_player_fnc_save_side_position;
[_player] call A_player_fnc_save_side_damage;
[_player] call A_player_fnc_save_side_vehicle;
[_player] call A_gang_fnc_player_disconnected;
	

private _vehicle = (vehicle _player);
if (!(_vehicle == _player)) then {
	[_vehicle] call A_vehicle_fnc_save_stats;
	[_vehicle] call A_vehicle_fnc_start_track;
};
	
private _stats_uid =  [_player] call A_stats_fnc_get_uid;
[_stats_uid] call A_invokeJava_fnc_unloadPlayerVariables;