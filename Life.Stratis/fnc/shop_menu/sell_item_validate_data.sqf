// A_shop_menu_fnc_sell_item_validate_data

#include "../../includes/constants.h"
#include "../../includes/macro.h"


ARGV(0,_data);
if (undefined(_data)) exitWith {null};

private ["_index", "_item", "_base_price", "_price", "_infos", "_amount", "_total_price", "_shop_id", "_supply", "_max_stock"];
private ["_sales_tax", "_market_adjust", "_name", "_kind", "_label", "_control", "_type", "_tax"];
private ["_weight_str", "_base_weight","_weight", "_price_str", "_buy_label", "_limitedStock", "_isItem", "_isIllegal"];
private ["_amount_str", "_class", "_logic", "_quiet", "_demand_str", "_isOilBarrel"];
private["_isLinkedItem", "_isAttachment", "_isUniform", "_isVest", "_isHeadgear", "_isGoggles", "_isBISItem"];
private["_hasLinkedItem", "_hasAttachment", "_hasUniform", "_hasVest", "_hasHeadgear", "_hasGoggles", "_hasBISItem"];


_quiet = if (count _this > 1) then { _this select 1; } else { false };
if (not(_quiet)) then {
	call A_shop_menu_fnc_reset_sell_labels;
};

if ((call A_shop_menu_fnc_is_busy)) exitWith {
	[format["Shop is currently busy, please wait"], _quiet] call A_shop_menu_fnc_set_status_message; null;
};

_sellableItems = ["Item", "Weapon", "Magazine", "Vehicle", "backpack", "BISItem", "LinkedItem", "Attachment", "Vest", "Uniform", "Headgear", "Goggles"];

_shop_id  = _data select A_shop_menu_var_sell_item_shop_id;
_item = _data select A_shop_menu_var_sell_item_key;
_base_price = [(_data select A_shop_menu_var_sell_item_price)] call A_encoding_fnc_decode_number;
_infos = _item call A_inventory_fnc_get_item_array;
_logic = objectFromNetId(_data select A_shop_menu_var_sell_item_logic_netid);
_supply = [_item, _shop_id] call A_inventory_fnc_get_stock;
_max_stock = [_item, _shop_id] call A_inventory_fnc_get_max_stock;
_isOilBarrel = (_item == "OilBarrel");

_type = _data select A_shop_menu_var_sell_item_type;
_limitedStock = (_max_stock != -1);
_isItem = (_type == "Item");
_isWeapon = (_type == "Weapon");
_isMagazine = (_type == "Magazine");
_isVehicle = (_type == "Vehicle");
_isBackpack = (_type == "backpack");
_isLinkedItem = (_type == "LinkedItem");
_isAttachment = (_type == "Attachment");
_isUniform = (_type == "Uniform");
_isVest = (_type == "Vest");
_isHeadgear = (_type == "Headgear");
_isGoggles = (_type == "Goggles");
_isBISItem = (_type == "BISItem");

_class = _data select A_shop_menu_var_sell_item_class;
_demand = if (_limitedStock) then { _max_stock - _supply } else { -1 };

_weapons = (weapons player);
_magazines = (magazines player);
_vehicles = [player, _class, _item, 50] call A_shop_menu_fnc_get_vehicles_by_class_item;

_weapon_count = if (_isWeapon) then { ({_x == _class} count _weapons ) } else { 0 };
_weapon_count = if (undefined(_weapon_count)) then { 0 } else { _weapon_count };

_magazine_count = if (_isMagazine) then {({_x == _class} count _magazines) } else { 0 };
_magazine_count = if (undefined(_magazine_count)) then { 0 } else { _magazine_count };
_item_count = if (_isItem) then { ([player, _item] call A_inventory_fnc_get_item_amount) } else { 0 };
_item_count = if (undefined(_item_count)) then { 0 } else { _item_count };
_vehicle_count = if (_isVehicle) then { count (_vehicles) } else { 0 };
_vehicle_count = if (undefined(_vehicle_count)) then {0} else {_vehicle_count};
_vehicle_alive_count = if (_vehicle_count > 0) then {({alive _x} count _vehicles)} else { 0 }; 
_vehicle_alive_count = if (undefined(_vehicle_alive_count)) then { 0 } else { _vehicle_alive_count };
_vehicle_near_count = if (_vehicle_alive_count > 0)  then {({((alive _x) && ((_x distance player) < 50))} count _vehicles) } else { 0 }; 
_vehicle_near_count = if (undefined(_vehicle_near_count)) then {0} else {_vehicle_near_count};
_hasBackpack = if (_isBackpack) then { _class == typeOf(unitBackpack player); } else { false };

