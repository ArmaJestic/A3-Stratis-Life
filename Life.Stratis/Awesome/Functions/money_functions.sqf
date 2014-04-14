#include "macro.h"
if (not(undefined(money_functions))) exitWith {null};

player_get_factory_money = {
	ARGV(0,_player);
	if (not([_player] call player_human)) exitWith {0};
	
	private["_money"];
	_money = 0;
	{
		_factory_array = _x;
		_factory_name = _factory_array select 7;
		_factory_money = [_player, "money", _factory_name] call inventory_get_storage_amount;
		_money = _money + _factory_money;
	} foreach all_factories;
	
	_money
};

player_get_private_storage_money = {
	ARGV(0,_player);
	if (not([_player] call player_human)) exitWith {0};
	
	([_player, "money", "private_storage"] call inventory_get_storage_amount)
};

player_get_inventory_money = {
	ARGV(0,_player);
	if (not([_player] call player_human)) exitWith {0};
	
	([_player, "money"] call inventory_get_item_amount)
};
	
	
player_get_total_money = {
	ARGV(0,_player);
	if (not([_player] call player_human)) exitWith {0};

	private["_fac_money", "_priv_money", "_bank_money", "_inv_money"];
	_fac_money = [_player] call player_get_factory_money;
	_priv_money = [_player] call player_get_private_storage_money;
	_bank_money = [_player] call bank_get_value;
	
	_inv_money = [_player] call player_get_inventory_money;
	//player groupchat format["FSM: %1, PSM: %2, BM: %3, IM: %4", _fac_money, _priv_money, _bank_money, _inv_money];
	_total_money = _fac_money + _priv_money + _bank_money + _inv_money;
	_total_money
};


player_lose_factory_money = {
	ARGV(0,_player);
	ARGV(1,_amount);
	
	if (not([_player] call player_human)) exitWith {0};
	if (undefined(_amount)) exitWith {0};
	if (typeName _amount != "SCALAR") exitWith {0};
	
	private["_lost_amount"];
	_lost_amount = 0;
	{
		_factory_array = _x;
		_factory_name = _factory_array select 7;
		_factory_money = [_player, "money", _factory_name] call inventory_get_storage_amount;
		
		_lost_amount = (_factory_money) min (_amount);
		[_player, "money", -(_lost_amount), _factory_name] call inventory_storage_add_item;
		_amount = _amount - _lost_amount;

		if (_amount <= 0) exitWith {_amount = 0;};
	} foreach all_factories;
	
	[_player] call factory_save_storage;
	_amount
};

player_lose_private_storage_money =  {
	ARGV(0,_player);
	ARGV(1,_lost_amount);
	if (not([_player] call player_human)) exitWith {null};
	if (undefined(_lost_amount)) exitWith {null};
	if (typeName _lost_amount != "SCALAR") exitWith {null};

	[_player, "money", -(_lost_amount), "private_storage"] call inventory_storage_add_item;
	[_player] call player_save_private_storage;
};

player_lose_inventory_money =  {
	ARGV(0,_player);
	ARGV(1,_lost_amount);
	
	if (not([_player] call player_human)) exitWith {null};
	if (undefined(_lost_amount)) exitWith {null};
	if (typeName _lost_amount != "SCALAR") exitWith {null};

	[_player, 'money', -(_lost_amount)] call inventory_add_item;
};

player_lose_money =  {
	ARGV(0,_player);
	ARGV(1,_amount);
	
	if (not([_player] call player_human)) exitWith {null};
	if (undefined(_amount)) exitWith {null};
	if (typeName _amount != "SCALAR") exitWith {null};

	_fac_money = [_player] call player_get_factory_money;
	_priv_money = [_player] call player_get_private_storage_money;
	_bank_money = [_player] call bank_get_value;
	_inv_money = [_player] call player_get_inventory_money;
	
	private["_lost_amount"];
	
	/////////////////////////////////////////////
	// Raid factories 
	_lost_amount = (_fac_money) min (_amount);
	[_player, _lost_amount] call player_lose_factory_money;
	_amount = _amount - _lost_amount;
	if (_amount <= 0) exitWith {null};
	
	/////////////////////////////////////////////
	// Raid private storage
	_lost_amount = (_priv_money) min (_amount);
	[_player, _lost_amount] call player_lose_private_storage_money;
	_amount = _amount - _lost_amount;
	if (_amount <= 0) exitWith {null};
	
	/////////////////////////////////////////////
	// Raid inventory
	_lost_amount =  (_inv_money) min (_amount);
	[_player, _lost_amount] call player_lose_inventory_money;
	_amount = _amount - _lost_amount;
	if (_amount <= 0) exitWith {null};

	/////////////////////////////////////////////
	// Raid bank (it can go negative, it's on purpose)
	[_player, -(_amount)]  call bank_transaction;
};

money_functions = true;