#include "constants.h"
#include "macro.h"

if (not(undefined(shop_menu_functions_defined))) exitWith {};





shop_lookup = {
	ARGV(0,_shop_id);
	_shop_key = [_shop_id] call shop_make_key;
	if (undefined(_shop_key)) exitWith {null};
	
	_shop_cache = server getVariable _shop_key;
	_shop_cache
};

shop_make_key = {
	ARGV(0,_shop_id);
	if (undefined(_shop_id)) exitWith {null};
	if (typeName _shop_id != "SCALAR") exitWith {null};
	_shop_key = format["shop_id_%1", _shop_id];	
	_shop_key
};

shop_close =  {
	ARGV(0,_shop_id);
	if (undefined(_shop_id)) exitWith {null};
	if (typeName _shop_id != "SCALAR") exitWith {null};
	
	private ["_shop_cache"];
	_shop_cache = [_shop_id] call shop_lookup;
	if (undefined(_shop_cache)) exitWith {null};

	_indicator = [_shop_cache, "indicator"] call object_getVariable;
	
	if (undefined(_indicator)) then {
		private ["_pos", "_indicator", "_model_pos", "_center", "_max_z"];
		_indicator = "Sign_Sphere25cm_F" createVehicleLocal [0,0,0];
		[_shop_cache, "indicator", _indicator] call object_setVariable;
		_max_z = ((boundingBox _shop_cache) select 1) select 2;
		_indicator attachTo [_shop_cache, [0,0,_max_z+0.1]];
	};
	
	//_indicator hideObject false;
	[_shop_cache, "open", false] call object_setVariable;
};



shop_open =  {
	ARGV(0,_shop_id);
	if (undefined(_shop_id)) exitWith {null};
	if (typeName _shop_id != "SCALAR") exitWith {null};
	
	private ["_shop_cache"];
	_shop_cache = [_shop_id] call shop_lookup;
	if (undefined(_shop_cache)) exitWith {null};
	
	_indicator = [_shop_cache, "indicator"] call object_getVariable;
	if (not(undefined(_indicator))) then {
		//_indicator hideObject true;
		//detach _indicator;
		deleteVehicle _indicator;
	};
	
	[_shop_cache, "open", true] call object_setVariable;
};

shop_init = {
	ARGV(0,_shop_id);
	ARGV(1,_shop_cache);
	
	if (undefined(_shop_id)) exitWith {null};
	if (typeName _shop_id != "SCALAR") exitWith {null};
	if (undefined(_shop_cache)) exitWith {null};
	

	[_shop_cache, "open", false] call object_setVariable;
	[_shop_cache, "buy_items", []] call object_setVariable;
	[_shop_cache, "sell_items", []] call object_setVariable;
	[_shop_cache, "id", _shop_id] call object_setVariable;
	[_shop_cache, "put_gear", false] call object_setVariable;
	[_shop_cache, "hide_sell_items", true] call object_setVariable;
	_shop_key = ([_shop_id] call shop_make_key);
	server setVariable [_shop_key, _shop_cache];
};


shop_sort_list_by_distance = {
	ARGV(0,_location);
	ARGV(1,_unsorted_shop_list);
	
	if (undefined(_unsorted_shop_list)) exitWith {null};
	if (typeName _unsorted_shop_list != "ARRAY") exitWith {null};
	if (undefined(_location)) exitWith {_unsorted_shop_list};
	if (typeName _location != "ARRAY") exitWith {_unsorted_shop_list};
	if ((count _location) != 3) exitWith {_unsorted_shop_list};
	
	private["_list_to_sort", "_i", "_count"];
	_list_to_sort = [];
	_i = 0;
	_count = count _unsorted_shop_list;
	while {_i < _count} do {
		private["_shop_object", "_shop_id", "_distance", "_shop"];
		_shop_id = _i;
		_shop = _unsorted_shop_list select _i;
		_shop_object = _shop select INV_ItemShops_Object;
		_distance = _location distance _shop_object;
		_element = [];
		_element set [sort_key, _distance];
		_element set [sort_data, _shop_id];
		_list_to_sort set[_i, _element];
		_i = _i + 1;
	};
	
	_list_to_sort call quicksort;
	_list_to_sort
};

shop_setup_progress = 0;
shop_setup = {
	ARGV(0,_unsorted_shops);
	
	private[ "_i", "_count", "_sorted_item_shops"];
	_sorted_item_shops = [(getPos player), _unsorted_shops] call shop_sort_list_by_distance;
	_count = count _sorted_item_shops;
	
	//initialize and close all the shops
	_i = 0;
	while { _i < _count } do {
		private["_element", "_shop", "_shop_object"];
		_element = _sorted_item_shops select _i;
		_shop_id = _element select sort_data;
		_shop_object = (_unsorted_shops select _shop_id) select INV_ItemShops_Object;
		
		[_shop_id, _shop_object] call shop_init;
		[_shop_id] call shop_close;
		_i = _i + 1;
	};
	
	
	_i = 0;
	_count = count _sorted_item_shops;
	//build the list for each shop, and open them
	while { _i < _count } do {
		private["_element", "_shop", "_shop_object"];
		_element = _sorted_item_shops select _i;
		_shop_id = _element select sort_data;
		_shop_object = (_unsorted_shops select _shop_id) select INV_ItemShops_Object;
		
		[_shop_id] call shop_build_buy_list;
		[_shop_id] call shop_build_sell_list;
		[_shop_id] call shop_open;
		
		_i = _i + 1;
		shop_setup_progress = floor((_i/_count)*100);
	};
};



shop_set_sell_items = {
	ARGV(0,_shop_id);
	ARGV(1,_items);

	if (undefined(_shop_id)) exitWith {null};
	if (undefined(_items)) exitWith {null};
	if (typeName _shop_id != "SCALAR") exitWith {null};
	
	private["_shop_cache"];
	_shop_cache = [_shop_id] call shop_lookup;
	if (undefined(_shop_cache)) exitWith {null};

	[_shop_cache, "sell_items", _items] call object_setVariable;
};

shop_get_sell_items = {
	ARGV(0,_shop_cache);
	if (undefined(_shop_cache)) exitWith {null};
	
	private ["_items"];
	_items = [_shop_cache, "sell_items"] call object_getVariable;
	_items
};


shop_set_buy_items = {
	ARGV(0,_shop_id);
	ARGV(1,_items);

	if (undefined(_shop_id)) exitWith {null};
	if (undefined(_items)) exitWith {null};
	if (typeName _shop_id != "SCALAR") exitWith {null};
	
	private["_shop_cache"];
	_shop_cache = [_shop_id] call shop_lookup;
	if (undefined(_shop_cache)) exitWith {null};


	[_shop_cache, "buy_items", _items] call object_setVariable;
};

shop_get_buy_items = {
	ARGV(0,_shop_cache);
	if (undefined(_shop_cache)) exitWith {null};
	
	private ["_items"];
	_items = [_shop_cache, "buy_items"] call object_getVariable;
	_items
};

shop_is_open = {
	ARGV(0,_shop_id);
	
	private ["_shop_cache"];
	_shop_cache = [_shop_id] call shop_lookup;
	if (undefined(_shop_cache)) exitWith { false };
	
	private ["_open"];
	_open = [_shop_cache, "open"] call object_getVariable;
	if (undefined(_open)) exitWith { false };
	if (typeName _open != "BOOL") exitWith {   false };
	_open	
};


shop_sell_item_key = 0;
shop_sell_item_price = 1;
shop_sell_item_index = 2;
shop_sell_item_label = 3;
shop_sell_item_shop_id = 4;
shop_sell_item_name = 5;
shop_sell_item_logic_netid = 6;
shop_sell_item_class = 7;
shop_sell_item_type = 8;
shop_sell_item_kind = 9;
shop_sell_item_icon = 10;

shop_sell_item_total_return = 11;
shop_sell_item_sales_tax = 12;
shop_sell_item_market_adjust = 13;
shop_sell_item_max_stock = 14;
shop_sell_item_demand = 15;
shop_sell_item_supply = 16;
shop_sell_item_legal = 17;
shop_sell_item_amount = 18;


shop_build_sell_list = {
	//player groupChat format["shop_build_sell_list %1", _this];
	
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
		_infos = _item call inventory_get_item_array;
		_price = _infos call inventory_get_item_sell_cost;
		_name =  (MASTER_ARRAY_ITEM_NAME(_infos));

		_isItem = (_infos call inventory_get_item_type == "Item");
		_isDroppable = if (_isItem) then {(_item call inventory_get_item_droppable)} else { false };
		_class = if(not(_isItem)) then { _infos call inventory_get_item_class } else { "" };
		_type = _infos call inventory_get_item_type;
		_kind = _infos call inventory_get_item_kind;
		_kind = if (undefined(_kind)) then { "" } else { _kind };
		_icon = [_item, _class, _type] call object_icon;
		
		_weight_str = if (_isItem) then {format[" - %1kg", ITEM_DATA_WEIGHT(_infos)] } else { "" };
		_label = format["%1 ($%2%3)", _name, strM(_price), _weight_str];
		
		
		
		_data = [];
		_data set [shop_sell_item_key, _item];
		_data set [shop_sell_item_price, ([_price] call encode_number)];
		_data set [shop_sell_item_index, _i];
		_data set [shop_sell_item_label, _label];
		_data set [shop_sell_item_shop_id, _shop_id];
		_data set [shop_sell_item_name, _name];
		_data set [shop_sell_item_logic_netid, (netId _logic)];
		_data set [shop_sell_item_class, _class];
		_data set [shop_sell_item_type, _type];
		_data set [shop_sell_item_kind, _kind];
		_data set [shop_sell_item_icon, _icon];
		
		
		_shop_sell_list set [_i, _data];
		_i = _i + 1;
	};
	
	[_shop_id, _shop_sell_list] call shop_set_sell_items;
};


shop_buy_item_key = 0;
shop_buy_item_price = 1;
shop_buy_item_index = 2;
shop_buy_item_label = 3;
shop_buy_item_shop_id = 4;
shop_buy_item_name = 5;
shop_buy_item_license_1 = 6;
shop_buy_item_license_2 = 7;
shop_buy_item_needs_license = 8;
shop_buy_item_crate_netid = 9;
shop_buy_item_logic_netid = 10;
shop_buy_item_class = 11;
shop_buy_item_type = 12;
shop_buy_item_kind = 13;
shop_buy_item_icon = 14;

shop_buy_item_total_due = 15;
shop_buy_item_sales_tax = 16;
shop_buy_item_market_adjust = 17;
shop_buy_item_max_stock = 18;
shop_buy_item_supply = 19;
shop_buy_item_legal = 20;
shop_buy_item_amount = 21;
shop_buy_item_in_hands = 22;