_all_items = [player] call A_player_fnc_get_all_items;

_linked_items_count = if (_isLinkedItem) then {({_x == _class} count _all_items)} else {0};
_bis_items_count = if (_isBISItem) then {({_x == _class} count _all_items)} else {0};
_uniform_count = if (_isUniform) then {({_x == _class} count _all_items)} else {0};
_attachments_count = if (_isAttachment) then {({_x == _class} count _all_items)} else {0};
_goggles_count = if (_isGoggles) then {({_x == _class} count _all_items)} else {0};
_headgear_count = if (_isHeadgear) then {({_x == _class} count _all_items)} else {0};
_vest_count = if (_isVest) then {({_x == _class} count _all_items)} else {0};

_tax = [_type] call A_economy_menu_fnc_lookup_tax_value_type;
_kind = _data select A_shop_menu_var_sell_item_kind;


_base_weight = if (_isItem) then {ITEM_DATA_WEIGHT(_infos)} else { 0 };
_isIllegal = if(_isItem) then {(_item call A_inventory_fnc_get_item_illegal)} else { false };

_amount_str = (ctrlText sell_items_to_sell_field_idc);

_amount = if (_amount_str == "") then { 0 } else {[_amount_str] call A_misc_fnc_parse_number };
_amount = if (_amount < 0 ) then { ctrlSetText [sell_items_to_sell_field_idc, "1"]; 1 } else {_amount};
_amount = if (_amount > 100) then { ctrlSetText [sell_items_to_sell_field_idc, "100"]; 100 } else { _amount };

if (_amount <= 0) exitWith {
	["You have entered an invalid amount of items to sell", _quiet] call A_shop_menu_fnc_set_status_message; null
};


if (_isOilBarrel) then {
	_max_stock = (call A_shop_menu_fnc_get_oil_barrel_max_stock);
	_demand = (call A_shop_menu_fnc_get_oil_barrel_demand);
	_supply =  _max_stock - _demand;
	_limitedStock  = true;
};

_price = _base_price * _amount;
_weight = _base_weight * _amount;

//add the sales tax to the price
_sales_tax = round(_price *  (_tax/100));

_market_adjust = [_item, _amount, _base_price, _supply, _max_stock] call A_shop_menu_fnc_get_market_adjustment;

_market_adjust = round(_market_adjust);
_sales_tax = round(_sales_tax);
_total_price = round(_price + _sales_tax + _market_adjust);

_weight_str = if (_weight > 0) then { format["(%1kg)", _weight] } else { "" };
_demand_str = if (_limitedStock) then { format["%1/%2",_demand, _max_stock] } else { "Unlimited" };
_salesTax_str = format["$%1", strM(_sales_tax)];
_marketAdjust_str = format["$%1", strM(_market_adjust)];
_totalReturn_str = format["$%1", strM(_total_price)];
_sell_label = format["Sell%1",_weight_str];

if (not(_quiet)) then {
	ctrlSetText [sell_demand_field_idc, _demand_str];
	ctrlSetText [sell_sales_tax_field_idc, _salesTax_str];
	ctrlSetText [sell_market_ajust_field_idc, _marketAdjust_str];
	ctrlSetText [sell_total_return_field_idc, _totalReturn_str];
	ctrlSetText [sell_button_idc, _sell_label];
};

if(not(_type in _sellableItems)) exitWith {
	["The item you have selected to sell, is not an item that can be sold", _quiet] call A_shop_menu_fnc_set_status_message; null
};

if(_limitedStock && _demand == 0 && not(_isOilBarrel)) exitWith {
	["The item you have selected to sell has currently no demand", _quiet] call A_shop_menu_fnc_set_status_message; null
};

if (_isBISItem && _bis_items_count == 0) exitWith {
	["You do not have any of the selected item to sell", _quiet] call A_shop_menu_fnc_set_status_message; null
};

