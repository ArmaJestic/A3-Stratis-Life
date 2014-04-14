#include "constants.h"
#include "macro.h"

if (not(undefined(inventory_functions_defined))) exitWith {};

INV_CarryingCapacity = 60;
INV_TaxesPaid = 0;

inventory_heal = {
	private["_player"];
	_player = _this;
	if(not([_player] call player_exists)) exitWith {false};
	
	private["_sleep"];
	_sleep = 5;
	
	if(_player == player) exitWith {
		//self healing
		format ["%1 switchmove ""AinvPknlMstpSlayWrflDnon_medic"";", player] call broadcast;
		player groupChat format["%1-%2, wait %3 seconds until you are healed", _player, (name _player), _sleep];
		sleep _sleep;
		player setdamage 0;
		player groupChat format format["%1-%2, you are healed again", _player, (name _player)];
		true
	};
	
	format ["%1 switchmove ""AinvPknlMstpSlayWrflDnon_medic"";", _this] call broadcast;
	player groupChat "Healing civ...";
	sleep _sleep;
	_player setdamage 0;

	true
};


inventory_add_item = {
	//player groupChat format["inventory_add_item %1", _this];
	ARGV(0,_object);
	ARGV(1,_item);
	ARGV(2,_amount);
	
	private["_info"];
	_info = _item call inventory_get_item_array;
	
	if (count(_info) == 0) exitWith {};
	
	private["_total_weight", "_own_weight", "_item_weight"];
	_own_weight = (call inventory_get_own_weight);
	_item_weight = ITEM_DATA_WEIGHT(_info);
	_total_weight = (_own_weight + (_amount * _item_weight));
	
	if (_amount == 0) exitWith {false};
	if (_total_weight > INV_CarryingCapacity && _amount > 0) exitWith {false};
	
	([_object, _item, _amount, ([_object] call object_storage_name)] call inventory_storage_add_item)
};




inventory_check_array = {
	ARGV(0,_object);
	ARGV(1,_array_name);
	
	if (undefined(_object)) exitWith {null};
	if (typeName _object != "OBJECT") exitWith {null};
	if (undefined(_array_name)) exitWith {null};
	if (typeName _array_name != "STRING") exitWith {null};

	
	private["_array_variable"];
	_array_variable = [_object, _array_name] call object_getVariable;
	if (undefined(_array_variable)) exitWith {
		[_object, _array_name, [], true] call object_setVariable;
	};
	
	if (typeName _array_variable != "ARRAY") exitWith {
		[_object, _array_name, [], true] call object_setVariable;
	};
};



// Add Items to Storage
inventory_storage_add_item = {
	ARGV(0,_object);
	ARGV(1,_item);
	ARGV(2,_quantity);
	ARGV(3,_arrname);
	
	[_object, _arrname] call inventory_check_array;
	
	private["_arr", "_arraynum", "_number"];
	_arr = [_object, _arrname] call object_getVariable;
	
	_arraynum  = -1;
	_number = 0;

	//find the array that contains this item, and cleanup empty ones
	private["_i"];
	_i = 0;
	while { _i < (count _arr) } do {
		private["_info", "_citem", "_count"];
		_info = _arr select _i;
		_citem = _info select 0;
		_count = [(_info select 1)] call decode_number;
		if ( _citem == _item) then {
			_arraynum = _i;
			_number = _count;
		};
		_i = _i + 1;
	};
	
	_quantity = _quantity + _number;
	if (_quantity < 0) exitWith {false};
	
	_arraynum = if (_arraynum < 0) then { count _arr} else { _arraynum };
	_arr set [_arraynum, [_item, ([_quantity] call encode_number)]];
	[_object, _arrname, _arr, true] call object_setVariable;
	true
};




// Calculate How Many Items are Stored.

inventory_get_storage_amount = {
	ARGV(0,_object);
	ARGV(1,_Itemname);
	ARGV(2,_arrname);
	
	[_object, _arrname] call inventory_check_array;
	private["_Array"];
	_Array = [_object, _arrname, null] call object_getVariable;
	
	if (undefined(_Array)) exitWith {0};

	private["_Result", "_i"];
	_Result = 0;
	_i = 0;
	while { _i <  (count _Array) } do {
		private["_citem"];
		_citem = ((_Array select _i) select 0);
		if ( _citem == _Itemname) exitWith {
			_Result = ((_Array select _i) select 1);
			_Result = [_Result] call decode_number;
		};
		_i = _i + 1;
	};
	
	_Result
};