shop_build_buy_list =  {
	ARGV(0,_shop_id);
	if (undefined(_shop_id)) exitWith {null};
	if (typeName _shop_id != "SCALAR") exitWith {null};
	
	private ["_item_buy_list", "_shop", "_crate", "_logic"];
	_shop = (INV_ItemShops select _shop_id);
	_item_buy_list   = ( _shop select INV_ItemShops_BuyList);
	_shop_needs_license =  (_shop select INV_ItemShops_License);
	_crate = (_shop select INV_ItemShops_Crate);
	_crate = if (undefined(_crate) ) then { "" } else { _crate };
	_logic = (_shop select INV_ItemShops_Logic);
	_logic = if (undefined(_logic) ) then { "" } else { _logic };
	
	
	private["_i", "_shop_buy_list", "_count"];
	_shop_buy_list = [];
	_count = count _item_buy_list;
	_i = 0;
	while { _i < _count } do {
		private ["_data", "_item", "_infos", "_price", "_name", "_isItem", "_weight_str", "_label", 
				"_license_1", "_license_2", "_icon", "_class", "_type", "_kind", "_icon"];
		_item = _item_buy_list select _i;
		_infos = _item call inventory_get_item_array;
		_price = _infos call inventory_get_item_buy_cost;
		_name  = (MASTER_ARRAY_ITEM_NAME(_infos));
		_isItem = (_infos call inventory_get_item_type == "Item");
		_license_1 = _infos call inventory_get_license_1;
		_license_2 = _infos call inventory_get_license_2;
		_class = if(not(_isItem)) then { _infos call inventory_get_item_class } else { "" };
		_type = _infos call inventory_get_item_type;
		_kind = _infos call inventory_get_item_kind;
		_kind = if (undefined(_kind)) then { "" } else { _kind };
		_icon = [_item, _class, _type] call object_icon;
		//player groupChat format["_icon = %1", _icon];
		
 
		_weight_str = if (_isItem) then {format[" - %1kg", ITEM_DATA_WEIGHT(_infos)] } else { "" };
		_label = format["%1 ($%2%3)", _name, strM(_price), _weight_str];
		
		_data = [];
		_data set [shop_buy_item_key, _item];
		_data set [shop_buy_item_price, [_price] call encode_number];
		_data set [shop_buy_item_index, _i];
		_data set [shop_buy_item_label, _label];
		_data set [shop_buy_item_shop_id, _shop_id];
		_data set [shop_buy_item_name, _name];
		_data set [shop_buy_item_license_1, _license_1];
		_data set [shop_buy_item_license_2, _license_2];
		_data set [shop_buy_item_needs_license, _shop_needs_license];
		_data set [shop_buy_item_crate_netid, (netId _crate)];
		_data set [shop_buy_item_logic_netid, (netId _logic)];
		_data set [shop_buy_item_class, _class];
		_data set [shop_buy_item_type, _type];
		_data set [shop_buy_item_kind, _kind];
		_data set [shop_buy_item_icon, _icon];
		_shop_buy_list set [_i, _data];
		_i = _i + 1;
	};
	
	[_shop_id, _shop_buy_list] call shop_set_buy_items;
};



//Boolean not equal
BNE = {
	ARGV(0,_bool1);
	ARGV(1,_bool2);
	((_bool1 && not(_bool2)) || (not(_bool1) && _bool2))
};


shop_update_sell_list =  {
	disableSerialization;
	private [ "_items",  "_dialog", "_shop_id", "_shop_cache", "_items", "_count", "_i", "_hide_items"];
	
	lbClear sell_items_list_idc;
	call shop_reset_sell_labels;
	
	_this = if (undefined(_this)) then { [] } else { _this };
	_shop_id = if (count _this > 0) then { _this select 0 } else { call shop_get_current_shop_id };
	
	_shop_cache = [_shop_id] call shop_lookup;
	if (undefined(_shop_cache)) exitWith {null};
	
	_hide_items = [_shop_id] call shop_get_sell_cb;
	
	_items = [_shop_cache] call shop_get_sell_items;
	
	
	_count = (count _items);
	[_shop_id] call shop_refresh_sell_cb;

	_i = 0;
	while { _i < _count && not(isNull(findDisplay shop_dialog_idd))} do {
		private["_index", "_data", "_valid"];
		//exit early if the state of the checkbox changes
		if ([([_shop_id] call shop_get_sell_cb), _hide_items] call BNE ) exitWith {null};
		_data = _items select _i;
		_valid = if (_hide_items) then { private["_out"]; _out = [_data, true] call shop_sell_item_validate_data; not(undefined(_out)) } else { true };

		if (_valid) then {
			_index = lbAdd [sell_items_list_idc, (_data select shop_sell_item_label)];
			lbSetData [sell_items_list_idc, _index, format["%1", _data]];
			 lbSetPicture [sell_items_list_idc, _index, (_data select shop_sell_item_icon)];
		};
		_i = _i + 1;
	};
};



shop_update_buy_list =  {
	disableSerialization;
	private [ "_items",  "_dialog", "_shop_id", "_shop_cache", "_items", "_count", "_i"];
	
	lbClear buy_items_list_idc;
	call shop_reset_buy_labels;
	
	_this = if (undefined(_this)) then { [] } else { _this };
	_shop_id = if (count _this > 0) then { _this select 0 } else { call shop_get_current_shop_id };

	_shop_cache = [_shop_id] call shop_lookup;
	if (undefined(_shop_cache)) exitWith {null};
	
	_items = [_shop_cache] call shop_get_buy_items;
	
	_i = 0;
	_count = (count _items);
	while { _i < _count } do {
		private["_index", "_data"];
		_data = _items select _i;
		_index = lbAdd [buy_items_list_idc, (_data select shop_buy_item_label)];
		lbSetData [buy_items_list_idc, _index, format["%1", _data]];
		lbSetPicture [buy_items_list_idc, _index, (_data select shop_buy_item_icon)];
		//lbSetPicture [buy_items_list_idc, _index, "icons\zipties.paa"];
		  
		_i = _i + 1;
	};
	
	[_shop_id] call shop_refresh_put_gear_cb;
	
};


shop_reset_buy_labels = {
	ctrlSetText [buy_supply_field_idc, "0"];
	ctrlSetText [buy_salex_tax_field_idc, "$0"];
	ctrlSetText [buy_marked_adjust_field_idc, "$0"];
	ctrlSetText [buy_total_due_field_idc, "$0"];
	ctrlSetText [buy_button_idc, "Buy"];
	ctrlEnable [buy_button_idc, false];
	ctrlSetText [buy_sell_status_label_idc, ""];
};

shop_reset_sell_labels = {
	ctrlSetText [sell_demand_field_idc, "0"];
	ctrlSetText [sell_sales_tax_field_idc, "$0"];
	ctrlSetText [sell_market_ajust_field_idc, "$0"];
	ctrlSetText [sell_total_return_field_idc, "$0"];
	ctrlSetText [sell_button_idc, "Sell"];
	ctrlEnable [sell_button_idc, false];
	ctrlSetText [buy_sell_status_label_idc, ""];
};


shop_weapon_inherits_from = {
	ARGV(0,_weapon_class);
	ARGV(1,_base_class);
	
	private["_config_class"];
	_config_class = if (count _this > 2) then { _this select 2; } else { "CfgWeapons" };
	
	
	if (undefined(_weapon_class)) exitWith { false };
	if (undefined(_base_class)) exitWith { false };
	if (undefined(_config_class)) exitWith { false };
	
	if (typeName _weapon_class != "STRING") exitWith { false };
	if (typename _base_class != "STRING") exitWith { false };
	
	private["_i", "_matches", "_parent_config", "_parent_name"];
	_i = 10;
	_matches = false;
	_parent_config = (configFile >> _config_class >> _weapon_class );
	_parent_name = configName(_parent_config);
	while { _i > 0 } do {
		if (_parent_name == _base_class) exitWith { _matches = true };
		_parent_config = inheritsFrom(_parent_config);
		_parent_name = configName(_parent_config);
	    _i = _i - 1;
	};
	_matches
};

shop_get_market_adjustment = {
	ARGV(0,_item);
	ARGV(1,_amount);
	ARGV(2,_base_price);
	ARGV(3,_supply);
	ARGV(4,_max_stock);
	
	private["_market_adjust"];
	_market_adjust = 0;
		
	if (_max_stock < 0) exitWith { 0 };
	
	private["_stock_sold", "_percent_stock_sold"];
	_stock_sold = (_max_stock - _supply);
	_percent_stock_sold = (_stock_sold / _max_stock);
	_market_adjust = (_amount * _base_price) * 0.25 * _percent_stock_sold;
	
	_market_adjust
};


