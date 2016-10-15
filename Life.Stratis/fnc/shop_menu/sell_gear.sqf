// A_shop_menu_fnc_sell_gear

#include "header.h"


params[["_data",null,[[]]]];
if (UNDEFINED(_data)) exitWith {null};

private _item_name = _data select INDEX_SELL_NAME;
private _class = _data select INDEX_SELL_CLASS;
private _total_return = _data select INDEX_SELL_TOTAL_RETURN;
private _amount = _data select INDEX_SELL_AMOUNT;
private _type = _data select INDEX_SELL_TYPE;

call A_shop_menu_fnc_play_animation;

_i = _amount;
//for weapon, and backpack, it's always one item 
while { _i > 0 } do {
	if (_type == "Weapon") then {
		player removeWeapon _class;
	}else{ if (_type == "Magazine") then {
		player removeMagazine _class;
	}else{ if (_type == "backpack") then {
		removeBackpack player;
	}else{ if (_type == "Vest" || 
				_type == "Uniform" || _type == "LinkedItem" ||
				_type == "BISItem" || _type == "Headgear" ||
				_type == "Goggles" || _type == "Attachment") then {
		[player, _class] call A_bis_expected_fnc_removePlayerInventoryItem;
	};};};};

	_i = _i - 1;
};

player groupChat format["You sold %1 %2 for $%3", _amount, _item_name, strM(_total_return)];	