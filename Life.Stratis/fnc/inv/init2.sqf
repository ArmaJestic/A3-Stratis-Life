// A_inv_fnc_init2

#include "..\..\includes\macro.h"


["INV_Fabrikowner", []] call A_stats_fnc_init_variable;

carpark1 setTriggerActivation ["VEHICLE", "PRESENT", true];
carpark2 setTriggerActivation ["VEHICLE", "PRESENT", true];
carpark3 setTriggerActivation ["VEHICLE", "PRESENT", true];
carpark4 setTriggerActivation ["VEHICLE", "PRESENT", true];

_i = 0;
while {_i < count(A_inv_var_vendors_array) } do {
	private["_vendor_data", "_vendor"];
	_vendor_data = A_inv_var_vendors_array select _i;		
	_vendor = _vendor_data select A_inv_var_vendor_object;
	A_inv_var_vendors_list set [_i, _vendor];
	_i = _i + 1;
};

if (isServer) then {
	INV_ItemMaxStocks = [];
	private["_i"];
	_i = 0;
	while { _i < (count A_inv_var_itemshops) } do {
		private["_newArray", "_buyList", "_sellList", "_newStock", "_newMax", "_newBuy", "_newSell"];
		
		_newArray = A_inv_var_itemshops select _i;
		_buyList = _newArray select A_inv_var_itemshops_buylist;

		_newMax	= [];

		{
			private["_array", "_class", "_stock", "_max"];
			_array = _x;
			_max = _array select A_inv_var_shop_list_stock_max;
			_newMax set [count _newMax, _max];
		} forEach _buyList;

		INV_ItemMaxStocks set [_i, _newMax];
		_i = _i + 1;
	};
	publicVariable "INV_ItemMaxStocks";
};

if (isServer) then {
	INV_ItemStocks = [];
	private["_i"];
	_i = 0;
	while { _i < (count A_inv_var_itemshops) } do {
		private["_newArray", "_buyList", "_newStock"];
		
		_newArray = A_inv_var_itemshops select _i;
		_buyList = _newArray select A_inv_var_itemshops_buylist;
		_newStock	= [];

		{
			private["_array", "_max"];
			_array = _x;
			_max = _array select A_inv_var_shop_list_stock;
			_newStock set [count _newStock, _max];
		} forEach _buyList;

		INV_ItemStocks set [_i, _newStock];
		_i = _i + 1;
	};
	publicVariable "INV_ItemStocks";
};

private["_i"];
_i = 0;

while { _i < (count A_inv_var_itemshops) } do {
	private["_newArray", "_buyList", "_sellList", "_newBuy", "_newSell"];
	
	_newArray = A_inv_var_itemshops select _i;
	_buyList = _newArray select A_inv_var_itemshops_buylist;
	_sellList = _newArray select A_inv_var_itemshops_selllist;
	
	_newBuy	= [];
	_newSell = [];
	
	{
		private["_array", "_item"];
		_array = _x;
		_item = _array select A_inv_var_shop_list_item;
		_newSell set[count _newSell, _item];
	} forEach _sellList;
	
	{
		private["_array", "_item"];
		_array = _x;
		_item = _array select A_inv_var_shop_list_item;
		_newBuy set[count _newBuy, _item];
	} forEach _buyList;
	
	_newArray set[A_inv_var_itemshops_buylist, _newBuy];
	_newArray set[A_inv_var_itemshops_selllist, _newSell];
	
	A_inv_var_itemshops set[_i, _newArray];
	_i = _i + 1;
};

if (isServer) then {
	{	
		private["_shop", "_object", "_crate"];
		_shop = _x;
		_object = _shop select A_inv_var_itemshops_object;
		_crate = _shop select A_inv_var_itemshops_crate;
		
		if (_object isKindOf "Man") then {
			//shop is an AI
			removeAllWeapons _object;
			_object switchMove "amovpercmstpsnonwnondnon";
			_object playMoveNow "amovpercmstpsnonwnondnon";
			_object disableAI "move"; 
			_object disableAI "anim";
		}else{
			//shop is a box
			clearMagazineCargoGlobal _object; 
			clearWeaponCargoGlobal _object;
			clearItemCargoGlobal _object;
		};
		
		if (_object != _crate) then {
			clearMagazineCargoGlobal _crate; 
			clearWeaponCargoGlobal _crate;
			clearItemCargoGlobal _crate;
		};
	} forEach A_inv_var_itemshops;
};

if (isClient) then {
	waitUntil {!(undefined(INV_ItemStocks))};
	waitUntil {!(undefined(INV_ItemMaxStocks))};
};
