// A_player_fnc_drop_inventory

#include "..\..\includes\macro.h"


ARGV(0,_player);
if (not([_player] call A_player_fnc_exists)) exitWith {null};

if ([_player] call A_player_fnc_blufor) then {
	private["_amount"];	
	_amount = ([_player, "money"] call A_inventory_fnc_get_item_amount);
	if (_amount <= 0) exitWith {null};
	
	[_player, "money", _amount] call A_player_fnc_drop_item;
	[_player, "money", -(_amount)] call A_inventory_fnc_add_item;
}
else {
	private["_i"];
	_i = 0;
	
	private["_inventory"];
	_inventory = [_player] call A_player_fnc_get_inventory;
	if (undefined(_inventory)) exitWith {};
	while { _i < (count _inventory) } do {
		private["_item", "_amount"];
		_item   = ((_inventory select _i) select 0);
		_amount = ([player, _item] call A_inventory_fnc_get_item_amount);

		if (_amount > 0 and (_item call A_inventory_fnc_get_item_droppable)) then {
			[_player, _item, _amount] call A_player_fnc_drop_item;
		};
		_i = _i + 1;
	};
	[_player] call A_player_fnc_reset_side_inventory;
};