// Find Quantity of Items
inventory_get_item_amount = {
	ARGV(0,_object);
	ARGV(1,_item);
	
	([_object, _item, ([_object] call object_storage_name)] call inventory_get_storage_amount)	
};


// Change Amount of Items
inventory_set_storage_amount = {
	//player groupChat format["inventory_set_storage_amount %1", _this];
	ARGV(0,_object);
	ARGV(1,_item_name);
	ARGV(2,_amount);
	ARGV(3,_array_name);
	
	[_object, _array_name] call inventory_check_array;
	
	private["_found", "_array", "_i"];
	_found = false;
	_array = [_object, _array_name] call object_getVariable;
	
	_i = 0;
	while { _i < (count _array) } do {
		private["_citem"];
		_citem = ((_array select _i) select 0);
		if (_citem == _item_name) exitWith {
			(_array select _i) set [1, ([_amount] call encode_number)];
			_found = true;
		};
		_i = _i + 1;
	};
	
	[_object, _array_name, _array, true] call object_setVariable;
	
	if (_found || {_amount == 0}) exitWith {_found};
	
	_found = [_object, _item_name, _amount, _array_name] call inventory_storage_add_item;
	_found
};


// Change Amount of Items
inventory_set_item_amount = {
	//player groupChat format["inventory_set_item_amount %1", _this];
	ARGV(0,_object);
	ARGV(1,_item);
	ARGV(2,_number);
	
	private["_array_name"];
	_array_name = ([_object] call object_storage_name);
	
	([_object, _item, _number, _array_name] call inventory_set_storage_amount)
};


// Check for a Type of Item in Storage
inventory_storage_has_kind = {
	ARGV(0,_object);
	ARGV(1,_Arrayname);
	ARGV(2,_Itemart);
	
	[_object, _Arrayname] call inventory_check_array;
	private["_Array", "_i", "_re"];
	_re = false;
	_Array = [_object, _Arrayname] call object_getVariable;
	_i = 0;
	while { _i < (count _Array) } do {
		private["_citem", "_count"];
		_citem = ((_Array select _i) select 0);
		_count = ([((_Array select _i) select 1)] call decode_number);
		if (((_citem call inventory_get_item_kind) == _Itemart) and (_count > 0)) exitWith {
			_re = true;
		};
		_i = _i + 1;
	};
	_re
};


// Remove One Type of Item From Storage
inventory_storage_remove_kind = {
	ARGV(0,_object);
	ARGV(1,_Arrayname);
	ARGV(2,_Itemart);
	
	[_object, _Arrayname] call inventory_check_array;
	
	private["_Array", "_i"];
	_Array = [_object, _Arrayname] call object_getVariable;
	
	_i = 0;
	while { _i < (count _Array) } do {
		private["_citem"];
		_citem = ((_Array select _i) select 0);
		if ( (_citem call inventory_get_item_kind)  == _Itemart) then {
			(_Array select _i) set [1, 0];
		};
		_i = _i + 1;
	};
	
	[_object, _Arrayname, _Array, true] call object_setVariable;
	true
};


// Check Stored Item Weight
inventory_get_storage_weight = {
	//player groupChat format["inventory_get_storage_weight %1", _this];
	ARGV(0,_object);
	ARGV(1,_Arrayname);
	
	[_object, _Arrayname] call inventory_check_array;
	
	private["_weight"];
	_weight = 0;

	{if (true) then {
		private["_entry", "_item", "_count", "_infos", "_item_weight"];
		_entry = _x;
		_item = _entry select 0;
		_count = [(_entry select 1)] call decode_number;
		_infos  = _item call inventory_get_item_array;
		
		if (undefined(_infos) || {typeName _infos != "ARRAY" || {count(_infos) == 0}}) exitWith {};
		
		_item_weight = ITEM_DATA_WEIGHT(_infos);
		_weight = _weight + (_count) * (_item_weight);
	}} forEach ([_object, _Arrayname] call object_getVariable);
	
	_weight
};


// Get Current Weight
inventory_get_own_weight = {
	([player] call inventory_get_player_weight)	
};

inventory_get_player_weight = {
	ARGV(0,_player);
	
	private["_inventory_name"];
	_inventory_name = [_player] call object_storage_name;
	([_player, _inventory_name] call inventory_get_storage_weight)	
};


