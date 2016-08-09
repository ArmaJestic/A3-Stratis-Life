// A_shop_menu_fnc_build_buy_list

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_shop_id);
if (undefined(_shop_id)) exitWith {null};
if (typeName _shop_id != "SCALAR") exitWith {null};

private ["_item_buy_list", "_shop", "_crate", "_logic"];
_shop = (A_inv_var_itemshops select _shop_id);
_item_buy_list   = ( _shop select A_inv_var_itemshops_buylist);
_shop_needs_license =  (_shop select A_inv_var_itemshops_license);
_crate = (_shop select A_inv_var_itemshops_crate);
_crate = if (undefined(_crate) ) then { "" } else { _crate };
_logic = (_shop select A_inv_var_itemshops_logic);
_logic = if (undefined(_logic) ) then { "" } else { _logic };


private["_i", "_shop_buy_list", "_count"];
_shop_buy_list = [];
_count = count _item_buy_list;
_i = 0;
while { _i < _count } do {
	private ["_data", "_item", "_infos", "_price", "_name", "_isItem", "_weight_str", "_label", 
			"_license_1", "_license_2", "_icon", "_class", "_type", "_kind", "_icon"];
	_item = _item_buy_list select _i;
	_infos = _item call A_inventory_fnc_get_item_array;
	_price = _infos call A_inventory_fnc_get_item_buy_cost;
	_name  = (MASTER_ARRAY_ITEM_NAME(_infos));
	_isItem = (_infos call A_inventory_fnc_get_item_type == "Item");
	_license_1 = _infos call A_inventory_fnc_get_license_1;
	_license_2 = _infos call A_inventory_fnc_get_license_2;
	_class = if(!(_isItem)) then { _infos call A_inventory_fnc_get_item_class } else { "" };
	_type = _infos call A_inventory_fnc_get_item_type;
	_kind = _infos call A_inventory_fnc_get_item_kind;
	_kind = if (undefined(_kind)) then { "" } else { _kind };
	_icon = [_item, _class, _type] call A_object_fnc_icon;
	//player groupChat format["_icon = %1", _icon];
	
 
	_weight_str = if (_isItem) then {format[" - %1kg", ITEM_DATA_WEIGHT(_infos)] } else { "" };
	_label = format["%1 ($%2%3)", _name, strM(_price), _weight_str];
	
	_data = [];
	_data set [A_shop_menu_var_buy_item_key, _item];
	_data set [A_shop_menu_var_buy_item_price, [_price] call A_encoding_fnc_encode_number];
	_data set [A_shop_menu_var_buy_item_index, _i];
	_data set [A_shop_menu_var_buy_item_label, _label];
	_data set [A_shop_menu_var_buy_item_shop_id, _shop_id];
	_data set [A_shop_menu_var_buy_item_name, _name];
	_data set [A_shop_menu_var_buy_item_license_1, _license_1];
	_data set [A_shop_menu_var_buy_item_license_2, _license_2];
	_data set [A_shop_menu_var_buy_item_needs_license, _shop_needs_license];
	_data set [A_shop_menu_var_buy_item_crate_netid, (netId _crate)];
	_data set [A_shop_menu_var_buy_item_logic_netid, (netId _logic)];
	_data set [A_shop_menu_var_buy_item_class, _class];
	_data set [A_shop_menu_var_buy_item_type, _type];
	_data set [A_shop_menu_var_buy_item_kind, _kind];
	_data set [A_shop_menu_var_buy_item_icon, _icon];
	_shop_buy_list set [_i, _data];
	_i = _i + 1;
};

[_shop_id, _shop_buy_list] call A_shop_menu_fnc_set_buy_items;
