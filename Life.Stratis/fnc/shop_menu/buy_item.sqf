// A_shop_menu_fnc_buy_item

#include "header.h"


ARGV(0,_data);

if (UNDEFINED(_data)) exitWith {null};
if (typeName _data != "ARRAY") exitWith {null};
private ["_amount", "_item", "_total_due", "_shop_id", "_item_name"];

_total_due = [(_data select INDEX_BUY_TOTAL_DUE)] call A_encoding_fnc_decode_number;
_amount = _data select INDEX_BUY_AMOUNT;
_item_name = _data select INDEX_BUY_NAME;
_item = _data select INDEX_BUY_KEY;
_shop_id = _data select INDEX_BUY_SHOP_ID;
_kind =  _data select INDEX_BUY_KIND;
_isDrug = (_kind == "drug");

if (_isDrug && _total_due > 0) then {
	[_shop_id, _total_due] call A_shop_menu_fnc_distribute_drug_sale;
};

call A_shop_menu_fnc_play_animation;
[player, _item, _amount, ([player] call A_player_fnc_inventory_name)] call A_inv_fnc_createitem;
player groupChat format["You bought %1 %2 for $%3", _amount, _item_name, strM(_total_due)];
