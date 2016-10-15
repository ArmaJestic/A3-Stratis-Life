// A_interaction_fnc_search

#include "header.h"


ARGV(0,_player);
ARGV(1,_target);

if (!([_player] call A_player_fnc_human)) exitWith {null};
if (!([_target] call A_player_fnc_human)) exitWith {null};

if (_player != player) exitWith {null};

private["_interaction"];
_interaction = "A_missions_fnc_search";
if (!([_player, _target, _interaction] call A_interaction_fnc_check_distance)) exitWith {null};
if (!([_player, _target, _interaction] call A_interaction_fnc_check_armed)) exitWith {null};

private["_amount"];
_amount = [_target] call A_interaction_fnc_search_count;

if (_amount <= 0) exitWith {
	_player groupChat format["%1-%2 does not have any A_item_fnc_drugs", _target, (name _target)];
};

[_target, ([_target] call A_player_fnc_inventory_name), "drug"] call A_inventory_fnc_storage_remove_kind;
[_target, "(drug-possession)", _amount] call A_player_fnc_update_warrants;

//individual message to the cop
private["_message"];
_message = format["%1-%2 had A_item_fnc_drugs, you removed them. You should arrest %1-%2 or give him a ticket of $%3. ", _target, (name _target), strM(_amount/2)];
_player groupChat _message;

//global message announcing player had A_item_fnc_drugs
_message = format["%1-%2 had $%3 worth of A_item_fnc_drugs.", _target, (name _target), strM(_amount)];
[[_message], "A_interaction_fnc_title_text", true] call BIS_fnc_MP;

//individual message to the target
_message = format["%1-%2 removed your A_item_fnc_drugs.", _player, (name _player)];
[[_message], "A_interaction_fnc_chat", _player] call BIS_fnc_MP;
