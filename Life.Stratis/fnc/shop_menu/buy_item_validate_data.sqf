// A_shop_menu_fnc_buy_item_validate_data

#include "../../includes/constants.h"
#include "../../includes/macro.h"


ARGV(0,_data);
if (undefined(_data)) exitWith {null};

private ["_index", "_item", "_base_price", "_price", "_infos", "_amount", "_total_price", "_shop_id", "_shop", "_shop_object", "_supply", "_max_stock"];
private ["_sales_tax", "_market_adjust", "_name", "_kind", "_label", "_data", "_control", "_type", "_tax"];
private ["_weight_str", "_base_weight", "_weight", "_price_str", "_buy_label", "_limitedStock", "_isItem", "_isIllegal"];
private ["_amount_str", "_class", "_logic", "_quiet", "_supply_str"];
private["_isLinkedItem", "_isAttachment", "_isUniform", "_isVest", "_isHeadgear", "_isGoggles", "_isBISItem"];
private["_hasLinkedItem", "_hasAttachment", "_hasUniform", "_hasVest", "_hasHeadgear", "_hasGoggles", "_hasBISItem"];


_quiet = if (count _this > 1) then { _this select 1 } else {  false };
if (not(_quiet)) then {
	call A_shop_menu_fnc_reset_buy_labels;
};


if ((call A_shop_menu_fnc_is_busy)) exitWith {
	[format["Shop is currently busy, please wait"], _quiet] call A_shop_menu_fnc_set_status_message; null
};


_shop_id  = _data select A_shop_menu_var_buy_item_shop_id;
_item = _data select A_shop_menu_var_buy_item_key;
_base_price = [(_data select A_shop_menu_var_buy_item_price)] call A_encoding_fnc_decode_number;
_infos = _item call A_inventory_fnc_get_item_array;
_needsLicense = _data select A_shop_menu_var_buy_item_needs_license;
_license_1 = _data select A_shop_menu_var_buy_item_license_1;
_license_2 = _data select A_shop_menu_var_buy_item_license_2;
_logic = objectFromNetId(_data select A_shop_menu_var_buy_item_logic_netid);
_shop = (INV_ItemShops select _shop_id);
_shop_object = _shop select INV_ItemShops_Object;

_needsLicense = if (_shop_object in gangareas) then {false} else {true};

_near_vehicles = if (undefined(_logic)) then { [] } else { nearestobjects [getpos _logic, ["Ship_F","car","motorcycle","truck"], 3] };
_near_vehicles_count = if (undefined(_near_vehicles)) then { 0 } else { count _near_vehicles };
_supply = [_item, _shop_id] call A_inventory_fnc_get_stock;
_max_stock = [_item, _shop_id] call A_inventory_fnc_get_max_stock;
_type = _data select A_shop_menu_var_buy_item_type;
_tax = [_type] call A_economy_menu_fnc_lookup_tax_value_type;
_kind = _data select A_shop_menu_var_buy_item_kind;
_isItem = (_type == "Item");
_isFort = (_type == "Fort");
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

_base_weight = if (_isItem) then { (ITEM_DATA_WEIGHT(_infos)) } else { 0 };
_playerWeight =  call A_inventory_fnc_get_own_weight;
_isIllegal = if(_isItem) then {(_item call A_inventory_fnc_get_item_illegal)} else { false };
_class = _data select A_shop_menu_var_buy_item_class;

_limitedStock = (_max_stock != -1);
	
_amount_str = (ctrlText buy_items_to_buy_field_idc);
_amount = if (_amount_str == "") then { 0 } else {[_amount_str] call A_misc_fnc_parse_number };
_amount = if (_amount < 0 ) then { ctrlSetText [buy_items_to_buy_field_idc, "1"]; 1 } else {_amount};
_amount = if (_amount > 100) then { ctrlSetText [buy_items_to_buy_field_idc, "100"]; 100 } else { _amount };

_status_message = "";
_buyButton_state = true;

if (_amount <= 0) exitWith {
	["You have entered an invalid amount of items to buy", _quiet] call A_shop_menu_fnc_set_status_message; null
};