// Remove Items that Cannot Exist
inventory_storage_remove_illegal = {
	ARGV(0,_object);
	ARGV(1,_Arrayname);
	
	if (not([_object, _arrayname, "drug"] call inventory_storage_has_kind)) exitWith {
		player groupchat "No illegal things found.";
		false
	};
	
	private["_drugs_value", "_Array", "_i"];
	_drugs_value = 0;
	_Array = [_object, (format["%1", _arrayname])] call object_getVariable;
	_i = 0;
	while { _i < (count _Array) } do {
		private["_item", "_infos"];
		_item  = ((_Array select _i) select 0);
		_infos = _item call inventory_get_item_array;

		if(_item call inventory_get_item_kind == "drug") then {
			private["_price", "_amount"];
			_amount = ([_object, _item, _arrayname] call inventory_get_storage_amount);
			_price  = (_infos call inventory_get_item_buy_cost);
			_drugs_value = _drugs_value + (_price * _amount);
		};
		_i = _i + 1;
	};

	[_object, _arrayname, "drug"] call inventory_storage_remove_kind;
	(format ["if (player == %2) then {player groupChat ""%1 had drugs in its trunk, you removed them. You should jail the owner of %1 for %4 minutes or give him a ticket of $%5.""}; titletext [format[localize ""STRS_civmenucheck_haddrugs"", %1, %3], ""plain""];", _vcl, player, _drugs_value, ceil(_drugs_value/20000), ceil(_drugs_value/2)]) call broadcast;
	true
};

// Remove Illegal Items
inventory_remove_illegal = {
	ARGV(0,_object);
	
	private["_inv"];
	_inv = [_object] call player_get_inventory;

	{
		private["_item_entry", "_item", "_infos", "_isItem"];
		_item_entry = _x;
		_item = _item_entry select 0;
		_infos = _item call inventory_get_item_array;
		_isItem = ((_infos call inventory_get_item_type) == "Item");
		if (_isItem) then { if (_item call inventory_get_item_illegal) then {
			[_object, _item, 0] call inventory_set_item_amount;
		};};
	} foreach _inv;	 
	
	{
		if (!(_x == "Laserdesignator" || _x =="Binocular_Vector" || _x =="NVGoggles"  || _x =="Binocular" || _x =="itemmap" || _x =="itemgps" ||
			_x =="itemradio" || _x =="ItemCompass" || _x =="ItemWatch") ) then {
			_object removeweapon _x;
		};
	} foreach weapons _object;
	
	{ _object removemagazines _x;} foreach magazines _object;	
};



// Check if Player Can Carry More
inventory_can_carry_items = {
	ARGV(0,_item);
	ARGV(1,_count);
	
	private["_data"];
	_data = ITEM_DATA(_item);
	if (count(_data) == 0) exitWith {true};
	
	
	private["_items_weight", "_own_weight", "_remain_weight"];
	
	_items_weight = (ITEM_DATA_WEIGHT(_data)*_count);
	_own_weight = (call inventory_get_own_weight);
	_remain_weight = (INV_CarryingCapacity - _own_weight);
	
	(_remain_weight <  _items_weight)
};



// Fuction Add Percent (Taxes)
inventory_add_percent = {
	ARGV(0,_worth);
	ARGV(1,_percent);
	
	private["_round"];
	_round  = true;
	if (count _this > 2) then {
		_round = _this select 2
	};
	
	private["_result"];
	if (_round) then {
		_result  = round (  _worth + ((_worth / 100) * _percent) );
	} 
	else {
		_result  = (  _worth + ((_worth / 100) * _percent)  );
	};
	_result
};



// Find Player Weapon Type, is either 1,2 or 3. See in INV_AllWeaponObjects, select 4 then select 0. Handgun is "1", rifle "2", explosives "3".
INV_Handgun_type = 1;
INV_Rifle_type = 2;
INV_Explosive_type = 3;

inventory_get_weapon_type = {
	private ["_Fresult"];
	_Fresult = -1;
	{
		if (((_x select 2) select 0) == _this) then {
			_Fresult = ((_x select 4) select 0);
		};
	}
	forEach AllLifeMissionObjects;
	_Fresult
};


// Get Kind of Vehicle
inventory_get_vehicle_type = {
	private ["_Fresult"];
	_Fresult = -1;
	{
		if (((_x select 2) select 0) == _this) then {
			_Fresult = ((_x select 4) select 0);
		};
	}
	forEach AllLifeMissionObjects;
	_Fresult
};

// Check if Player is Armed
iventory_is_armed = {if (count (weapons player - nonlethalweapons) > 0) then {true}else{false}};

// Check if unit is Armed
inventory_unit_armed = {if (count (weapons _this - nonlethalweapons) > 0) then {true}else{false}};

//Function Item Taxes
inventory_get_item_tax = {
	private ["_type", "_item", "_result"];
	_type = _this call inventory_get_item_type;
	_cost = _this call inventory_get_item_buy_cost;
	[_cost, ([_type] call economy_lookup_tax_value_type)] call inventory_add_percent;
};