shop_buy_item_validate_data = {
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
		call shop_reset_buy_labels;
	};
	
	
	if ((call shop_is_busy)) exitWith {
		[format["Shop is currently busy, please wait"], _quiet] call shop_set_status_message; null
	};
	
	
	_shop_id  = _data select shop_buy_item_shop_id;
	_item = _data select shop_buy_item_key;
	_base_price = [(_data select shop_buy_item_price)] call decode_number;
	_infos = _item call inventory_get_item_array;
	_needsLicense = _data select shop_buy_item_needs_license;
	_license_1 = _data select shop_buy_item_license_1;
	_license_2 = _data select shop_buy_item_license_2;
	_logic = objectFromNetId(_data select shop_buy_item_logic_netid);
	_shop = (INV_ItemShops select _shop_id);
	_shop_object = _shop select INV_ItemShops_Object;
	
	_needsLicense = if (_shop_object in gangareas) then {false} else {true};
	
	_near_vehicles = if (undefined(_logic)) then { [] } else { nearestobjects [getpos _logic, ["Ship_F","car","motorcycle","truck"], 3] };
	_near_vehicles_count = if (undefined(_near_vehicles)) then { 0 } else { count _near_vehicles };
	_supply = [_item, _shop_id] call inventory_get_stock;
	_max_stock = [_item, _shop_id] call inventory_get_max_stock;
	_type = _data select shop_buy_item_type;
	_tax = [_type] call economy_lookup_tax_value_type;
	_kind = _data select shop_buy_item_kind;
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
	_playerWeight =  call inventory_get_own_weight;
	_isIllegal = if(_isItem) then {(_item call inventory_get_item_illegal)} else { false };
	_class = _data select shop_buy_item_class;
	
	_limitedStock = (_max_stock != -1);
		
	_amount_str = (ctrlText buy_items_to_buy_field_idc);
	_amount = if (_amount_str == "") then { 0 } else {[_amount_str] call parse_number };
	_amount = if (_amount < 0 ) then { ctrlSetText [buy_items_to_buy_field_idc, "1"]; 1 } else {_amount};
	_amount = if (_amount > 100) then { ctrlSetText [buy_items_to_buy_field_idc, "100"]; 100 } else { _amount };
	
	_status_message = "";
	_buyButton_state = true;
	
	if (_amount <= 0) exitWith {
		["You have entered an invalid amount of items to buy", _quiet] call shop_set_status_message; null
	};
	
	_putInHands = [_shop_id] call shop_get_put_gear_cb;
	_primary_weapon = primaryWeapon player;
	_secondary_weapon = secondaryWeapon player;
	_pistol = handgunWeapon player;
	_backpack = unitBackpack player;
	_headgear_item = [player] call player_headgear;
	_goggle_item = [player] call player_goggles;
	_uniform_item = [player] call player_uniform;
	_vest_item = [player] call player_vest;
	
	_hasPrimaryWeapon = (_primary_weapon != "");
	_hasSecondaryWeapon = (_secondary_weapon != "");
	_hasPistol = (_pistol != "");
	_hasBackpack = if (undefined(_backpack) || isNull _backpack) then { false } else { true };
	_hasHeadgear = if (_headgear_item == "") then {false} else {true};
	_hasUniform = if (_uniform_item == "") then {false} else {true};
	_hasVest = if (_vest_item == "") then {false} else {true};
	_hasGoggles = if (_goggle_item == "") then {false} else {true};
	_hasAttachment = if (([player, _class] call player_weapon_attachment_slot_open) == "") then {true} else {false};
	_hasLinkedItem = if (([player, _class] call player_linked_item_slot_open)) then {false} else {true};
	

	_isRifle =  ([_class, "RifleCore"] call shop_weapon_inherits_from);
	_isLauncher = ([_class, "LauncherCore"] call shop_weapon_inherits_from);
	_isPistol = ([_class, "PistolCore"] call shop_weapon_inherits_from);

	_price = _base_price * _amount;
	_weight = _base_weight * _amount;
	
	//add the sales tax to the price
	_sales_tax = round(_price *  (_tax/100));
	
	//for limited stock, adjust the price based on scarce the product is
	_market_adjust = [_item, _amount, _base_price, _supply, _max_stock] call shop_get_market_adjustment;
	
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
	
	_player_money =  ([player, 'money'] call inventory_get_item_amount);
	
	//player groupChat format["_license_1 = %1", _license_1];
	if (_needsLicense && isciv && not(_license_1 call inventory_has_license) && not(_license_1 == "")) exitWith {
		[format["This item requires %1", (_license_1 call inventory_get_license_name)], _quiet] call shop_set_status_message; null
	};
	
	//player groupChat format["_license_2 = %1", _license_2];
	if (_needsLicense && iscop && not(_license_2 call inventory_has_license) && not(_license_2 == "")) exitWith {
		[format["This item requires %1", (_license_2 call inventory_get_license_name)], _quiet] call shop_set_status_message; null
	};
	
	if (_isIllegal && iscop) exitWith {
		["The selected item is illegal, you are not allowed to buy it", _quiet]  call shop_set_status_message; null
	};
	
	if (_amount > 1 && (_isFort || _isVehicle || _isBackpack)) exitWith {
		["The item you have selected can only be bought one at a time", _quiet] call shop_set_status_message; null
	};
	
	if((_isFort || _isVehicle) && _near_vehicles_count > 0) exitWith {
		private["_sleep_time"];
		_sleep_time =  60;
		[(_near_vehicles select 0), _logic, _sleep_time] call shop_spawn_cleanup;
		[format["There is a vehicle blocking the spawn, it will be despawned in %1 seconds", _sleep_time], _quiet] call shop_set_status_message; null
	};
	
	if (_limitedStock && _supply == 0) exitWith {
		["There is no supply for the item you have selected", _quiet] call shop_set_status_message; null
	};
	
	if (_limitedStock && _amount > _supply) exitWith {
		["You have entered more than the available supply for this item", _quiet] call shop_set_status_message; null
	};
	
	if (_putInHands && _amount > 1) exitWith {
		["You can only buy one item at a time when using ""Put weapon in hands"" option", _quiet] call shop_set_status_message; null
	};

	if (_isItem && (_weight + _playerWeight) > INV_CarryingCapacity) exitWith {
		["The total weight of the items to buy exceed your carrying capacity", _quiet] call shop_set_status_message; null;
	};
	
	if (_total_price > _player_money) exitWith {
		["You do not have enough money to buy this item", _quiet]  call shop_set_status_message; null
	};
	
	//player groupChat format["_hasLinkedItem = %1, _isLinkedItem = %2", _hasLinkedItem, _isLinkedItem];
	if (_putInHands && _hasLinkedItem && _isLinkedItem) exitWith {
		["You already have an item occupying this slot", _quiet] call shop_set_status_message; null
	};
	
	if (_putInHands && _hasAttachment && _isAttachment) exitWith {
		["You do not have any weapon with an empty attachment slot for this item", _quiet] call shop_set_status_message; null
	};
	
	if (_putInHands && _hasHeadgear && _isHeadgear) exitWith {
		["You already have a head gear item", _quiet] call shop_set_status_message; null
	};
	
	if (_putInHands && _hasGoggles && _isGoggles) exitWith {
		["You already have goggles equipped", _quiet] call shop_set_status_message; null
	};
	
	if (not(_putInHands) && _isGoggles) exitWith {
		["This item can only be bought using the ""Put weapon in hands"" option", _quiet] call shop_set_status_message; null
	};
	
	if (_putInHands && _hasUniform && _isUniform) exitWith {
		["You already have a uniform", _quiet] call shop_set_status_message; null
	};
	
	if (_putInHands && _hasVest && _isVest) exitWith {
		["You already have a vest", _quiet] call shop_set_status_message; null
	};
	
	if (_putInHands &&  _hasPrimaryWeapon && _isWeapon && _isRifle) exitWith {
		["You already have a primary weapon in your hands", _quiet] call shop_set_status_message; null
	};
	
	if (_putInHands && (_hasSecondaryWeapon || _hasBackpack) && _isWeapon && _isLauncher) exitWith {
		["Your secondary weapon slot is already filled", _quiet] call shop_set_status_message; null
	};
	
	if (_putInHands && (_hasSecondaryWeapon || _hasBackpack) && _isBackpack) exitWith {
		["Your secondary weapon slot is already filled", _quiet] call shop_set_status_message; null
	};
		
	if (_putInHands && _hasPistol && _isWeapon && _isPistol) exitWith {
		["Your pistol slot is already filled", _quiet] call shop_set_status_message; null
	};
	
	if (_putInHands && not(_isPistol || _isBackpack || _isLauncher || _isRifle || 
							_isUniform || _isVest || _isGoggles || _isHeadgear ||
							_isAttachment || _isGoggles || _isLinkedItem)) exitWith {
		["The item you have selected to buy cannot be put in hands automatically", _quiet] call shop_set_status_message; null
	};
	
	_data set [shop_buy_item_total_due, [(_total_price)] call encode_number];
	_data set [shop_buy_item_sales_tax, _sales_tax];
	_data set [shop_buy_item_market_adjust, _market_adjust];
	_data set [shop_buy_item_max_stock, _max_stock];
	_data set [shop_buy_item_supply, _supply];
	_data set [shop_buy_item_legal, not(_isIllegal)];
	_data set [shop_buy_item_amount, _amount];
	_data set [shop_buy_item_in_hands, _putInHands];
	
	_data
};


shop_spawn_cleanup_queue = [];
shop_spawn_cleanup = {_this spawn {
	ARGV(0,_vehicle);
	ARGV(1,_logic)
	ARGV(2,_sleep_time);
	
	if (undefined(_vehicle)) exitWith {};
	if (undefined(_logic)) exitWith {};
	if (undefined(_sleep_time)) exitWith {};
	if (not([_vehicle] call object_exists)) exitWith {};
	if (typeName _sleep_time != "SCALAR") exitWith {};
	if (_vehicle in shop_spawn_cleanup_queue) exitWith {};
	
	sleep _sleep_time;
	if ((_vehicle distance _logic) > 3) exitWith {
		shop_spawn_cleanup_queue = shop_spawn_cleanup_queue - [_vehicle];
	};
	deleteVehicle _vehicle;
	shop_spawn_cleanup_queue = shop_spawn_cleanup_queue - [objNull];
};};

shop_sell_item_validate_data = {
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
		call shop_reset_sell_labels;
	};
	
	if ((call shop_is_busy)) exitWith {
		[format["Shop is currently busy, please wait"], _quiet] call shop_set_status_message; null;
	};
	
	_sellableItems = ["Item", "Weapon", "Magazine", "Vehicle", "backpack", "BISItem", "LinkedItem", "Attachment", "Vest", "Uniform", "Headgear", "Goggles"];
	
	_shop_id  = _data select shop_sell_item_shop_id;
	_item = _data select shop_sell_item_key;
	_base_price = [(_data select shop_sell_item_price)] call decode_number;
	_infos = _item call inventory_get_item_array;
	_logic = objectFromNetId(_data select shop_sell_item_logic_netid);
	_supply = [_item, _shop_id] call inventory_get_stock;
	_max_stock = [_item, _shop_id] call inventory_get_max_stock;
	_isOilBarrel = (_item == "OilBarrel");
	
	_type = _data select shop_sell_item_type;
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
	
	_class = _data select shop_sell_item_class;
	_demand = if (_limitedStock) then { _max_stock - _supply } else { -1 };
	
	_weapons = (weapons player);
	_magazines = (magazines player);
	_vehicles = [player, _class, _item, 50] call shop_get_vehicles_by_class_item;
	
	_weapon_count = if (_isWeapon) then { ({_x == _class} count _weapons ) } else { 0 };
	_weapon_count = if (undefined(_weapon_count)) then { 0 } else { _weapon_count };
	
	_magazine_count = if (_isMagazine) then {({_x == _class} count _magazines) } else { 0 };
	_magazine_count = if (undefined(_magazine_count)) then { 0 } else { _magazine_count };
	_item_count = if (_isItem) then { ([player, _item] call inventory_get_item_amount) } else { 0 };
	_item_count = if (undefined(_item_count)) then { 0 } else { _item_count };
	_vehicle_count = if (_isVehicle) then { count (_vehicles) } else { 0 };
	_vehicle_count = if (undefined(_vehicle_count)) then {0} else {_vehicle_count};
	_vehicle_alive_count = if (_vehicle_count > 0) then {({alive _x} count _vehicles)} else { 0 }; 
	_vehicle_alive_count = if (undefined(_vehicle_alive_count)) then { 0 } else { _vehicle_alive_count };
	_vehicle_near_count = if (_vehicle_alive_count > 0)  then {({((alive _x) && ((_x distance player) < 50))} count _vehicles) } else { 0 }; 
	_vehicle_near_count = if (undefined(_vehicle_near_count)) then {0} else {_vehicle_near_count};
	_hasBackpack = if (_isBackpack) then { _class == typeOf(unitBackpack player); } else { false };
	
	_all_items = [player] call player_get_all_items;

	_linked_items_count = if (_isLinkedItem) then {({_x == _class} count _all_items)} else {0};
	_bis_items_count = if (_isBISItem) then {({_x == _class} count _all_items)} else {0};
	_uniform_count = if (_isUniform) then {({_x == _class} count _all_items)} else {0};
	_attachments_count = if (_isAttachment) then {({_x == _class} count _all_items)} else {0};
	_goggles_count = if (_isGoggles) then {({_x == _class} count _all_items)} else {0};
	_headgear_count = if (_isHeadgear) then {({_x == _class} count _all_items)} else {0};
	_vest_count = if (_isVest) then {({_x == _class} count _all_items)} else {0};
	
	_tax = [_type] call economy_lookup_tax_value_type;
	_kind = _data select shop_sell_item_kind;
	
	
	_base_weight = if (_isItem) then {ITEM_DATA_WEIGHT(_infos)} else { 0 };
	_isIllegal = if(_isItem) then {(_item call inventory_get_item_illegal)} else { false };
	
	_amount_str = (ctrlText sell_items_to_sell_field_idc);
	
	_amount = if (_amount_str == "") then { 0 } else {[_amount_str] call parse_number };
	_amount = if (_amount < 0 ) then { ctrlSetText [sell_items_to_sell_field_idc, "1"]; 1 } else {_amount};
	_amount = if (_amount > 100) then { ctrlSetText [sell_items_to_sell_field_idc, "100"]; 100 } else { _amount };
	
	if (_amount <= 0) exitWith {
		["You have entered an invalid amount of items to sell", _quiet] call shop_set_status_message; null
	};
	
	
	if (_isOilBarrel) then {
		_max_stock = (call shop_get_oil_barrel_max_stock);
		_demand = (call shop_get_oil_barrel_demand);
		_supply =  _max_stock - _demand;
		_limitedStock  = true;
	};
	
	_price = _base_price * _amount;
	_weight = _base_weight * _amount;
	
	//add the sales tax to the price
	_sales_tax = round(_price *  (_tax/100));
	
	_market_adjust = [_item, _amount, _base_price, _supply, _max_stock] call shop_get_market_adjustment;

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
		["The item you have selected to sell, is not an item that can be sold", _quiet] call shop_set_status_message; null
	};
	
	if(_limitedStock && _demand == 0 && not(_isOilBarrel)) exitWith {
		["The item you have selected to sell has currently no demand", _quiet] call shop_set_status_message; null
	};
	
	if (_isBISItem && _bis_items_count == 0) exitWith {
		["You do not have any of the selected item to sell", _quiet] call shop_set_status_message; null
	};
	
	if (_isAttachment && _attachments_count == 0) exitWith {
		["You do not have any of the selected attachment to sell", _quiet] call shop_set_status_message; null
	};

	if (_isGoggles && _goggles_count == 0) exitWith {
		["You do not have any of the selected goggles to sell", _quiet] call shop_set_status_message; null
	};
	
	if (_isHeadgear && _headgear_count == 0) exitWith {
		["You do not have any of the selected headgear to sell", _quiet] call shop_set_status_message; null
	};
	
	if (_isVest && _vest_count == 0) exitWith {
		["You do not have any of the selected vest to sell", _quiet] call shop_set_status_message; null
	};
	
	if (_isUniform && _uniform_count == 0) exitWith {
		["You do not have any of the selected uniform to sell", _quiet] call shop_set_status_message; null
	};
	
	if (_isLinkedItem && _linked_items_count == 0) exitWith {
		["You do not have any of the selected item to sell", _quiet] call shop_set_status_message; null
	};
	
	if (_isWeapon && _weapon_count == 0) exitWith {
		["You do not have the selected weapon to sell", _quiet] call shop_set_status_message; null
	};
	
	if (_isItem && _item_count == 0) exitWith {
		["You do not have any of the selected item to sell", _quiet] call shop_set_status_message; null
	};
	
	if (_isItem && _amount > _item_count) exitWith {
		["You are trying to sell more than the amount of items you have", _quiet] call shop_set_status_message; null
	};
	
	if (_isMagazine && _magazine_count == 0) exitWith {
		["You do not have any of the selected magazine/ammunition to sell", _quiet] call shop_set_status_message; null
	};
	
	if (_isMagazine && _amount  > _magazine_count) exitWith {
		["You are trying to sell more than the amount of magazines/ammution you have", _quiet] call shop_set_status_message; null
	};
	
	if(_isVehicle && _vehicle_count == 0) exitWith {
		["You do not own any vehicles of the selected type to sell", _quiet] call shop_set_status_message; null
	};
	
	if (_isVehicle && _vehicle_alive_count == 0) exitWith {
		["You do not own any vehicles of the selected type that are alive", _quiet] call shop_set_status_message; null
	};
	
	if (_isVehicle && _vehicle_near_count == 0) exitWith {
		["You do not own any vehicles of the selected type that are near this shop", _quiet] call shop_set_status_message; null
	};
	
	if (_isBackpack && not(_hasBackpack)) exitWith {
		["You do not have the selected backpack to sell", _quiet] call shop_set_status_message; null
	};
	
	if (_amount > 1 && (_isWeapon || _isVehicle || _isBackpack )) exitWith {
		["The item you have selected can only be sold one at a time", _quiet] call shop_set_status_message; null
	};
	
	if (_isMagazine && _amount > _magazine_count) then {
		["You are trying to sell more magazines/ammution than the amount you have", _quiet] call shop_set_status_message; null
	};
	
	if (_limitedStock && _amount > _demand && not(_isOilBarrel)) exitWith {
		["You are trying to sell more than the current demand for this item", _quiet] call shop_set_status_message; null
	};
	
	if (_isIllegal && iscop) exitWith {
		 ["The selected item is illegal, you are not allowed to sell it", _quiet]  call shop_set_status_message; null
	};
	
	_data set [shop_sell_item_total_return, _total_price];
	_data set [shop_sell_item_sales_tax, _sales_tax];
	_data set [shop_sell_item_market_adjust, _market_adjust];
	_data set [shop_sell_item_max_stock, _max_stock];
	_data set [shop_sell_item_demand, _demand];
	_data set [shop_sell_item_supply, _supply];
	_data set [shop_sell_item_legal, not(_isIllegal)];
	_data set [shop_sell_item_amount, _amount];
	
	_data
};