_putInHands = [_shop_id] call A_shop_menu_fnc_get_put_gear_cb;
_primary_weapon = primaryWeapon player;
_secondary_weapon = secondaryWeapon player;
_pistol = handgunWeapon player;
_backpack = unitBackpack player;
_headgear_item = [player] call A_player_fnc_headgear;
_goggle_item = [player] call A_player_fnc_goggles;
_uniform_item = [player] call A_player_fnc_uniform;
_vest_item = [player] call A_player_fnc_vest;

_hasPrimaryWeapon = (_primary_weapon != "");
_hasSecondaryWeapon = (_secondary_weapon != "");
_hasPistol = (_pistol != "");
_hasBackpack = if (undefined(_backpack) || isNull _backpack) then { false } else { true };
_hasHeadgear = if (_headgear_item == "") then {false} else {true};
_hasUniform = if (_uniform_item == "") then {false} else {true};
_hasVest = if (_vest_item == "") then {false} else {true};
_hasGoggles = if (_goggle_item == "") then {false} else {true};
_hasAttachment = if (([player, _class] call A_player_fnc_weapon_attachment_slot_open) == "") then {true} else {false};
_hasLinkedItem = if (([player, _class] call A_player_fnc_linked_item_slot_open)) then {false} else {true};


_isRifle =  ([_class, "RifleCore"] call A_shop_menu_fnc_weapon_inherits_from);
_isLauncher = ([_class, "LauncherCore"] call A_shop_menu_fnc_weapon_inherits_from);
_isPistol = ([_class, "PistolCore"] call A_shop_menu_fnc_weapon_inherits_from);

_price = _base_price * _amount;
_weight = _base_weight * _amount;

//add the sales tax to the price
_sales_tax = round(_price *  (_tax/100));

//for limited stock, adjust the price based on scarce the product is
_market_adjust = [_item, _amount, _base_price, _supply, _max_stock] call A_shop_menu_fnc_get_market_adjustment;

_market_adjust = round(_market_adjust);
_sales_tax = round(_sales_tax);
_total_price = round(_price + _sales_tax + _market_adjust);

_weight_str = if (_weight > 0) then { format["(%1kg)", _weight] } else { "" };
_supply_str = if (_limitedStock) then { format["%1/%2",_supply, _max_stock] } else { "Unlimited" };
_salesTax_str = format["$%1", strM(_sales_tax)];
_marketAdjust_str = format["$%1", strM(_market_adjust)];
_totalDue_str = format["$%1", strM(_total_price)];
_buy_label = format["Buy%1", _weight_str];

if (not(_quiet)) then {
	ctrlSetText [buy_supply_field_idc, _supply_str];
	ctrlSetText [buy_salex_tax_field_idc, _salesTax_str];
	ctrlSetText [buy_marked_adjust_field_idc, _marketAdjust_str];
	ctrlSetText [buy_total_due_field_idc, _totalDue_str];
	ctrlSetText [buy_button_idc, _buy_label];
};

_player_money =  ([player, 'money'] call A_inventory_fnc_get_item_amount);

//player groupChat format["_license_1 = %1", _license_1];
if (_needsLicense && isciv && not(_license_1 call A_inventory_fnc_has_license) && not(_license_1 == "")) exitWith {
	[format["This item requires %1", (_license_1 call A_inventory_fnc_get_license_name)], _quiet] call A_shop_menu_fnc_set_status_message; null
};

//player groupChat format["_license_2 = %1", _license_2];
if (_needsLicense && isblu && not(_license_2 call A_inventory_fnc_has_license) && not(_license_2 == "")) exitWith {
	[format["This item requires %1", (_license_2 call A_inventory_fnc_get_license_name)], _quiet] call A_shop_menu_fnc_set_status_message; null
};

if (_isIllegal && isblu) exitWith {
	["The selected item is illegal, you are not allowed to buy it", _quiet]  call A_shop_menu_fnc_set_status_message; null
};

if (_amount > 1 && (_isFort || _isVehicle || _isBackpack)) exitWith {
	["The item you have selected can only be bought one at a time", _quiet] call A_shop_menu_fnc_set_status_message; null
};

if((_isFort || _isVehicle) && _near_vehicles_count > 0) exitWith {
	private["_sleep_time"];
	_sleep_time =  60;
	[(_near_vehicles select 0), _logic, _sleep_time] call A_shop_menu_fnc_spawn_cleanup;
	[format["There is a vehicle blocking the spawn, it will be despawned in %1 seconds", _sleep_time], _quiet] call A_shop_menu_fnc_set_status_message; null
};

