// A_shop_menu_fnc_build_sell_list

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


//player groupChat format["A_shop_menu_fnc_build_sell_list %1", _this];

ARGV(0,_shop_id);
if (undefined(_shop_id)) exitWith {null};
if (typeName _shop_id != "SCALAR") exitWith {null};

private["_shop", "_logic", "_item_sell_list"];
_shop =  (INV_ItemShops select _shop_id);
_logic = (_shop select INV_ItemShops_Logic);
_logic = if (undefined(_logic) ) then { "" } else { _logic };
_item_sell_list  = (_shop select INV_ItemShops_SellList);

private["_count", "_shop_sell_list", "_i"];
_count = count _item_sell_list;
_shop_sell_list = [];
_i = 0;

while { _i < _count } do {
	private ["_data", "_item", "_infos", "_price", "_name", "_isItem", "_weight_str", "_label", "_class", "_type", "_kind"];
	_item = _item_sell_list select _i;
	_infos = _item call A_inventory_fnc_get_item_array;
	_price = _infos call A_inventory_fnc_get_item_sell_cost;
	_name =  (MASTER_ARRAY_ITEM_NAME(_infos));

	_isItem = (_infos call A_inventory_fnc_get_item_type == "Item");
	_isDroppable = if (_isItem) then {(_item call A_inventory_fnc_get_item_droppable)} else { false };
	_class = if(not(_isItem)) then { _infos call A_inventory_fnc_get_item_class } else { "" };
	_type = _infos call A_inventory_fnc_get_item_type;
	_kind = _infos call A_inventory_fnc_get_item_kind;
	_kind = if (undefined(_kind)) then { "" } else { _kind };
	_icon = [_item, _class, _type] call A_object_fnc_icon;
	
	_weight_str = if (_isItem) then {format[" - %1kg", ITEM_DATA_WEIGHT(_infos)] } else { "" };
	_label = format["%1 ($%2%3)", _name, strM(_price), _weight_str];
	
	
	
	_data = [];
	_data set [A_shop_menu_var_sell_item_key, _item];
	_data set [A_shop_menu_var_sell_item_price, ([_price] call A_encoding_fnc_encode_number)];
	_data set [A_shop_menu_var_sell_item_index, _i];
	_data set [A_shop_menu_var_sell_item_label, _label];
	_data set [A_shop_menu_var_sell_item_shop_id, _shop_id];
	_data set [A_shop_menu_var_sell_item_name, _name];
	_data set [A_shop_menu_var_sell_item_logic_netid, (netId _logic)];
	_data set [A_shop_menu_var_sell_item_class, _class];
	_data set [A_shop_menu_var_sell_item_type, _type];
	_data set [A_shop_menu_var_sell_item_kind, _kind];
	_data set [A_shop_menu_var_sell_item_icon, _icon];
	
	
	_shop_sell_list set [_i, _data];
	_i = _i + 1;
};

[_shop_id, _shop_sell_list] call A_shop_menu_fnc_set_sell_items;
