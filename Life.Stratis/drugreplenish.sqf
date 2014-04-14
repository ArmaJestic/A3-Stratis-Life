#include "Awesome\Functions\macro.h"

shop_drug_replenish = {
	private["_shop_id", "_drug", "_amount"];
	_shop_id = _this select 0;
	_drug = _this select 1;
	_amount = _this select 2;
	
	if (undefined(_shop_id)) exitWith {null};
	if (typeName _shop_id != "SCALAR") exitWith {null};
	if (undefined(_drug)) exitWith {null};
	if (typeName _drug != "STRING") exitWith {null};
	if (undefined(_amount)) exitWith {null};
	if (typeName _amount != "SCALAR") exitWith {null};
	
	private["_stock", "_max_stock"];
	_stock = [_drug, _shop_id] call inventory_get_stock;
	_max_stock = [_drug, _shop_id] call inventory_get_max_stock;
	_amount = (_max_stock - _stock) min (_amount);
	format['["%1", %2, %3] call inventory_item_stock_update;', _drug, (_stock + _amount), _shop_id] call broadcast;
};

drug_replenish = {
	{if (true) then {
		private["_gang_area"];
		_gang_area = _x;
		if (not([_gang_area] call gang_area_neutral)) exitWith {null};
		
		private["_shop_id"];
		_shop_id = _gang_area call inventory_get_shop_number;
		
		if(_gang_area == gangarea1) then {
			[_shop_id, "lsd", 1] call shop_drug_replenish;
			sleep 1;
			
			[_shop_id, "cocaine", 2] call shop_drug_replenish;
			sleep 1;

			[_shop_id, "marijuana", 3] call shop_drug_replenish;
			sleep 1;
		};
		if(_gang_area == gangarea2) then {
			[_shop_id, "lsd", 2] call shop_drug_replenish;
			sleep 1;
			
			[_shop_id, "cocaine", 2] call shop_drug_replenish;
			sleep 1;		
		};
		if(_gang_area == gangarea3) then {
			[_shop_id, "heroin", 2] call shop_drug_replenish;
			sleep 1;
			
			[_shop_id, "marijuana", 3] call shop_drug_replenish;
			sleep 1;	
		};
	};} forEach gangareas;
};

drug_replenish_loop = {
	private ["_replenish_loop_i"];
	_replenish_loop_i = 0; 

	while {_replenish_loop_i < 5000} do {
		[] call drug_replenish;
		_replenish_loop_i = _replenish_loop_i + 1;
		sleep drugstockinc;
	};
	[] spawn drug_replenish_loop;
};

[] spawn drug_replenish_loop;

