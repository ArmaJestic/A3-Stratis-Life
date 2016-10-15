// A_doors_fnc_house_add_actions

#include "header.h"


if (count A_doors_var_actions > 0) exitWith {};
params["_player","_house"];

if (!([_player] call A_player_fnc_human)) exitWith {};
if (UNDEFINED(_house)) exitWith {};

private _object = _house select INDEX_OBJECT;
private _door = _house select INDEX_DOOR;

// Optimal method
{
	A_doors_var_actions pushBack (player addAction _x);
} forEach [
	["<t color='#dddd00'>Lock door</t>", A_actions_fnc_action, [[_house, 1], "A_doors_fnc_house_door_lock"],10,false,false,"", format["!([[(objectFromNetId '%1'), '%2']] call A_doors_fnc_house_door_locked) && {([(objectFromNetId '%1'), %3] call A_doors_fnc_house_player_owner)}", (netId _object), _door, _player]],
	["<t color='#dddd00'>Unlock door</t>", A_actions_fnc_action, [[_house, 0], "A_doors_fnc_house_door_lock"],10,false,false,"", format["([[(objectFromNetId '%1'), '%2']] call A_doors_fnc_house_door_locked) && {([(objectFromNetId '%1'), %3] call A_doors_fnc_house_player_owner)}", (netId _object), _door, _player]],
	["<t color='#dddd00'>Open door</t>", A_actions_fnc_action, [[_house, 1], "A_doors_fnc_house_door_move"],10,false,false,"", format["!([[(objectFromNetId '%1'), '%2']] call A_doors_fnc_house_door_locked) && {([[(objectFromNetId '%1'), '%2']] call A_doors_fnc_house_door_closed)}", (netId _object), _door]],
	["<t color='#dddd00'>Close door</t>", A_actions_fnc_action, [[_house, 0], "A_doors_fnc_house_door_move"],10,false,false,"", format["!([[(objectFromNetId '%1'), '%2']] call A_doors_fnc_house_door_locked) && {!([[(objectFromNetId '%1'), '%2']] call A_doors_fnc_house_door_closed)}", (netId _object), _door]],
	["<t color='#dddd00'>Knock</t>", A_actions_fnc_action, [[_player], "A_doors_fnc_house_door_knock"],10,false,true,"", format["([[(objectFromNetId '%1'), '%2']] call A_doors_fnc_house_door_locked) && {([[(objectFromNetId '%1'), '%2']] call A_doors_fnc_house_door_closed)}", (netId _object), _door]],
	[format["<t color='#dddd00'>Sell house ($%1)</t>",strM(SELL_PRICE)], A_actions_fnc_action, [[_player, _object], "A_doors_fnc_house_sell"],10,false,true,"", format["!([[(objectFromNetId '%1'), '%2']] call A_doors_fnc_house_door_locked) && {([(objectFromNetId '%1'), %3] call A_doors_fnc_house_player_owner)}", (netId _object), _door, _player]],
	[format["<t color='#dddd00'>Buy house ($%1)</t>",strM(BUY_PRICE)], A_actions_fnc_action, [[_player, _object], "A_doors_fnc_house_buy"],10,false,true,"", format["([(objectFromNetId '%1')] call A_doors_fnc_house_available) && {!([%2] call A_doors_fnc_house_player_home_owner)}", (netId _object), _player]],
	["<t color='#dddd00'>House information</t>", A_actions_fnc_action, [[_object], "A_doors_fnc_house_information"],10,false,true,"", format["!([(objectFromNetId '%1')] call A_doors_fnc_house_available) && {!([(objectFromNetId '%1'), %2] call A_doors_fnc_house_player_owner)}", (netId _object), _player]]
];