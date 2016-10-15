// A_shop_menu_fnc_sell_item

#include "header.h"


params[["_data",null,[[]]]];

if (UNDEFINED(_data)) exitWith {null};

private _item = _data select INDEX_SELL_KEY;
private _item_name = _data select INDEX_SELL_NAME;
private _total_return = _data select INDEX_SELL_TOTAL_RETURN;
private _amount = _data select INDEX_SELL_AMOUNT;
private _type = _data select INDEX_SELL_TYPE;
private _kind = _data select INDEX_SELL_KIND;
private _isDrug = (_kind == "drug");
private _price = [(_data select INDEX_SELL_PRICE)] call A_encoding_fnc_decode_number;
private _shop_id = _data select INDEX_SELL_SHOP_ID;

call A_shop_menu_fnc_play_animation;

//keep track of wh has sold A_item_fnc_drugs
if (_isDrug) then {
	private _list  = [];
	_list set [INDEX_DRUG_PLAYER_UID, getPlayerUID player];
	_list set [INDEX_DRUG_PROFIT, _total_return];
	[_shop_id, _list] call A_shop_menu_fnc_update_drug_list;
};

[player, _item, -(_amount)] call A_inventory_fnc_add_item;
player groupChat format ["You sold %1 %2 for $%3", _amount, _item_name, strM(_total_return)];