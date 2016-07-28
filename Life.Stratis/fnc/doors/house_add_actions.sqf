// A_doors_fnc_house_add_actions

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


if (count house_actions > 0) exitWith {};
ARGV(0,_player);
ARGV(1,_house);

if (not([_player] call A_player_fnc_human)) exitWith {};
if (undefined(_house)) exitWith {};

private["_object", "_door"];
_object = _house select A_doors_var_house_data_object;
_door = _house select A_doors_var_house_data_door;

private["_action_id"];
_A_actions_fnc_action_id = player addA_actions_fnc_action ["<t color='#dddd00'>Lock door</t>", "A_actions_fnc_action.sqf", [[_house, 1], "A_doors_fnc_house_door_lock"],10,false,false,"", format["not([[(objectFromNetId '%1'), '%2']] call A_doors_fnc_A_doors_fnc_house_door_locked) && {([(objectFromNetId '%1'), %3] call A_doors_fnc_house_player_owner)}", (netId _object), _door, _player]];
house_actions = house_actions + [_action_id];

_A_actions_fnc_action_id = player addA_actions_fnc_action ["<t color='#dddd00'>Unlock door</t>", "A_actions_fnc_action.sqf", [[_house, 0], "A_doors_fnc_house_door_lock"],10,false,false,"", format["([[(objectFromNetId '%1'), '%2']] call A_doors_fnc_A_doors_fnc_house_door_locked) && {([(objectFromNetId '%1'), %3] call A_doors_fnc_house_player_owner)}", (netId _object), _door, _player]];
house_actions = house_actions + [_action_id];

_A_actions_fnc_action_id = player addA_actions_fnc_action ["<t color='#dddd00'>Open door</t>", "A_actions_fnc_action.sqf", [[_house, 1], "A_doors_fnc_house_door_move"],10,false,false,"", format["not([[(objectFromNetId '%1'), '%2']] call A_doors_fnc_house_door_locked) && {([[(objectFromNetId '%1'), '%2']] call A_doors_fnc_house_door_closed)}", (netId _object), _door]];
house_actions = house_actions + [_action_id];

_A_actions_fnc_action_id = player addA_actions_fnc_action ["<t color='#dddd00'>Close door</t>", "A_actions_fnc_action.sqf", [[_house, 0], "A_doors_fnc_house_door_move"],10,false,false,"", format["not([[(objectFromNetId '%1'), '%2']] call A_doors_fnc_house_door_locked) && {not([[(objectFromNetId '%1'), '%2']] call A_doors_fnc_house_door_closed)}", (netId _object), _door]];
house_actions = house_actions + [_action_id];

_A_actions_fnc_action_id = player addA_actions_fnc_action ["<t color='#dddd00'>Knock</t>", "A_actions_fnc_action.sqf", [[_player], "A_doors_fnc_house_door_knock"],10,false,true,"", format["([[(objectFromNetId '%1'), '%2']] call A_doors_fnc_house_door_locked) && {([[(objectFromNetId '%1'), '%2']] call A_doors_fnc_house_door_closed)}", (netId _object), _door]];
house_actions = house_actions + [_action_id];

_A_actions_fnc_action_id = player addA_actions_fnc_action [format["<t color='#dddd00'>Sell house ($%1)</t>",strM(A_doors_var_A_doors_fnc_house_sell_price)], "A_actions_fnc_action.sqf", [[_player, _object], "A_doors_fnc_house_sell"],10,false,true,"", format["not([[(objectFromNetId '%1'), '%2']] call A_doors_fnc_house_door_locked) && {([(objectFromNetId '%1'), %3] call A_doors_fnc_house_player_owner)}", (netId _object), _door, _player]];
house_actions = house_actions + [_action_id];

_A_actions_fnc_action_id = player addA_actions_fnc_action [format["<t color='#dddd00'>Buy house ($%1)</t>",strM(A_doors_var_A_doors_fnc_house_buy_price)], "A_actions_fnc_action.sqf", [[_player, _object], "A_doors_fnc_house_buy"],10,false,true,"", format["([(objectFromNetId '%1')] call A_doors_fnc_house_available) && {not([%2] call A_doors_fnc_house_player_home_owner)}", (netId _object), _player]];
house_actions = house_actions + [_action_id];

_A_actions_fnc_action_id = player addA_actions_fnc_action ["<t color='#dddd00'>House information</t>", "A_actions_fnc_action.sqf", [[_object], "A_doors_fnc_house_information"],10,false,true,"", format["not([(objectFromNetId '%1')] call A_doors_fnc_house_available) && {not([(objectFromNetId '%1'), %2] call A_doors_fnc_house_player_owner)}", (netId _object), _player]];
house_actions = house_actions + [_action_id];
