// A_interaction_fnc_search_count

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"


ARGV(0,_target);
if (not([_target] call A_player_fnc_human)) exitWith {0};

private["_i", "_drugs_value"];
_drugs_value = 0;
_i = 0;

private["_inventory"];
_inventory = [_target] call A_player_fnc_get_inventory;

while { _i <  (count _inventory) } do {
	private["_item", "_infos"];
	_item   = ((_inventory select _i) select 0);
	_infos  = _item call A_inventory_fnc_get_item_array;
	
	if(toLower(_item call A_inventory_fnc_get_item_kind) == "drug") then {
		private["_amount", "_price"];
		_amount = ([_target, _item] call A_inventory_fnc_get_item_amount);
		_price  = (_infos call A_inventory_fnc_get_item_buy_cost);
		_drugs_value = _drugs_value + (_price*_amount);
	};
	_i = _i + 1;
};

_drugs_value