shop_set_status_message = {
	ARGV(0,_text);
	_quiet = if (count _this > 1) then { _this select 1 } else { false };
	if (_quiet) exitWith {null};
	
	ctrlSetText [buy_sell_status_label_idc, _text];
};

shop_get_buy_item_data = {
	private["_index", "_data", "_data_str"];
	_index = lbCurSel buy_items_list_idc;
	_index = if (undefined(_index)) then { -1 } else { _index };
	if (_index < 0) exitWith {null};
	_data_str =  lbData[buy_items_list_idc, _index];
	_data = (call compile _data_str);
	_data
};

shop_get_sell_item_data = {
	private["_index", "_data", "_data_str"];
	_index = lbCurSel sell_items_list_idc;
	_index = if (undefined(_index)) then { -1 } else { _index };
	if (_index < 0) exitWith {null};
	_data_str =  lbData[sell_items_list_idc, _index];
	_data = (call compile _data_str);
	_data
};

shop_update_buy_item = {
	private ["_data"];
	_data = call shop_get_buy_item_data;
	_data = [_data] call shop_buy_item_validate_data;
	if (undefined(_data)) exitWith {null};
	ctrlEnable [buy_button_idc, true];
	buttonSetAction [buy_button_idc,  "call shop_buy;"];
	_data
};

shop_update_sell_item = {
	private ["_data"];
	_data = call shop_get_sell_item_data;
	_data = [_data] call shop_sell_item_validate_data;
	if (undefined(_data)) exitWith {null};
	ctrlEnable [sell_button_idc, true];
	buttonSetAction [sell_button_idc,  "call shop_sell;"];
	_data
};

shop_buy_transaction = {
	ARGV(0,_data);
	
	if (undefined(_data)) exitWith {null};
	if (typeName _data != "ARRAY") exitWith {null};
	private ["_total_due", "_sales_tax"];
	
	_total_due = [(_data select shop_buy_item_total_due)] call decode_number;
	_sales_tax = _data select shop_buy_item_sales_tax;
	

	[player, 'money', -(_total_due)] call inventory_add_item;
	[_sales_tax] call shop_update_paid_taxes;
	[_data] call shop_buy_update_stocks;
};

shop_sell_transaction = {
	ARGV(0,_data);
	
	if (undefined(_data)) exitWith {null};
	if (typeName _data != "ARRAY") exitWith {null};
	private ["_total_return", "_sales_tax"];
	
	_total_return = _data select shop_sell_item_total_return;
	
	[player, 'money', (_total_return)] call inventory_add_item;
	[_data] call shop_sell_update_stocks;
};

shop_buy = {
	private["_data"];
	_data = call shop_update_buy_item;
	if (undefined(_data)) exitWith {null};

	ctrlEnable [buy_button_idc, false];
	
	[_data] call shop_buy_transaction;
	private ["_type"];
	_type = _data select shop_buy_item_type;
	switch _type do {
		case "Item": {
			[_data] call shop_buy_item;
		};
		case "Fort": {
			[_data] call shop_buy_fort;
		};
		case "Vehicle": {
			[_data] call shop_buy_vehicle;
		};
		case "Weapon": {
			[_data, INV_CreateWeapon] call shop_buy_gear_item;
		};
		case "Magazine": {
			[_data, INV_CreateMag] call shop_buy_gear_item;
		};
		case "backpack": {
			[_data, INV_CreatePack] call shop_buy_gear_item;
		};
		case "Vest": {
			[_data, INV_CreateVest] call shop_buy_gear_item;
		};
		case "Uniform": {
			[_data, INV_CreateUniform] call shop_buy_gear_item;
		};
		case "LinkedItem": {
			[_data, INV_CreateLinkedItem] call shop_buy_gear_item;
		};
		case "BISItem": {
			[_data, INV_CreateBISItem] call shop_buy_gear_item;
		};
		case "Headgear": {
			[_data, INV_CreateHeadgear] call shop_buy_gear_item;
		};
		case "Goggles": {
			[_data, INV_CreateGoggles] call shop_buy_gear_item;
		};
		case "Attachment": {
			[_data, INV_CreateAttachment] call shop_buy_gear_item;
		};
	};
	call shop_update_buy_item;
};

shop_sell_active = false; 
shop_sell = { [] spawn {
	if (shop_sell_active) exitWith {
		player groupChat format["ERROR: shop_sell already active"];
	};
	shop_sell_active = true;
	
	private["_data"];
	_data = call shop_update_sell_item;
	if (undefined(_data)) exitWith {
		shop_sell_active = false;
	};

	ctrlEnable [sell_button_idc, false];

	private ["_type", "_sold"];
	_type = _data select shop_sell_item_type;
	_sold = true;
	switch _type do {
		case "Item": {
			[_data] call shop_sell_item;
		};
		case "Vehicle": {
			_sold = [_data] call shop_sell_vehicle;
		};
		case "Weapon": {
			[_data] call shop_sell_gear;
		};
		case "Magazine": {
			[_data] call shop_sell_gear;
		};
		case "backpack": {
			[_data] call shop_sell_gear;
		};
		case "Vest": {
			[_data] call shop_sell_gear;
		};
		case "Uniform": {
			[_data] call shop_sell_gear;
		};
		case "LinkedItem": {
			[_data] call shop_sell_gear;
		};
		case "BISItem": {
			[_data] call shop_sell_gear;
		};
		case "Headgear": {
			[_data] call shop_sell_gear;
		};
		case "Goggles": {
			[_data] call shop_sell_gear;
		};
		case "Attachment": {
			[_data] call shop_sell_gear;
		};
	};
	
	if (_sold) then {
		[_data] call shop_sell_transaction;
	};
	call shop_update_sell_item;
	
	shop_sell_active = false;
};};

shop_sell_item = {
	ARGV(0,_data);
	
	if (undefined(_data)) exitWith {null};
	if (typeName _data != "ARRAY") exitWith {null};
	
	private ["_item", "_total_return", "_item_name", "_i", "_amount", "_type", "_isDrug", "_price","_kind"];

	_item = _data select shop_sell_item_key;
	_item_name = _data select shop_sell_item_name;
	_total_return = _data select shop_sell_item_total_return;
	_amount = _data select shop_sell_item_amount;
	_type = _data select shop_sell_item_type;
	_kind = _data select shop_sell_item_kind;
	_isDrug = (_kind == "drug");
	_price = [(_data select shop_sell_item_price)] call decode_number;
	_shop_id = _data select shop_sell_item_shop_id;
	
	call shop_play_animation;
	
	//keep track of wh has sold drugs
	if (_isDrug) then {
		private["_list"];
		_list  = [];
		_list set [shop_drug_list_player_uid, getPlayerUID player];
		_list set [shop_drug_list_profit, _total_return];
		[_shop_id, _list] call shop_update_drug_list;
	};

	[player, _item, -(_amount)] call inventory_add_item;
	player groupChat format ["You sold %1 %2 for $%3", _amount, _item_name, strM(_total_return)];
};


shop_sell_select_vehicle = {
	ARGV(0,_vehicle_name);
	if (undefined(_vehicle_name)) exitWith {null};
	if (typeName _vehicle_name != "STRING") exitWith {null};
	
	private["_vehicle"];
	_vehicle = missionNamespace getVariable [_vehicle_name, null];
	shop_sell_selected_vehicle = _vehicle;
	closeDialog 0;
	_vehicle
};

shop_sell_select_vehicle_wait = {
	//player groupChat format["shop_sell_select_vehicle_wait %1", _this];
	ARGV(0,_vehicles);
	
	private["_dialog"];
	if (undefined(_vehicles)) exitWith {null};
	if (typeName _vehicles != "ARRAY") exitWith {null};
	
	private["_class", "_name", "_picture"];
	_class = typeOf(_vehicles select 0);
	_name = getText(configFile >> "CfgVehicles" >> _class >> "displayName");
	_picture = [_class] call generic_picture_path;
	
	private["_controls", "_list", "_submit"];
	_controls = [toUpper(format["%1 LIST", _name]), 0.14, 0.14, 0.55, 0.45] call list_simple_menu_setup;
	_list = _controls select list_simple_menu_list;
	_submit = _controls select list_simple_menu_submit;
	
	_submit ctrlSetText "Sell";
	_submit ctrlCommit 0;
	
	private["_list_idc"];
	_list_idc = (ctrlIDC _list);
	
	buttonSetAction [(ctrlIDC _submit), '[([] call list_simple_menu_label_data)] call shop_sell_select_vehicle;'];
	private["_i", "_count"];
	_count = count _vehicles;
	_i = 0;
	shop_sell_selected_vehicle = null;
	while { _i < _count } do {
		private["_index", "_vehicle", "_vehicle_str", "_distance"];
		_vehicle = _vehicles select _i;
		_distance = round(player distance _vehicle);
		_vehicle_str = format["%1 (%2 meters)", _vehicle, _distance];
		_index = lbAdd [_list_idc, _vehicle_str];
		lbSetData [_list_idc, _index, str(_vehicle)];
		lbSetPicture [_list_idc, _index, _picture];
		_i = _i + 1;
	};
	lbSetCurSel [_list_idc, 0];
	
	waitUntil { not(ctrlVisible _list_idc)};
	
	_vehicle = shop_sell_selected_vehicle;
	shop_sell_selected_vehicle = null;
	_vehicle
};

