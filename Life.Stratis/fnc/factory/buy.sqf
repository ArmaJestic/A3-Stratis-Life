// A_factory_fnc_buy

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


ARGV(0,_player);
ARGV(1,_factory_id);

if (!([_player] call A_player_fnc_human)) exitWith {null};
if (undefined(_factory_id)) exitWith {null};
if (typeName _factory_id != "STRING") exitWith {null};

private["_factory", "_factory_cost"];
_factory = [_factory_id] call A_factory_fnc_lookup_id;
if (undefined(_factory)) exitWith {null};
_factory_cost = _factory select factory_cost;

if (_factory_id in INV_Fabrikowner) exitWith {
	player groupChat format["%1-%2, you already own this factory", _player, (name _player)];
};

private["_money"];	
_money = [_player, "money"] call A_inventory_fnc_get_item_amount;
if (_money < _factory_cost) exitWith {
	player groupChat format["%1-%2, you do not have enough money in your inventory to buy this factory", _player, (name _player)];
};

[_player, "money", -(_factory_cost)] call A_inventory_fnc_add_item;
INV_Fabrikowner = INV_Fabrikowner + [ _factory_id ];
["INV_Fabrikowner", INV_Fabrikowner] spawn A_stats_fnc_client_save;


player groupChat format["%1-%2, you bought this factory for $%3", _player, (name _player), strM(_factory_cost)];
[_player] call A_factory_fnc_remove_actions;