//Function Price Taxes
inventory_get_item_tax_price= {
	private ["_type", "_preis", "_result"];
	_type  = (_this select 0) call inventory_get_item_type;
	_preis = (_this select 1);
	[_preis, ([_type] call economy_lookup_tax_value_type)] call inventory_add_percent;
};


// Check if Player Owns Licence
inventory_has_license = {
	([player, _this] call player_has_license)
};


// Get Name of Licence
inventory_get_license_name = {
	private ["_c"];
	for "_c" from 0 to (count INV_Licenses - 1) do {
		if (((INV_Licenses select _c) select 0) == _this) exitWith {
			((INV_Licenses select _c) select 2)
		};
	};
};


// Unknown
inventory_get_script_from_class_mag = {
	private ["_c", "_result"];
	_result = "";
	for "_c" from 0 to (count AllLifeMissionObjects - 1) do {
		if ((((INV_AllMagazineObjects select _c) select 2) select 0) == _this) exitWith {
			_result = ((INV_AllMagazineObjects select _c) select 0);
		};
	};
	_result
};


// Unknown
inventory_get_script_from_class_weap = {
	private ["_c", "_result"];
	_result = "";
	for "_c" from 0 to (count AllLifeMissionObjects - 1) do {
		if ((((INV_AllWeaponObjects select _c) select 2) select 0) == _this) exitWith {
			_result = ((INV_AllWeaponObjects select _c) select 0);
		};
	};
	_result
};


// Get item Array
inventory_get_item_array = {
	private ["_c", "_Fobjarray"];
	_Fobjarray = [];
	if ((typeName _this) == "STRING") then {
		_Nname = format["A_MS_%1", _this];
		_Fobjarray = missionNamespace getVariable [_Nname,[]];
	};
	
	if ((typeName _this) == "ARRAY") then {
		_Fobjarray = _this;
	};
	
	if (count(_Fobjarray) == 0) then {
		diag_log format["WARNING: could not find '%1' in master array", _this];
	};

	_Fobjarray
};

// Get shop array
inventory_get_shop_array = {
	private ["_c", "_Fshoparray"];
	_Fshoparray = [];
	if ((typeName _this) == "OBJECT") then {
		for "_c" from 0 to (count INV_ItemShops - 1) do {
			if (((INV_ItemShops select _c) select 0) == _this) then {
				_Fshoparray = INV_ItemShops select _c;
			};
		};
	};
	if ((typeName _this) == "ARRAY") then {
		_Fshoparray = _this;
	};
	_Fshoparray
};

// Get shop number
inventory_get_shop_number = {
	private ["_object"];
	_object = _this;
	
	if ((typeName _object) != "OBJECT") exitWith {null};
	
	private["_shop_id", "_i"];
	_shop_id = null;
	_i = 0;
	while { _i < (count INV_ItemShops) } do {
		private["_cobject"];
		_cobject = ((INV_ItemShops select _i) select 0);
		if (_cobject == _object) exitWith {
			_shop_id = _i;
		};
		_i = _i + 1;
	};
	_shop_id
};

// Get shopitem number

inventory_get_shop_item_number = {
	ARGV(0,_item);
	ARGV(1,_shopinv);
	
	if (undefined(_item)) exitWith {null};
	if (undefined(_shopinv)) exitWith {null};
	
	private ["_shopitemnum"];
	_shopitemnum = [];
	if ((typeName _item) == "STRING") then {
		private["_i"];
		_i = 0;
		while { _i < (count _shopinv) } do {
			if ((_shopinv select _i) == _item) then {
				_shopitemnum = _i;
			};
			_i = _i + 1;
		};
	};
	_shopitemnum
};



inventory_get_stock = {
	ARGV(0,_item);
	
	private["_shopnum"];
	_shopnum = (_this select 1);
	
	private["_shoparr", "_shopinv", "_itemnum"];
	_shoparr = INV_ItemShops select _shopnum;
	_shopinv = _shoparr select 4;
	_itemnum = [_item, _shopinv] call inventory_get_shop_item_number;

	if (not( typeName _shopnum == "SCALAR" && typeName _itemnum == "SCALAR")) exitWith {-1};
	if(typeName (INV_ItemMaxStocks select _shopnum) != "ARRAY")exitwith{-1};

	(INV_ItemStocks select _shopnum) select _itemnum

};