shop_sell_vehicle = {
	disableSerialization;
	ARGV(0,_data);
	
	if (undefined(_data)) exitWith {null};
	if (typeName _data != "ARRAY") exitWith {null};
	private["_player"];
	_player = player;
	
	private ["_class", "_item", "_total_return", "_class", "_item_name", "_i", "_amount", "_type", "_vehicles", "_vehicle"];
	
	_item = _data select shop_sell_item_key;
	_item_name = _data select shop_sell_item_name;
	_class = _data select shop_sell_item_class;
	_total_return = _data select shop_sell_item_total_return;
	_amount = _data select shop_sell_item_amount;
	_type = _data select shop_sell_item_type;
	
	_vehicles = [_player, _class, _item, 50] call shop_get_vehicles_by_class_item;
	_vehicles_count = (count _vehicles);
	_vehicle = null;
	if  (_vehicles_count == 0) exitWith { false };
	if (_vehicles_count > 1) then {
		_vehicle = [_vehicles] call shop_sell_select_vehicle_wait;
	}
	else {
		_vehicle = _vehicles select 0;
	};
	
	[_player, _vehicle] call vehicle_remove;
	if (undefined(_vehicle)) exitWith { false };

	
	private["_uid"];
	_uid = getPlayerUID _player;
	
	[_vehicle, "uid_sold", _uid, true] call object_setVariable;
	player groupChat format["Vehicle being sold, please wait 5 seconds"];
	closeDialog 0;
	sleep 5;
	private["_uid_sold"];
	_uid_sold = [_vehicle, "uid_sold"] call object_getVariable;
	_uid_sold = if (undefined(_uid_sold)) then {""} else {_uid_sold};
	_uid_sold = if (typeName _uid_sold != "STRING") then {""} else {_uid_sold};
	
	if (_uid_sold != _uid || undefined(_vehicle)) exitWith {
		player groupChat format["ERROR: Someone already sold this vehicle"];
		false
	};
	
	player groupChat format["You sold the vehicle for $%1.", strM(_total_return)];
	deleteVehicle _vehicle;
	true
};

shop_get_vehicles_by_class_item = {
	//player groupChat format["shop_get_vehicles_by_class_item %1", _this];

	ARGV(0,_player);
	ARGV(1,_class);
	ARGV(2,_item);
	ARGV(3,_distance);
	
	if (not([_player] call player_exists)) exitWith {[]};
	if (undefined(_class)) exitWith { [] };
	if (typeName _class != "STRING") exitWith { [] };
	if (undefined(_item)) exitWith {[]};
	if (typeName _item != "STRING") exitWith {[]};
	if (undefined(_distance)) exitWith { [] };
	if (typeName _distance != "SCALAR") exitWith { [] };
	
	private["_vehicles"];
	_vehicles = [];

	_vehicles_name_list = [_player] call vehicle_list;


	private["_vehicle", "_vehicle_name"];
	
	{
		_vehicle_name = _x;
		_vehicle = missionNamespace getVariable [_vehicle_name, null];
		if (true) then {
			if (undefined(_vehicle)) exitWith {null};
			if (not(alive(_vehicle))) exitWith {null};
			private["_cdistance"];
			_cdistance = _player distance _vehicle;
			//player groupChat format["_actual_distance = %1, _check_distance = %2", _cdistance , _distance];
			if (_cdistance > _distance) exitWith {null};
			if (typeOf _vehicle != _class) exitWith {null};
			
			private["_citem"];
			_citem = [_vehicle, "item_name"] call vehicle_get_string;
			//player groupChat format["_citem = %1", _citem];
			if (_citem != _item) exitWith {null};
			
			_vehicles = _vehicles + [_vehicle];
		};
	} foreach _vehicles_name_list;
	
	_vehicles

	
};

shop_sell_gear = {	
	ARGV(0,_data);
	
	if (undefined(_data)) exitWith {null};
	if (typeName _data != "ARRAY") exitWith {null};
	
	private ["_class", "_total_return", "_class", "_item_name", "_i", "_amount", "_type"];
	
	_item_name = _data select shop_sell_item_name;
	_class = _data select shop_sell_item_class;
	_total_return = _data select shop_sell_item_total_return;
	_amount = _data select shop_sell_item_amount;
	_type = _data select shop_sell_item_type;
	
	call shop_play_animation;
	
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
			[player, _class] call removePlayerInventoryItem;
		};};};};

		_i = _i - 1;
	};
	
	player groupChat format["You sold %1 %2 for $%3", _amount, _item_name, strM(_total_return)];	
};

shop_buy_item = {
	ARGV(0,_data);
	
	if (undefined(_data)) exitWith {null};
	if (typeName _data != "ARRAY") exitWith {null};
	private ["_amount", "_item", "_total_due", "_shop_id", "_item_name"];
	
	_total_due = [(_data select shop_buy_item_total_due)] call decode_number;
	_amount = _data select shop_buy_item_amount;
	_item_name = _data select shop_buy_item_name;
	_item = _data select shop_buy_item_key;
	_shop_id = _data select shop_buy_item_shop_id;
	_kind =  _data select shop_buy_item_kind;
	_isDrug = (_kind == "drug");
	
	if (_isDrug && _total_due > 0) then {
		[_shop_id, _total_due] call shop_distribute_drug_sale;
	};
	
	call shop_play_animation;
	[player, _item, _amount, ([player] call player_inventory_name)] call INV_CreateItem;
	player groupChat format["You bought %1 %2 for $%3", _amount, _item_name, strM(_total_due)];
};


shop_buy_gear_item = {
	ARGV(0,_data);
	ARGV(1,_function);
	
	if (undefined(_data)) exitWith {null};
	if (typeName _data != "ARRAY") exitWith {null};
	
	if (undefined(_function)) exitWith {null};
	if (typeName _function != "CODE") exitWith {null};
	
	private ["_type", "_amount", "_item", "_total_due", "_item_name", "_class", "_crate", "_in_hands"];
	
	_amount = _data select shop_buy_item_amount;
	_item_name = _data select shop_buy_item_name;
	_class = _data select shop_buy_item_class;
	_crate = objectFromNetId(_data select shop_buy_item_crate_netid);
	_total_due = [(_data select shop_buy_item_total_due)] call decode_number;;
	_type = _data select shop_buy_item_type;
	_in_hands = _data select shop_buy_item_in_hands;
	
	if (_in_hands) then {
		call shop_play_animation;
	};
	
	[_class, _amount, _crate, _in_hands] spawn _function;
		
	player groupChat format["You bought %1 %2 for $%3", _amount, _item_name, strM(_total_due)];
};

shop_buy_fort = {
	_this spawn {
		ARGV(0,_data);

		if (undefined(_data)) exitWith {null};
		if (typeName _data != "ARRAY") exitWith {null};
		
		private ["_kind", "_total_due", "_item_name", "_class", "_logic", "_sleep_time"];
		_item_name = _data select shop_buy_item_name;
		_logic = objectFromNetId(_data select shop_buy_item_logic_netid);
		_total_due = [(_data select shop_buy_item_total_due)] call decode_number;
		_kind = _data select shop_buy_item_kind;
		_class = _data select shop_buy_item_class;
		_sleep_time = 5;
		
		player groupChat format ["You bought a %1 for $%2. Please wait %3 seconds until the vehicle spawns.", _item_name, strM(_total_due), _sleep_time];
		[_sleep_time] call shop_set_busy;
		sleep _sleep_time;
		[_logic, _class, _kind] spawn INV_CreateFort;
	};
};

shop_get_gang_by_shop_id = {
	ARGV(0,_shop_id);
	private["_shop_cache"];
	_shop_cache = [_shop_id] call shop_lookup;
	if (undefined(_shop_cache)) exitWith {null};
	
	private["_gang_id", "_gang"];
	_gang_id = [_shop_cache, "control"] call object_getVariable;
	if (undefined(_gang_id)) exitWith {null};
	if (typeName _gang_id  != "STRING") exitWith {null};
	if (_gang_id == "") exitWith {null};
	
	([_gang_id] call gangs_lookup_id)
};

shop_distribute_drug_sale = {
	ARGV(0,_shop_id);
	ARGV(1,_total_due);

	if (undefined(_total_due)) exitWith {null};
	if (typeName _total_due != "SCALAR") exitWith {null};

	
	private["_gang", "_gang_name", "_gang_members", "_income"];
	_gang = [_shop_id] call shop_get_gang_by_shop_id;
	
	if (undefined(_gang)) exitWith {null};
	_gang_name = _gang select gang_name;
	_gang_members = _gang select gang_members;
	_gang_members_count = (count _gang_members);
	if (_gang_members_count == 0) exitWith {null};
	
	_income = round(_total_due/_gang_members_count);
	format['if((getPlayerUID player) in %1) then {player groupchat "You received $%2 from a drug sale"; [player, %2] call bank_transaction;};', _gang_members, strM(_income)] call broadcast;
};

shop_get_drug_list = {
	ARGV(0,_shop_id);
	
	private["_shop_cache"];
	_shop_cache = [_shop_id] call shop_lookup;
	if (undefined(_shop_cache)) exitWith {[]};
	
	private["_list"];
	_list = [_shop_cache, "drugList"] call object_getVariable;
	if (undefined(_list)) exitWith {[]};
	if (typeName _list != "ARRAY") exitWith {[]};
	
	_list
};

shop_update_drug_list = {
	ARGV(0,_shop_id);
	private["_shop_cache"];
	_shop_cache = [_shop_id] call shop_lookup;
	if (undefined(_shop_cache)) exitWith {null};
	
	private["_data"];
	ARGV(1,_data);
	if (undefined(_data)) exitWith {null};
	
	private["_list", "_uid", "_profit"];
	_list = [_shop_id] call shop_get_drug_list;
	
	//if player uid is already in the list, just update it
	_uid = _data select shop_drug_list_player_uid;
	_profit = _data select shop_drug_list_profit;
	private["_inList"];
	_inList = false;
	{
		private["_cdata", "_cuid", "_cprofit"];
		_cdata = _x;
		_cuid = _cdata select shop_drug_list_player_uid;
		_cprofit = _cdata select shop_drug_list_profit;
		if (_cuid == _uid) exitWith {
			_cdata set [shop_drug_list_profit, (_cprofit + _profit)];
			_inList = true;
		};
	} foreach _list;
	
	if (not(_inList)) then {
		_list = _list + [_data];
	};
	
	[_shop_id, _list] call shop_set_drug_list;
	
	_list
};

shop_set_drug_list = {
	ARGV(0,_shop_id);
	ARGV(1,_list);
	
	private["_shop_cache"];
	_shop_cache = [_shop_id] call shop_lookup;
	if (undefined(_shop_cache)) exitWith {null};
	if (undefined(_list)) exitWith {[]};
	if (typeName _list != "ARRAY") exitWith {[]};
	
	[_shop_cache, "drugList", _list, true] call object_setVariable; 
	_list
};

shop_drug_list_player_uid = 0;
shop_drug_list_profit = 1;

shop_get_player_by_uid = {
	ARGV(0,_uid);
	if (undefined(_uid)) exitWith {null};
	if (typeName _uid != "STRING") exitWith {null};
	
	private["_player"];
	_player = null;
	{
		private["_player_variable_name", "_cplayer", "_cuid"];
		_player_variable_name = _x;
		_cplayer = missionNamespace getVariable [_player_variable_name, null];
		_cuid = getPlayerUID _cplayer; 
		if (_cuid == _uid) exitWith {
			_player = _cplayer;
		};
	} foreach playerstringarray;
	
	_player
};

