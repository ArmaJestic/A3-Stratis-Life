// A_factory_fnc_item_create

#include "header.h"

 
//player groupChat format["A_factory_fnc_item_create %1", _this];
ARGV(0,_player);
ARGV(1,_factory_id);
ARGV(2,_item);
ARGV(3,_amount);

if (!([_player] call A_player_fnc_human)) exitWith {null};
if(UNDEFINED(_factory_id)) exitWith {null};
if (typeName _factory_id != "STRING") exitWith {null};
if (UNDEFINED(_item)) exitWith {null};
if (typeName _item != "STRING") exitWith {null};
if (UNDEFINED(_amount)) exitWith {null};
if (typeName _amount != "SCAlAR") exitWith {null};

if (_amount <= 0) exitWith {null};

private["_factory", "_factory_storage", "_factory_spawn", "_factory_crate"];
_factory = [_factory_id] call A_factory_fnc_lookup_id;
if (UNDEFINED(_factory)) exitWith {null};

_factory_storage = _factory select INDEX_STORAGE;
_factory_spawn = _factory select INDEX_SPAWN;
_factory_crate = _factory select INDEX_CRATE;

private["_info", "_item_type", "_item_name"];
_info = (_item call A_inventory_fnc_get_item_array);
_item_type = _item call A_inventory_fnc_get_item_type;
_item_name = (MASTER_ARRAY_ITEM_NAME(_item));

if (!(_item_type in ["Item", "Weapon", "Magazine", "Vehicle"])) exitWith {null};

if (_item_type == "Vehicle" && _amount > 1) exitWith {
	player groupChat format["%1-%2, you can only create one %3 at a time", _player, (name _player), _item_name];
};

private["_avail_name", "_avail"];
_avail_name = format["%1avail", _item];
_avail = missionNamespace getVariable _avail_name;

if (_avail  < _amount) exitWith {
	player groupChat format["%1-%2, you have not produced enough %3 to create", _player, (name _player), _item_name];
};
	
player groupChat format["%1-%2, you have created %3 %4", _player, (name _player), _amount, _item_name];

_avail = missionNamespace getVariable _avail_name;
while { _amount > 0 && _avail > 0} do {
	_avail = _avail - 1;
	missionNamespace setVariable[_avail_name, _avail];
	[_avail_name, _avail] spawn A_stats_fnc_client_save;
	
	switch _item_type do {
		case "Item": {
			[_player, _item, 1, _factory_storage] spawn A_inv_fnc_createitem;
		};
		case "Weapon": {
			[(_info call A_inventory_fnc_get_item_class), 1, _factory_crate] spawn A_inv_fnc_createweapon;
		};
		case "Magazine": {
			[(_info call A_inventory_fnc_get_item_class), 1, _factory_crate] spawn A_inv_fnc_createmag;
		};
		case "Vehicle": {
			private["_vehicle_class"];
			_vehicle_class = (_info call A_inventory_fnc_get_item_class);
			_vehicle_script_name = (_info call A_inventory_fnc_get_item_script_name);
			[_factory_spawn, _vehicle_class, _vehicle_script_name, false] spawn A_vehicle_fnc_create_shop_extended;
		};
	};
	
	_avail = missionNamespace getVariable _avail_name;
	_amount = _amount - 1;
};

call A_factory_fnc_update_enqueue_item;
