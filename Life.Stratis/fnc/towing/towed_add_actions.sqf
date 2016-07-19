// A_towing_fnc_towed_add_actions

#include "../../includes/constants.h"
#include "../../includes/macro.h"


if (count towed_actions > 0) exitWith {};
ARGV(0,_player);
ARGV(1,_towed_net_id);
//player groupChat format["A_towing_fnc_towed_add_actions %1", _this];

if (not([_player] call A_player_fnc_human)) exitWith {};
if (undefined(_towed_net_id)) exitWith {};
if (typeName _towed_net_id != "STRING") exitWith {};

private["_towed_vehicle"];
_towed_vehicle = objectFromNetId _towed_net_id;
if (undefined(_towed_vehicle)) exitWith {};


private["_action_id"];
_action_id = player addaction ["Attach towing line", "action.sqf", [[_player, _towed_vehicle, "towed"], "A_towing_fnc_line_attach"],10,false,true,"", format['not([%1] call A_towing_fnc_line_attached) && {([%2, "towed"] call A_towing_fnc_line_attached)}', _towed_vehicle, _player]];
towed_actions = towed_actions + [_action_id];

_action_id = player addaction ["Detach towing line", "action.sqf", [[_player, _towed_vehicle, "towed"], "A_towing_fnc_line_detach"],10,false,true,"", format['([%1, "towed"] call A_towing_fnc_line_attached)', _towed_vehicle]];
towed_actions = towed_actions + [_action_id];

towed_actions