shop_drug_search = {
	waituntil{!shop_busy};
	shop_busy=true;
	ARGV(0,_shop_id);
	
	private["_list"];
	_list = [_shop_id] call shop_get_drug_list;
	
	//player groupChat format["_shop_id = %1, _list = %2", _shop_id, _list];
	
	if(count _list == 0) exitWith {
		player groupchat "No drugs found";
		shop_busy=false;
	};
	
	{
		if (true) then {
			private["_data", "_player", "_profit", "_uid"];
			_data = _x;
			_uid = _data select shop_drug_list_player_uid;
			_profit = _data select shop_drug_list_profit;
			_player =  [_uid] call player_lookup_uid;
			if (undefined(_player)) exitWith {shop_busy=false;};
			
			player groupChat format["This civilian bought $%1 worth of drugs from %2-%3!", strM(_profit), _player, (name _player)];
			
			[_player, "(drug-trafficking)", _profit] call player_update_warrants;
			private["_message"];
			_message = format["%1-%2 is wanted for trafficking $%3 worth of drugs!", _player, (name _player), strM(_profit)];
			format['titleText [toString(%1), "PLAIN"];', toArray(_message)] call broadcast;
		};
	} foreach _list;
	
	_list = [];
	shop_busy=false;
	[_shop_id, _list] call shop_set_drug_list;
};


shop_busy = false;
shop_set_busy = {
	_this spawn {
		ARGV(0,_timeout);
		_timeout = if(undefined(_timeout)) then { 0 } else {_timeout};
		_timeout = if (typeName _timeout != "SCALAR") then { 0 } else { _timeout };
		if (shop_busy) exitWith {null};
		shop_busy = true;
		call shop_update_buy_item;
		call shop_update_sell_item;
		sleep _timeout;
		shop_busy = false;
		call shop_update_buy_item;
		call shop_update_sell_item;
	};	
};

shop_is_busy = {
	shop_busy
};

shop_buy_vehicle = {
	_this spawn {
		ARGV(0,_data);

		if (undefined(_data)) exitWith {null};
		if (typeName _data != "ARRAY") exitWith {null};
		
		private ["_kind", "_total_due", "_item_name", "_class", "_logic", "_sleep_time"];
		_item = _data select shop_buy_item_key;
		_item_name = _data select shop_buy_item_name;
		_logic = objectFromNetId(_data select shop_buy_item_logic_netid);
		_total_due = [(_data select shop_buy_item_total_due)] call decode_number;
		_class = _data select shop_buy_item_class;
		_sleep_time = 5;
		
		player groupChat format ["You bought a %1 for $%2. Please wait %3 seconds until the vehicle spawns.", _item_name, strM(_total_due), _sleep_time];
		[_sleep_time] call shop_set_busy;
		sleep _sleep_time;
		[_logic, _class, _item] spawn vehicle_create_shop;
	};
};

shop_reset_paid_taxes = {
	INV_TaxesPaid = 0;
};

shop_get_paid_taxes = {
	if (undefined(INV_TaxesPaid)) then { INV_TaxesPaid = 0; };
	INV_TaxesPaid
};

shop_update_paid_taxes = {
	ARGV(0,_sales_tax);
	if (undefined(_sales_tax)) exitWith {null};
	if (typeName _sales_tax != "SCALAR") exitWith {null};
	
	if (undefined(INV_TaxesPaid)) then { INV_TaxesPaid = 0; };
	INV_TaxesPaid = INV_TaxesPaid + _sales_tax;
};

shop_buy_update_stocks = {
	ARGV(0,_data);
	if (undefined(_data)) exitWith {null};
	if (typeName _data != "ARRAY") exitWith {null};
	
	_item = _data select shop_buy_item_key;
	_max_stock = _data select shop_buy_item_max_stock;
	_amount = _data select shop_buy_item_amount;
	_supply = _data select shop_buy_item_supply;
	_shop_id = _data select shop_buy_item_shop_id;
	_isOilBarrel = (_item == "OilBarrel");
	
	if (_isOilBarrel) exitWith {
		[(_amount * fuel_per_barrel)] call shop_update_fuel_consumed;
	};
	
	if (_max_stock < 0) exitWith {null};
	_new_supply = _supply - _amount;
	format['["%1", %2, %3] call inventory_item_stock_update;', _item, _new_supply, _shop_id] call broadcast;
};

shop_sell_update_stocks = {
	ARGV(0,_data);
	if (undefined(_data)) exitWith {null};
	if (typeName _data != "ARRAY") exitWith {null};
	
	_item = _data select shop_sell_item_key;
	_max_stock = _data select shop_sell_item_max_stock;
	_amount = _data select shop_sell_item_amount;
	_supply = _data select shop_sell_item_supply;
	_shop_id = _data select shop_sell_item_shop_id;
	_isOilBarrel = (_item == "OilBarrel");
	
	if (_isOilBarrel) exitWith {
		[-(_amount * fuel_per_barrel)] call shop_update_fuel_consumed;
	};
	
	if (_max_stock < 0) exitWith {null};
	_new_supply = _supply + _amount;
	format['["%1", %2, %3] call inventory_item_stock_update;', _item, _new_supply, _shop_id] call broadcast;
};


shop_play_animation = {
	private["_move"];
	_move = if (primaryweapon player == "" && secondaryweapon player == "") then { "AmovPercMstpSnonWnonDnon_AinvPknlMstpSnonWnonDnon" } else  {"AinvPknlMstpSlayWrflDnon"};
	if ((vehicle player) == player) then {
		player playMove _move;
		format['%1 playMove "%2;"', player, _move] call broadcast;
	};
};

shop_refresh_put_gear_cb = {
	ARGV(0,_shop_id);
	
	private["_state", "_new_state_str"];
	_state = [_shop_id] call shop_get_put_gear_cb;
	_new_state_str = if (_state) then { "[x]" } else { "[ ]" };
	CtrlSettext [buy_put_gear_label_idc, format["%1 - Put weapon in hands", _new_state_str]];
};

shop_refresh_sell_cb = {
	ARGV(0,_shop_id);
	
	private["_state", "_new_state_str"];
	_state = [_shop_id] call shop_get_sell_cb;
	_new_state_str = if (_state) then { "[x]" } else { "[ ]" };
	CtrlSettext [sell_show_all_items_label_idc, format["%1 - Hide unsellable items", _new_state_str]];
};

shop_set_put_gear_cb = {
	ARGV(0,_shop_id);
	ARGV(1,_state);
	
	private ["_shop_cache"];
	_shop_cache = [_shop_id] call shop_lookup;
	if (undefined(_shop_cache)) exitWith {null};
	
	if (undefined(_state)) then { _state = true; };
	if (typeName _state != "BOOL") then { _state = true;};
		
	[_shop_cache, "put_gear", _state] call object_setVariable; 
};

shop_set_sell_cb = {	
	ARGV(0,_shop_id);
	ARGV(1,_state);
	
	private ["_shop_cache"];
	_shop_cache = [_shop_id] call shop_lookup;
	if (undefined(_shop_cache)) exitWith {null};
	
	if (undefined(_state)) then { _state = false; };
	if (typeName _state != "BOOL") then { _state = false;};
		
	[_shop_cache, "hide_sell_items", _state] call object_setVariable; 
};

shop_get_put_gear_cb = {
	ARGV(0,_shop_id);
	
	private ["_shop_cache"];
	_shop_cache = [_shop_id] call shop_lookup;
	if (undefined(_shop_cache)) exitWith {null};
	
	private ["_state"];
	_state = [_shop_cache, "put_gear"] call object_getVariable;
	if (undefined(_state)) exitWith { false };
	if (typeName _state != "BOOL") exitWith { false };
	_state
};

shop_get_sell_cb = {
	ARGV(0,_shop_id);
	
	private ["_shop_cache"];
	_shop_cache = [_shop_id] call shop_lookup;
	if (undefined(_shop_cache)) exitWith { false };
	
	private ["_state"];
	_state = [_shop_cache, "hide_sell_items"] call object_getVariable;	
	if (undefined(_state)) exitWith { false };
	if (typeName _state != "BOOL") exitWith { false };
	_state
};

shop_toggle_put_gear_cb = {
	private["_control", "_element", "_state", "_shop_id", "_current_state"];
	_shop_id = call shop_get_current_shop_id;
	_current_state = [_shop_id] call shop_get_put_gear_cb;
	[_shop_id, not(_current_state)] call shop_set_put_gear_cb;
	[_shop_id] call shop_refresh_put_gear_cb;
};

shop_toggle_sell_cb = {
	private["_control", "_element", "_state", "_shop_id", "_current_state"];
	_shop_id = call shop_get_current_shop_id;
	_current_state = [_shop_id] call shop_get_sell_cb;
	[_shop_id, not(_current_state)] call shop_set_sell_cb;
	[_shop_id] call shop_refresh_sell_cb;
};

shop_set_current_shop_id = {
	ARGV(0,_shop_id);
	if (undefined(_shop_id)) exitWith {null};
	if (typeName _shop_id != "SCALAR") exitWith {null};
	
	[player, "current_shop_id", _shop_id] call object_setVariable;
};

shop_get_current_shop_id = {
	private["_shop_id", "_shopDialog"];
	
	_shopDialog = findDisplay shop_dialog_idd;
	if (isNull _shopDialog) exitWith {null};
	
	_shop_id = [player, "current_shop_id"] call object_getVariable;
	if (undefined(_shop_id)) exitWith {null};
	if (typeName _shop_id != "SCALAR") exitWith {null};
	_shop_id
};



shop_get_fuel_consumed = {
	private["_fuel_consumed"];
	_fuel_consumed = server getVariable "fuel_consumed";
	_fuel_consumed
};

shop_set_fuel_consumed = {
	ARGV(0,_fuel_consumed);
	if (undefined(_fuel_consumed)) exitWith {null};
	if (typeName _fuel_consumed != "SCALAR") exitWith {null};
	
	server setVariable ["fuel_consumed", _fuel_consumed, true];
};

shop_update_fuel_consumed = {
	ARGV(0,_consumed);
	if (undefined(_consumed)) exitWith {null};
	if (typeName _consumed != "SCALAR") exitWith {null};
	
	private["_total_consumed"];
	_total_consumed = call shop_get_fuel_consumed;
	_total_consumed = _total_consumed + _consumed;
	
	if (_total_consumed < 0) then {
		_total_consumed = 0;
	};
	
	if (_total_consumed > fuel_max_reserve) then {
		_total_consumed = fuel_max_reserve;
	};
	
	[_total_consumed] call shop_set_fuel_consumed;
};

shop_get_fuel_price = {
	private["_price", "_fuel_consumed", "_barrels_consumed"];
	//the price of fuel goes up by 0.1 for every barrel of oil that is consumed
	_fuel_consumed = call shop_get_fuel_consumed;
	_barrels_consumed = _fuel_consumed / fuel_per_barrel;
	_price = fuel_base_price + (_barrels_consumed * 0.1);
	(round(_price * 100) / 100)
};

shop_get_oil_barrel_demand = {
	round((call shop_get_fuel_consumed)/fuel_per_barrel)
};

shop_get_oil_barrel_max_stock = {
  round(fuel_max_reserve/fuel_per_barrel)
};

shop_get_oil_barrel_supply = {
	private["_demand", "_supply", "_max_stock"];
	_demand = call shop_get_oil_barrel_demand;
	_max_stock = call shop_get_oil_barrel_stock;
	_supply = _max_stock - _demand;
	_supply
};




