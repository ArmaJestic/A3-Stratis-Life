// A_bunker_fnc_add_actions

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


if (count bunker_actions > 0) exitWith {};
ARGV(0,_player);
ARGV(1,_bunker_net_id);
//player groupChat format["A_bunker_fnc_add_actions %1", _this];

if (not([_player] call A_player_fnc_human)) exitWith {};
if (undefined(_bunker_net_id)) exitWith {};
if (typeName _bunker_net_id != "STRING") exitWith {};

private["_bunker_door"];
_bunker_door = objectFromNetId _bunker_net_id;
if (undefined(_bunker_door)) exitWith {};


private["_bunker_door_data"];
_bunker_door_data = [_bunker_door, "bunker_door_data"] call A_object_fnc_getVariable;
if (undefined(_bunker_door_data)) exitWith {};


private["_bunker_action_label", "_bunker_door_action_callback"];
_bunker_action_label = _bunker_door_data select A_bunker_var_door_data_action_label;
_bunker_door_action_callback = _bunker_door_data select A_bunker_var_door_data_action_callback;
private["_action_id"];
_action_id = player addaction [_bunker_action_label, "action.sqf", [[_player, _bunker_door_data], "A_bunker_fnc_enter"],10,false,false,"", "true"];
bunker_actions = bunker_actions + [_action_id];

bunker_actions