if (_limitedStock && _supply == 0) exitWith {
	["There is no supply for the item you have selected", _quiet] call A_shop_menu_fnc_set_status_message; null
};

if (_limitedStock && _amount > _supply) exitWith {
	["You have entered more than the available supply for this item", _quiet] call A_shop_menu_fnc_set_status_message; null
};

if (_putInHands && _amount > 1) exitWith {
	["You can only buy one item at a time when using ""Put weapon in hands"" option", _quiet] call A_shop_menu_fnc_set_status_message; null
};

if (_isItem && (_weight + _playerWeight) > A_inventory_var_INV_CarryingCapacity) exitWith {
	["The total weight of the items to buy exceed your carrying capacity", _quiet] call A_shop_menu_fnc_set_status_message; null;
};

if (_total_price > _player_money) exitWith {
	["You do not have enough money to buy this item", _quiet]  call A_shop_menu_fnc_set_status_message; null
};

//player groupChat format["_hasLinkedItem = %1, _isLinkedItem = %2", _hasLinkedItem, _isLinkedItem];
if (_putInHands && _hasLinkedItem && _isLinkedItem) exitWith {
	["You already have an item occupying this slot", _quiet] call A_shop_menu_fnc_set_status_message; null
};

if (_putInHands && _hasAttachment && _isAttachment) exitWith {
	["You do not have any weapon with an empty attachment slot for this item", _quiet] call A_shop_menu_fnc_set_status_message; null
};

if (_putInHands && _hasHeadgear && _isHeadgear) exitWith {
	["You already have a head gear item", _quiet] call A_shop_menu_fnc_set_status_message; null
};

if (_putInHands && _hasGoggles && _isGoggles) exitWith {
	["You already have goggles equipped", _quiet] call A_shop_menu_fnc_set_status_message; null
};

if (not(_putInHands) && _isGoggles) exitWith {
	["This item can only be bought using the ""Put weapon in hands"" option", _quiet] call A_shop_menu_fnc_set_status_message; null
};

if (_putInHands && _hasUniform && _isUniform) exitWith {
	["You already have a uniform", _quiet] call A_shop_menu_fnc_set_status_message; null
};

if (_putInHands && _hasVest && _isVest) exitWith {
	["You already have a vest", _quiet] call A_shop_menu_fnc_set_status_message; null
};

if (_putInHands &&  _hasPrimaryWeapon && _isWeapon && _isRifle) exitWith {
	["You already have a primary weapon in your hands", _quiet] call A_shop_menu_fnc_set_status_message; null
};

if (_putInHands && (_hasSecondaryWeapon || _hasBackpack) && _isWeapon && _isLauncher) exitWith {
	["Your secondary weapon slot is already filled", _quiet] call A_shop_menu_fnc_set_status_message; null
};

if (_putInHands && (_hasSecondaryWeapon || _hasBackpack) && _isBackpack) exitWith {
	["Your secondary weapon slot is already filled", _quiet] call A_shop_menu_fnc_set_status_message; null
};
	
if (_putInHands && _hasPistol && _isWeapon && _isPistol) exitWith {
	["Your pistol slot is already filled", _quiet] call A_shop_menu_fnc_set_status_message; null
};

if (_putInHands && not(_isPistol || _isBackpack || _isLauncher || _isRifle || 
						_isUniform || _isVest || _isGoggles || _isHeadgear ||
						_isAttachment || _isGoggles || _isLinkedItem)) exitWith {
	["The item you have selected to buy cannot be put in hands automatically", _quiet] call A_shop_menu_fnc_set_status_message; null
};

_data set [A_shop_menu_var_buy_item_total_due, [(_total_price)] call A_encoding_fnc_encode_number];
_data set [A_shop_menu_var_buy_item_sales_tax, _sales_tax];
_data set [A_shop_menu_var_buy_item_market_adjust, _market_adjust];
_data set [A_shop_menu_var_buy_item_max_stock, _max_stock];
_data set [A_shop_menu_var_buy_item_supply, _supply];
_data set [A_shop_menu_var_buy_item_legal, not(_isIllegal)];
_data set [A_shop_menu_var_buy_item_amount, _amount];
_data set [A_shop_menu_var_buy_item_in_hands, _putInHands];

_data
