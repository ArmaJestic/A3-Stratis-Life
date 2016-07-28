// A_towing_fnc_add_actions

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


if (count towing_actions > 0) exitWith {};
ARGV(0,_player);
ARGV(1,_towing_net_id);
//player groupChat format["A_towing_fnc_add_actions %1", _this];

if (not([_player] call A_player_fnc_human)) exitWith {};
if (undefined(_towing_net_id)) exitWith {};
if (typeName _towing_net_id != "STRING") exitWith {};

private["_towing_vehicle"];
_towing_vehicle = objectFromNetId _towing_net_id;
if (undefined(_towing_vehicle)) exitWith {};


private["_action_id"];
_A_actions_fnc_action_id = player addA_actions_fnc_action ["Attach towing line", "A_actions_fnc_action.sqf", [[_player, _towing_vehicle, "towing"], "A_towing_fnc_line_attach"],10,false,true,"", format['not([%1] call A_towing_fnc_line_attached) && {([%2, "towing"] call A_towing_fnc_line_attached)}', _towing_vehicle, _player]];
towing_actions = towing_actions + [_action_id];

_A_actions_fnc_action_id = player addA_actions_fnc_action ["Detach towing line", "A_actions_fnc_action.sqf", [[_player, _towing_vehicle, "towing"], "A_towing_fnc_line_detach"],10,false,true,"", format['([%1, "towing"] call A_towing_fnc_line_attached)', _towing_vehicle]];
towing_actions = towing_actions + [_action_id];


towing_actions
