// A_shop_menu_fnc_sell_item

#include "../../includes/constants.h"
#include "../../includes/macro.h"


ARGV(0,_data);

if (undefined(_data)) exitWith {null};
if (typeName _data != "ARRAY") exitWith {null};

private ["_item", "_total_return", "_item_name", "_i", "_amount", "_type", "_isDrug", "_price","_kind"];

_item = _data select A_shop_menu_var_sell_item_key;
_item_name = _data select A_shop_menu_var_sell_item_name;
_total_return = _data select A_shop_menu_var_sell_item_total_return;
_amount = _data select A_shop_menu_var_sell_item_amount;
_type = _data select A_shop_menu_var_sell_item_type;
_kind = _data select A_shop_menu_var_sell_item_kind;
_isDrug = (_kind == "drug");
_price = [(_data select A_shop_menu_var_sell_item_price)] call A_encoding_fnc_decode_number;
_shop_id = _data select A_shop_menu_var_sell_item_shop_id;

call A_shop_menu_fnc_play_animation;

//keep track of wh has sold drugs
if (_isDrug) then {
	private["_list"];
	_list  = [];
	_list set [A_shop_menu_var_drug_list_player_uid, getPlayerUID player];
	_list set [A_shop_menu_var_drug_list_profit, _total_return];
	[_shop_id, _list] call A_shop_menu_fnc_update_drug_list;
};

[player, _item, -(_amount)] call A_inventory_fnc_add_item;
player groupChat format ["You sold %1 %2 for $%3", _amount, _item_name, strM(_total_return)];