shop_menu_setup = {
	disableSerialization;
	//player groupChat format["shop_menu_setup"];
	
	private["_display"];
	_display = uiNamespace getVariable "SHOPS_MENU";

	_buy_background = _display displayCtrl buy_background_idc;
	_sell_background = _display displayCtrl sell_background_idc;
	_buy_frame = _display displayCtrl buy_frame_idc;
	_sell_frame = _display displayCtrl sell_frame_idc;
	_sell_show_all_items_label = _display displayCtrl sell_show_all_items_label_idc;
	_sell_show_all_items_cbox = _display displayCtrl sell_show_all_items_cbox_idc;
	_buy_put_gear_label = _display displayCtrl buy_put_gear_label_idc;
	_buy_put_gear_cbox = _display displayCtrl buy_put_gear_cbox_idc;

	_sell_items_list = _display displayCtrl sell_items_list_idc;
	_sell_button = _display displayCtrl sell_button_idc;
	_sell_button_cancel = _display displayCtrl sell_button_cancel_idc;
	_sell_demand_label = _display displayCtrl sell_demand_label_idc;
	_sell_demand_field = _display displayCtrl sell_demand_field_idc;
	_sell_items_to_sell_label = _display displayCtrl sell_items_to_sell_label_idc;
	_sell_items_to_sell_field = _display displayCtrl sell_items_to_sell_field_idc;
	_sell_items_to_sell_background = _display displayCtrl sell_items_to_sell_background_idc;
	_sell_market_adjust_label = _display displayCtrl sell_market_adjust_label_idc;
	_sell_market_adjust_field = _display displayCtrl sell_market_ajust_field_idc;
	_sell_sales_tax_label = _display displayCtrl sell_sales_tax_label_idc;
	_sell_sales_tax_field = _display displayCtrl sell_sales_tax_field_idc;
	_sell_total_return_label = _display displayCtrl sell_total_return_label_idc;
	_sell_total_return_field = _display displayCtrl sell_total_return_field_idc;
						
	_buy_items_list = _display displayCtrl buy_items_list_idc;
	_buy_button = _display displayCtrl buy_button_idc;
	_buy_button_cancel = _display displayCtrl buy_button_cancel_idc;
	_buy_supply_label = _display displayCtrl buy_supply_label_idc;
	_buy_supply_field = _display displayCtrl buy_supply_field_idc;
	_buy_items_to_buy_label = _display displayCtrl buy_items_to_buy_label_idc;
	_buy_items_to_buy_field = _display displayCtrl buy_items_to_buy_field_idc;
	_buy_tiems_to_buy_field_background = _display displayCtrl buy_tiems_to_buy_field_background_idc;
	_buy_market_adjust_label = _display displayCtrl buy_market_adjust_label_idc;
	_buy_market_adjust_field = _display displayCtrl buy_marked_adjust_field_idc;
	_buy_sales_tax_label = _display displayCtrl buy_sales_tax_label_idc;
	_buy_sales_tax_field = _display displayCtrl buy_salex_tax_field_idc;
	_buy_total_due_label = _display displayCtrl buy_total_due_label_idc;
	_buy_total_due_field = _display displayCtrl buy_total_due_field_idc;
		
	_buy_sell_status_background = _display displayCtrl buy_sell_status_background_idc;
	_buy_sell_status_frame = _display displayCtrl buy_sell_status_frame_idc;
	_buy_sell_status_label = _display displayCtrl buy_sell_status_label_idc;

	_shop_vehicle_list = _display displayCtrl shop_vehicle_list_idc;
	_shop_vehicle_header = _display displayCtrl shop_vehicle_header_idc;
	_shop_vehicle_background = _display displayCtrl shop_vehicle_background_idc;
	_shop_vehicle_select_button = _display displayCtrl shop_vehicle_select_button_idc;
	_shop_vehicle_cancel_button = _display displayCtrl shop_vehicle_cancel_button_idc;
	
	private["_x", "_y", "_ysep", "_sep", "_buy_title", "_title_sell", "_w", "_h"];
	_x = 0.14;
	_y = 0.14;
	_w = 0.45;
	_h = 0.83;
	_ysep = 0.003;
	_sep = 0.01;
	_buy_title = "BUY ITEMS";
	_sell_title = "SELL ITEMS";
	
	private["_button_font_height", "_font_family"];
	_button_font_height = MENU_TITLE_FONT_HEIGHT;
	_font_family = "PuristaMedium";
	
	//buy header
	private["_bhx", "_bhy", "_bhw", "_bhh"];
	_bhx = _x;
	_bhy = _y;
	_bhw = _w;
	_bhh = 0.045;
	
	_buy_frame ctrlSetPosition [_bhx, _bhy, _bhw, _bhh];
	_buy_frame ctrlSetFontHeight _button_font_height;
	_buy_frame ctrlSetText _buy_title;
	_buy_frame ctrlSetFont _font_family;
	_buy_frame ctrlCommit 0;
	
	//buy close button
	private["_bcx", "_bcy", "_bcw", "_bch"];
	_bcw = 0.14;
	_bch = _bhh;
	_bcx = _bhx + _bhw - _bcw;
	_bcy = _bhy + _h - _bch;
	
	_buy_button_cancel ctrlSetText "Cancel";
	_buy_button_cancel ctrlSetPosition [_bcx, _bcy, _bcw, _bch];
	buttonSetAction [(ctrlIDC _buy_button_cancel), "closeDialog 0"];
	_buy_button_cancel ctrlCommit 0;
	
	//buy background
	private["_bbx", "_bby", "_bbw", "_bbh"];
	_bbx = _bhx;
	_bby = _bhy + _bhh + _ysep;
	_bbw = _w;
	_bbh = (_bcy ) - (_bhy ) - _bch - _ysep - _ysep;
	
	_buy_background ctrlSetPosition [_bbx, _bby, _bbw, _bbh];
	_buy_background ctrlSetBackgroundColor [0,0,0,0.65];
	_buy_background ctrlCommit 0;
	
	//buy button
	private["_btx", "_bty" ,"_btw", "_bth"];
	_btx = _bhx;
	_bty = _bby + _bbh + _ysep;
	_btw = _bcw * 1.2;
	_bth = _bch;
	
	_buy_button ctrlSetText "Buy";
	_buy_button ctrlSetPosition [_btx, _bty, _btw, _bth];
	_buy_button ctrlCommit 0;
	
	//buy list
	private["_blx", "_bly", "_blw", "_blh"];
	_blx = _bbx + _sep;
	_bly = _bby + _sep;
	_blw = _bbw - _sep * 2;
	_blh = _bbh * 0.55;
	
	//player groupChat format["_blh = %1", _blh];
	
	_buy_items_list ctrlSetPosition [_blx, _bly, _blw, _blh];
	_buy_items_list ctrlSetFontHeight _button_font_height * 0.9;
	_buy_items_list ctrlCommit 0;
	
	//items to buy label
	private["_bilx", "_bily", "_bilw", "_bilh"];
	_bilx = _blx; 
	_bily = _bly + _blh + _sep * 2;
	_bilw = _blw / 2  - _sep;
	_bilh = 0.04;

	
	_buy_items_to_buy_label ctrlSetText "Items to buy:";
	_buy_items_to_buy_label ctrlSetPosition [_bilx, _bily, _bilw, _bilh];
	_buy_items_to_buy_label ctrlSetFontHeight _button_font_height - 0.003;
	_buy_items_to_buy_label ctrlCommit 0;
	
	//items to buy field
	private["_bifx", "_bify", "_bifw", "_bifh"];
	_bifx = _bilx + _bilw + _sep ;
	_bify = _bily;
	_bifw = _bilw;
	_bifh = _bilh;
	
	_buy_items_to_buy_field ctrlSetFontHeight _button_font_height - 0.003;;
	_buy_items_to_buy_field ctrlSetFont _font_family;
	_buy_items_to_buy_field ctrlSetPosition [_bifx, _bify, _bifw, _bifh];
	_buy_items_to_buy_field ctrlSetBackgroundColor [1,1,1,0.08];
	_buy_items_to_buy_field ctrlCommit 0;
	
	
	//buy supply label
	private["_bslx", "_bsly", "_bslw", "_bslh"];
	_bslx = _bilx; 
	_bsly = _bily + _bilh + _ysep * 2;
	_bslw = _bilw;
	_bslh = _bilh;

	_buy_supply_label ctrlSetText "Supply:";
	_buy_supply_label ctrlSetPosition [_bslx, _bsly, _bslw, _bslh];
	_buy_supply_label ctrlSetFontHeight _button_font_height - 0.003;
	_buy_supply_label ctrlCommit 0;
	
	
	//buy supply field
	private["_bsfx", "_bsfy", "_bsfw", "_bsfh"];
	_bsfx = _bslx + _bslw + _sep ;
	_bsfy = _bsly;
	_bsfw = _bslw;
	_bsfh = _bslh;
	
	_buy_supply_field ctrlSetFontHeight _button_font_height - 0.003;;
	_buy_supply_field ctrlSetFont _font_family;
	_buy_supply_field ctrlSetPosition [_bsfx, _bsfy, _bsfw, _bsfh];
	_buy_supply_field ctrlSetBackgroundColor [1,1,1,0.08];
	_buy_supply_field ctrlCommit 0;
	
	
	
	//buy market adjustment label
	private["_bmlx", "_bmly", "_bmlw", "_bmlh"];
	_bmlx = _bslx; 
	_bmly = _bsly + _bslh + _ysep * 2;
	_bmlw = _bslw;
	_bmlh = _bslh;

	_buy_market_adjust_label ctrlSetText "Market adjustment:";
	_buy_market_adjust_label ctrlSetPosition [_bmlx, _bmly, _bmlw, _bmlh];
	_buy_market_adjust_label ctrlSetFontHeight _button_font_height - 0.003;
	_buy_market_adjust_label ctrlCommit 0;
	
	
	//buy market adjustment field
	private["_bmfx", "_bmfy", "_bmfw", "_bmfh"];
	_bmfx = _bmlx + _bmlw + _sep ;
	_bmfy = _bmly;
	_bmfw = _bslw;
	_bmfh = _bslh;
	
	_buy_market_adjust_field ctrlSetFontHeight _button_font_height - 0.003;;
	_buy_market_adjust_field ctrlSetFont _font_family;
	_buy_market_adjust_field ctrlSetPosition [_bmfx, _bmfy, _bmfw, _bmfh];
	_buy_market_adjust_field ctrlSetBackgroundColor [1,1,1,0.08];
	_buy_market_adjust_field ctrlCommit 0;
	
	
	
	//buy sales tax label
	private["_btlx", "_btly", "_btlw", "_btlh"];
	_btlx = _bmlx; 
	_btly = _bmly + _bmlh + _ysep * 2;
	_btlw = _bmlw;
	_btlh = _bmlh;

	_buy_sales_tax_label ctrlSetText "Sales tax:";
	_buy_sales_tax_label ctrlSetPosition [_btlx, _btly, _btlw, _btlh];
	_buy_sales_tax_label ctrlSetFontHeight _button_font_height - 0.003;
	_buy_sales_tax_label ctrlCommit 0;
	
	
	//buy sales tax field
	private["_btfx", "_btfy", "_btfw", "_btfh"];
	_btfx = _btlx + _btlw + _sep ;
	_btfy = _btly;
	_btfw = _bmlw;
	_btfh = _bmlh;
	
	_buy_sales_tax_field ctrlSetFontHeight _button_font_height - 0.003;;
	_buy_sales_tax_field ctrlSetFont _font_family;
	_buy_sales_tax_field ctrlSetPosition [_btfx, _btfy, _btfw, _btfh];
	_buy_sales_tax_field ctrlSetBackgroundColor [1,1,1,0.08];
	_buy_sales_tax_field ctrlCommit 0;
	
	//buy total due label
	private["_bulx", "_buly", "_bulw", "_bulh"];
	_bulx = _btlx; 
	_buly = _btly + _btlh + _ysep * 2;
	_bulw = _btlw;
	_bulh = _btlh;

	_buy_total_due_label ctrlSetText "Total due:";
	_buy_total_due_label ctrlSetPosition [_bulx, _buly, _bulw, _bulh];
	_buy_total_due_label ctrlSetFontHeight _button_font_height - 0.003;
	_buy_total_due_label ctrlCommit 0;
	
	
	//buy total due field
	private["_bufx", "_bufy", "_bufw", "_bufh"];
	_bufx = _bulx + _bulw + _sep ;
	_bufy = _buly;
	_bufw = _btlw;
	_bufh = _btlh;
	
	_buy_total_due_field ctrlSetFontHeight _button_font_height - 0.003;;
	_buy_total_due_field ctrlSetFont _font_family;
	_buy_total_due_field ctrlSetPosition [_bufx, _bufy, _bufw, _bufh];
	//_buy_total_due_field ctrlSetBackgroundColor [1,1,1,0.08];
	_buy_total_due_field ctrlCommit 0;
	
	
	//buy check box
	private["_bxlx", "_bxly", "_bxlw", "_bxlh"];
	_bxlx = _bulx;
	_bxly = _buly + _bulh + _ysep * 2;
	_bxlw = _bulw * 2 + _sep;
	_bxlh = _bulh;
	
	_buy_put_gear_cbox ctrlSetPosition [_bxlx, _bxly, _bxlw, _bxlh];
	_buy_put_gear_cbox ctrlSetBackgroundColor [1,0,0,1];
	_buy_put_gear_cbox ctrlCommit 0;
	
	_buy_put_gear_label ctrlSetText "[ ] - Put weapon in hands";
	_buy_put_gear_label ctrlSetPosition [_bxlx, _bxly, _bxlw, _bxlh];
	_buy_put_gear_label ctrlSetFontHeight _button_font_height - 0.003;
	//_buy_put_gear_label ctrlSetbackgroundColor [1,0,0,1];
	_buy_put_gear_label ctrlCommit 0;
	
	

	//sell header
	private["_bhx", "_bhy", "_bhw", "_bhh"];
	_shx = _bhx + _bhw + _sep * 4;
	_shy = _bhy;
	_shw = _w;
	_shh = _bhh;
	
	_sell_frame ctrlSetPosition [_shx, _shy, _shw, _shh];
	_sell_frame ctrlSetFontHeight _button_font_height;
	_sell_frame ctrlSetText _sell_title;
	_sell_frame ctrlSetFont _font_family;
	_sell_frame ctrlCommit 0;
	
	//sell close button
	private["_scx", "_scy", "_scw", "_sch"];
	_scw = 0.14;
	_sch = _shh;
	_scx = _shx + _shw - _scw;
	_scy = _shy + _h - _sch;
	
	_sell_button_cancel ctrlSetText "Cancel";
	_sell_button_cancel ctrlSetPosition [_scx, _scy, _scw, _sch];
	buttonSetAction [(ctrlIDC _sell_button_cancel), "closeDialog 0"];
	_sell_button_cancel ctrlCommit 0;
	
	//sell background
	private["_sbx", "_sby", "_sbw", "_sbh"];
	_sbx = _shx;
	_sby = _shy + _shh + _ysep;
	_sbw = _w;
	_sbh = (_scy ) - (_shy ) - _sch - _ysep - _ysep;
	
	_sell_background ctrlSetPosition [_sbx, _sby, _sbw, _sbh];
	_sell_background ctrlSetBackgroundColor [0,0,0,0.65];
	_sell_background ctrlCommit 0;
	
	//sell button
	private["_stx", "_sty" ,"_stw", "_sth"];
	_stx = _shx;
	_sty = _sby + _sbh + _ysep;
	_stw = _scw * 1.2;
	_sth = _sch;
	
	_sell_button ctrlSetText "Sell";
	_sell_button ctrlSetPosition [_stx, _sty, _stw, _sth];
	_sell_button ctrlCommit 0;
	
	//sell list
	private["_slx", "_sly", "_slw", "_slh"];
	_slx = _sbx + _sep;
	_sly = _sby + _sep;
	_slw = _sbw - _sep * 2;
	_slh = _sbh * 0.55;
	
	_sell_items_list ctrlSetPosition [_slx, _sly, _slw, _slh];
	_sell_items_list ctrlSetFontHeight _button_font_height * 0.9;
	_sell_items_list ctrlCommit 0;
	
	//items to sell label
	private["_silx", "_sily", "_silw", "_silh"];
	_silx = _slx; 
	_sily = _sly + _blh + _sep * 2;
	_silw = _slw / 2  - _sep;
	_silh = 0.04;

	_sell_items_to_sell_label ctrlSetText "Items to sell:";
	_sell_items_to_sell_label ctrlSetPosition [_silx, _sily, _silw, _silh];
	_sell_items_to_sell_label ctrlSetFontHeight _button_font_height - 0.003;
	_sell_items_to_sell_label ctrlCommit 0;
	
	//items to sell field
	private["_sifx", "_sify", "_sifw", "_sifh"];
	_sifx = _silx + _silw + _sep ;
	_sify = _sily;
	_sifw = _silw;
	_sifh = _silh;
	
	_sell_items_to_sell_field ctrlSetFontHeight _button_font_height - 0.003;;
	_sell_items_to_sell_field ctrlSetFont _font_family;
	_sell_items_to_sell_field ctrlSetPosition [_sifx, _sify, _sifw, _sifh];
	_sell_items_to_sell_field ctrlSetBackgroundColor [1,1,1,0.08];
	_sell_items_to_sell_field ctrlCommit 0;
	
	//sell demand label
	private["_sdlx", "_sdly", "_sdlw", "_sdlh"];
	_sdlx = _silx; 
	_sdly = _sily + _bilh + _ysep * 2;
	_sdlw = _silw;
	_sdlh = _silh;

	_sell_demand_label ctrlSetText "Demand:";
	_sell_demand_label ctrlSetPosition [_sdlx, _sdly, _sdlw, _sdlh];
	_sell_demand_label ctrlSetFontHeight _button_font_height - 0.003;
	_sell_demand_label ctrlCommit 0;
	
	//sell demand field
	private["_sdfx", "_sdfy", "_sdfw", "_sdfh"];
	_sdfx = _sdlx + _sdlw + _sep ;
	_sdfy = _sdly;
	_sdfw = _sdlw;
	_sdfh = _sdlh;
	
	_sell_demand_field ctrlSetFontHeight _button_font_height - 0.003;;
	_sell_demand_field ctrlSetFont _font_family;
	_sell_demand_field ctrlSetPosition [_sdfx, _sdfy, _sdfw, _sdfh];
	_sell_demand_field ctrlSetBackgroundColor [1,1,1,0.08];
	_sell_demand_field ctrlCommit 0;
	
	//sell marked adjustment label
	private["_smlx", "_smly", "_smlw", "_smlh"];
	_smlx = _sdlx; 
	_smly = _sdly + _sdlh + _ysep * 2;
	_smlw = _sdlw;
	_smlh = _sdlh;

	_sell_market_adjust_label ctrlSetText "Market adjustment:";
	_sell_market_adjust_label ctrlSetPosition [_smlx, _smly, _smlw, _smlh];
	_sell_market_adjust_label ctrlSetFontHeight _button_font_height - 0.003;
	_sell_market_adjust_label ctrlCommit 0;
	
	//sell market adjustment field
	private["_smfx", "_smfy", "_smfw", "_smfh"];
	_smfx = _smlx + _smlw + _sep ;
	_smfy = _smly;
	_smfw = _sdlw;
	_smfh = _sdlh;
	
	_sell_market_adjust_field ctrlSetFontHeight _button_font_height - 0.003;;
	_sell_market_adjust_field ctrlSetFont _font_family;
	_sell_market_adjust_field ctrlSetPosition [_smfx, _smfy, _smfw, _smfh];
	_sell_market_adjust_field ctrlSetBackgroundColor [1,1,1,0.08];
	_sell_market_adjust_field ctrlCommit 0;
	
	
	
	//sell sales tax label
	private["_stlx", "_stly", "_stlw", "_stlh"];
	_stlx = _smlx; 
	_stly = _smly + _smlh + _ysep * 2;
	_stlw = _smlw;
	_stlh = _smlh;

	_sell_sales_tax_label ctrlSetText "Sales tax:";
	_sell_sales_tax_label ctrlSetPosition [_stlx, _stly, _stlw, _stlh];
	_sell_sales_tax_label ctrlSetFontHeight _button_font_height - 0.003;
	_sell_sales_tax_label ctrlCommit 0;
	
	
	//sell sales tax field
	private["_btfx", "_btfy", "_btfw", "_btfh"];
	_stfx = _stlx + _stlw + _sep ;
	_stfy = _stly;
	_stfw = _smlw;
	_stfh = _smlh;
	
	_sell_sales_tax_field ctrlSetFontHeight _button_font_height - 0.003;;
	_sell_sales_tax_field ctrlSetFont _font_family;
	_sell_sales_tax_field ctrlSetPosition [_stfx, _stfy, _stfw, _stfh];
	_sell_sales_tax_field ctrlSetBackgroundColor [1,1,1,0.08];
	_sell_sales_tax_field ctrlCommit 0;
	
	
	//sell total return label
	private["_srlx", "_srly", "_srlw", "_srlh"];
	_srlx = _stlx; 
	_srly = _stly + _stlh + _ysep * 2;
	_srlw = _stlw;
	_srlh = _stlh;

	_sell_total_return_label ctrlSetText "Total return:";
	_sell_total_return_label ctrlSetPosition [_srlx, _srly, _srlw, _srlh];
	_sell_total_return_label ctrlSetFontHeight _button_font_height - 0.003;
	_sell_total_return_label ctrlCommit 0;
	
	
	//sell total return field
	private["_srfx", "_srfy", "_srfw", "_srfh"];
	_srfx = _srlx + _srlw + _sep ;
	_srfy = _srly;
	_srfw = _stlw;
	_srfh = _stlh;
	
	_sell_total_return_field ctrlSetFontHeight _button_font_height - 0.003;;
	_sell_total_return_field ctrlSetFont _font_family;
	_sell_total_return_field ctrlSetPosition [_srfx, _srfy, _srfw, _srfh];
	_sell_total_return_field ctrlSetBackgroundColor [1,1,1,0.08];
	_sell_total_return_field ctrlCommit 0;
	
	//sell check box
	private["_sxlx", "_sxly", "_sxlw", "_sxlh"];
	_sxlx = _srlx;
	_sxly = _srly + _srlh + _ysep * 2;
	_sxlw = _srlw * 2 + _sep;
	_sxlh = _srlh;
	
	_sell_show_all_items_cbox ctrlSetPosition [_sxlx, _sxly, _sxlw, _sxlh];
	_sell_show_all_items_cbox ctrlSetBackgroundColor [1,0,0,1];
	_sell_show_all_items_cbox ctrlCommit 0;
	
	_sell_show_all_items_label ctrlSetText "[x] - Hide unsellable items";
	_sell_show_all_items_label ctrlSetPosition [_sxlx, _sxly, _sxlw, _sxlh];
	_sell_show_all_items_label ctrlSetFontHeight _button_font_height - 0.003;
	//_sell_show_all_items_label ctrlSetbackgroundColor [1,0,0,1];
	_sell_show_all_items_label ctrlCommit 0;
	
	//error label
	private["_ex", "_ey", "_ew", "_eh"];
	_ex = _btx; 
	_ey = _bty + _bth + _sep * 2;
	_ew = (_shx + _shw) - (_bhx);
	_eh = _bth;
	
	_buy_sell_status_label ctrlSetText "Status field";
	_buy_sell_status_label ctrlSetPosition [_ex, _ey - 0.003, _ew, _eh];
	_buy_sell_status_label ctrlSetFontHeight _button_font_height - 0.003;
	_buy_sell_status_label ctrlSetBackgroundColor [0,0,0,0];
	_buy_sell_status_label ctrlCommit 0;
	
	_buy_sell_status_frame ctrlSetPosition [_ex, _ey, _ew, _eh];
	_buy_sell_status_frame ctrlCommit 0;
	
	_buy_sell_status_background ctrlSetPosition [_ex, _ey, _ew, _eh];
	_buy_sell_status_background ctrlSetBackgroundColor [0,0,0,0.65];
	_buy_sell_status_background ctrlCommit 0;
	
};


shop_open_dialog = {
	
	disableSerialization;
	ARGV(0,_shop_id);
	if (undefined(_shop_id)) exitWith {null};
	if (typeName _shop_id != "SCALAR") exitWith {null};
	
	if (not([_shop_id] call shop_is_open)) exitWith {
		player groupChat format["This shop is not open yet. All shops are now %1%2 open", shop_setup_progress, "%"];
	};
	
	if (not(createDialog "shops_menu")) exitWith {
		player groupChat format["ERROR: Could not create shops menu dialog"];
	};
	
	[_shop_id] call shop_set_current_shop_id;
	[_shop_id] spawn shop_update_buy_list;
	[_shop_id] spawn shop_update_sell_list;
	
	[] call shop_menu_setup;
};






[INV_ItemShops] spawn shop_setup;
shop_functions_defined = true;


shop_menu_functions_defined = true;