inventory_get_max_stock = {
	ARGV(0,_item);
	
	private["_shopnum"];
	_shopnum = (_this select 1);
	
	private["_shoparr", "_shopinv", "_itemnum"];
	_shoparr = INV_ItemShops select _shopnum;
	_shopinv = _shoparr select 4;
	_itemnum = [_item, _shopinv] call inventory_get_shop_item_number;

	if (not(typeName _shopnum == "SCALAR" && typename _itemnum == "SCALAR")) exitWith {-1};
	if(typename (INV_ItemMaxStocks select _shopnum) != "ARRAY") exitWith {-1};

	((INV_ItemMaxStocks select _shopnum) select _itemnum)

};

inventory_item_stock_update = {
	ARGV(0,_item);
	ARGV(1,_stock);
	ARGV(2,_shopnum);
	
	private["_shoparr", "_shopinv", "_itemnum"];
	_shoparr  = INV_ItemShops select _shopnum;
	_shopinv  = (_shoparr select 4);
	_itemnum  = [_item, _shopinv] call inventory_get_shop_item_number;

	if (undefined(_shopnum)) exitWith {null};
	if (typeName _shopnum != "SCALAR") exitWith {null};
	if (undefined(_itemnum)) exitWith {null};
	if (typeName _itemnum != "SCALAR") exitWith {null};

	(INV_ItemStocks select _shopnum) SET [_itemnum, _stock];
};

inventory_has_item = {
	ARGV(0,_object);
	ARGV(1,_item);
	
	private["_return"];
	_return = false;
	
	//Object item
	if ((typeName _item) == "STRING") then {
		if(([_object, _item] call inventory_get_item_amount) > 0) exitWith{_return = true;};
	};
	if ((typeName _item) == "ARRAY") then {
		{
			if(([_object, _x] call inventory_get_item_amount) > 0) exitWith{_return = true;};
		} foreach _item;
	};
	_return
};

item2class = {
	private["_item", "_class"];
	_item = _this select 0;
	_class = "Land_CanisterPlastic_F";
	
	//player groupChat format["item to class %1", _item];
	if (undefined(_item)) exitWith {_class};
	if (typeName _item != "STRING") exitWith {_class};
	
	private["_info"];
	_info = _item call inventory_get_item_array;
	if (undefined(_info)) exitWith {_class};
	
	private["_cclass"];
	
	(_info call inventory_get_item_class)
};


// Get Object Details
inventory_get_item_script_name = { ((_this call inventory_get_item_array) select 0)};
inventory_get_item_type = {((_this call inventory_get_item_array) select 1) select 0};
inventory_get_item_kind = { ((_this call inventory_get_item_array) select 1) select 1	 };
inventory_get_item_class = { ((_this call inventory_get_item_array) select 2) select 0 };



inventory_get_item_buy_cost = {((_this call inventory_get_item_array) select 3) select 0 };
inventory_get_item_sell_cost = { ((_this call inventory_get_item_array) select 3) select 1 };
inventory_get_item_type_kg = { ((_this call inventory_get_item_array) select 4) select 0 };
inventory_get_license_1 = { private["_license_1"]; _license_1 = (((_this call inventory_get_item_array) select 4) select 1); if (undefined(_license_1)) exitWith {""}; _license_1};
inventory_get_license_2 = { private["_license_2"]; _license_2 = (((_this call inventory_get_item_array) select 4) select 2); if (undefined(_license_2)) exitWith {""}; _license_2};
inventory_get_item_other = { ((_this call inventory_get_item_array) select 5) };
inventory_get_item_description_1 = { ((_this call inventory_get_item_array) select 6) };
inventory_get_item_description_2 = { ((_this call inventory_get_item_array) select 7) };
inventory_get_item_materials = { ((_this call inventory_get_item_array) select 8) };
iventory_get_item_giveable = { ((_this call inventory_get_item_array) select 5) select 0 };
inventory_get_item_droppable = { ((_this call inventory_get_item_array) select 5) select 1 };
inventory_get_item_loseable = { ((_this call inventory_get_item_array) select 5) select 2 };
inventory_get_item_illegal = { ((_this call inventory_get_item_array) select 5) select 3 };
inventory_get_item_animal = { ((_this call inventory_get_item_array) select 5) select 4 };
inventory_get_item_file = { ((_this call inventory_get_item_array) select 5) select 5 };




inventory_get_vehicle_max_kg = { 
	private["_item_array"];
	_item_array = (_this call inventory_get_item_array);
	if (undefined(_item_array) || {count(_item_array) == 0}) exitWith {
		server globalChat format["WARNING: inventory_get_vehicle_max_kg: could not find item %1", _this];
		0
	};
	((_item_array select 4) select 3)
};


inventory_functions_defined = true;