if (_isAttachment && _attachments_count == 0) exitWith {
	["You do not have any of the selected attachment to sell", _quiet] call A_shop_menu_fnc_set_status_message; null
};

if (_isGoggles && _goggles_count == 0) exitWith {
	["You do not have any of the selected goggles to sell", _quiet] call A_shop_menu_fnc_set_status_message; null
};

if (_isHeadgear && _headgear_count == 0) exitWith {
	["You do not have any of the selected headgear to sell", _quiet] call A_shop_menu_fnc_set_status_message; null
};

if (_isVest && _vest_count == 0) exitWith {
	["You do not have any of the selected vest to sell", _quiet] call A_shop_menu_fnc_set_status_message; null
};

if (_isUniform && _uniform_count == 0) exitWith {
	["You do not have any of the selected uniform to sell", _quiet] call A_shop_menu_fnc_set_status_message; null
};

if (_isLinkedItem && _linked_items_count == 0) exitWith {
	["You do not have any of the selected item to sell", _quiet] call A_shop_menu_fnc_set_status_message; null
};

if (_isWeapon && _weapon_count == 0) exitWith {
	["You do not have the selected weapon to sell", _quiet] call A_shop_menu_fnc_set_status_message; null
};

if (_isItem && _item_count == 0) exitWith {
	["You do not have any of the selected item to sell", _quiet] call A_shop_menu_fnc_set_status_message; null
};

if (_isItem && _amount > _item_count) exitWith {
	["You are trying to sell more than the amount of items you have", _quiet] call A_shop_menu_fnc_set_status_message; null
};

if (_isMagazine && _magazine_count == 0) exitWith {
	["You do not have any of the selected magazine/ammunition to sell", _quiet] call A_shop_menu_fnc_set_status_message; null
};

if (_isMagazine && _amount  > _magazine_count) exitWith {
	["You are trying to sell more than the amount of magazines/ammution you have", _quiet] call A_shop_menu_fnc_set_status_message; null
};

if(_isVehicle && _vehicle_count == 0) exitWith {
	["You do not own any vehicles of the selected type to sell", _quiet] call A_shop_menu_fnc_set_status_message; null
};

if (_isVehicle && _vehicle_alive_count == 0) exitWith {
	["You do not own any vehicles of the selected type that are alive", _quiet] call A_shop_menu_fnc_set_status_message; null
};

if (_isVehicle && _vehicle_near_count == 0) exitWith {
	["You do not own any vehicles of the selected type that are near this shop", _quiet] call A_shop_menu_fnc_set_status_message; null
};

if (_isBackpack && not(_hasBackpack)) exitWith {
	["You do not have the selected backpack to sell", _quiet] call A_shop_menu_fnc_set_status_message; null
};

if (_amount > 1 && (_isWeapon || _isVehicle || _isBackpack )) exitWith {
	["The item you have selected can only be sold one at a time", _quiet] call A_shop_menu_fnc_set_status_message; null
};

if (_isMagazine && _amount > _magazine_count) then {
	["You are trying to sell more magazines/ammution than the amount you have", _quiet] call A_shop_menu_fnc_set_status_message; null
};

if (_limitedStock && _amount > _demand && not(_isOilBarrel)) exitWith {
	["You are trying to sell more than the current demand for this item", _quiet] call A_shop_menu_fnc_set_status_message; null
};

if (_isIllegal && isblu) exitWith {
	 ["The selected item is illegal, you are not allowed to sell it", _quiet]  call A_shop_menu_fnc_set_status_message; null
};

_data set [A_shop_menu_var_sell_item_total_return, _total_price];
_data set [A_shop_menu_var_sell_item_sales_tax, _sales_tax];
_data set [A_shop_menu_var_sell_item_market_adjust, _market_adjust];
_data set [A_shop_menu_var_sell_item_max_stock, _max_stock];
_data set [A_shop_menu_var_sell_item_demand, _demand];
_data set [A_shop_menu_var_sell_item_supply, _supply];
_data set [A_shop_menu_var_sell_item_legal, not(_isIllegal)];
_data set [A_shop_menu_var_sell_item_amount, _amount];

_data
