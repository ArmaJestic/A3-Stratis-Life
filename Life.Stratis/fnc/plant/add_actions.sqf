// A_plant_fnc_add_actions

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


ARGV(0,_player);
ARGV(1,_plant_netid);

if ((_plant_netid == A_plant_var_actions_netid)) exitWith {};

if (!([_player] call A_player_fnc_human)) exitWith {};
if (undefined(_plant_netid)) exitWith {};
if (typeName _plant_netid != "STRING") exitWith {};


//remove previous actions
[_player] call A_plant_fnc_remove_actions;

private["_plant"];
_plant = objectFromNetId _plant_netid;
if (isNull _plant) exitWith {};

if (!([_plant, "isPlant", false] call A_object_fnc_getVariable)) exitWith {};

private["_item"];
_item = [_plant, "item", ""] call A_object_fnc_getVariable;


private["_seed_data"];
_seed_data = [_item] call A_plant_fnc_seed_lookup_id;
if (undefined(_seed_data)) exitWith {};

private["_name"];
_name = _seed_data select A_plant_var_seed_data_name;


private["_action_id"];	

_action_id = player addAction [format["Harvest %1 yield", _name, _plant_netid], A_actions_fnc_action, [[_player, _plant], "A_plant_fnc_harvest_yield"], 1,true,true,"", format['(nearCursorTarget == objectFromNetId "%1") && {(player distance nearCursorTarget) < 3} ',_plant_netid]];
A_plant_var_actions = A_plant_var_actions + [_action_id];
A_plant_var_actions_netid = _plant_netid;
