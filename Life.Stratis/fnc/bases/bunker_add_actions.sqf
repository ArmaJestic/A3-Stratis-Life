// A_bases_fnc_bunker_add_actions

#include "header.h"


if (count A_bases_var_bunker_actions > 0) exitWith {};
params["_player","_bunker_net_id"];

if (!([_player] call A_player_fnc_human)) exitWith {};
if (UNDEFINED(_bunker_net_id)) exitWith {};
if (typeName _bunker_net_id != "STRING") exitWith {};

private _bunker_door = objectFromNetId _bunker_net_id;
if (UNDEFINED(_bunker_door)) exitWith {};

private _bunker_door_data = [_bunker_door, "bunker_door_data"] call A_object_fnc_getVariable;
if (UNDEFINED(_bunker_door_data)) exitWith {};

private _bunker_action_label = _bunker_door_data select BUNKER_INDEX_DOOR_ACTION_LABEL;
private _bunker_door_action_callback = _bunker_door_data select BUNKER_INDEX_DOOR_ACTION_CALLBACK;
private _action_code = missionNamespace getVariable[_bunker_door_action_callback,{}];
private _action_id = player addAction [_bunker_action_label, _action_code,[_player,_bunker_door_data],10,false,false,"","true"];
A_bases_var_bunker_actions pushBack _action_id;