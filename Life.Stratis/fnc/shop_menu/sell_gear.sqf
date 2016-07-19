// A_shop_menu_fnc_sell_gear

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_data);

if (undefined(_data)) exitWith {null};
if (typeName _data != "ARRAY") exitWith {null};

private ["_class", "_total_return", "_class", "_item_name", "_i", "_amount", "_type"];

_item_name = _data select A_shop_menu_var_sell_item_name;
_class = _data select A_shop_menu_var_sell_item_class;
_total_return = _data select A_shop_menu_var_sell_item_total_return;
_amount = _data select A_shop_menu_var_sell_item_amount;
_type = _data select A_shop_menu_var_sell_item_type;

call A_shop_menu_fnc_play_animation;

_i = _amount;
//for weapon, and backpack, it's always one item 
while { _i > 0 } do {
	if (_type == "Weapon") then {
		player removeWeapon _class;
	}
	else { if (_type == "Magazine") then {
		player removeMagazine _class;
	}
	else { if (_type == "backpack") then {
		removeBackpack player;
	}
	else { if (_type == "Vest" || 
				_type == "Uniform" || _type == "LinkedItem" ||
				_type == "BISItem" || _type == "Headgear" ||
				_type == "Goggles" || _type == "Attachment") then {
		[player, _class] call A_bis_expected_fnc_removePlayerInventoryItem;
	};};};};

	_i = _i - 1;
};

player groupChat format["You sold %1 %2 for $%3", _amount, _item_name, strM(_total_return)];	
