#include "macro.h"

if (not(undefined(config_functions_defined))) exitWith {null};

class_item = {
	ARGV(0,_item_id);
	if (undefined(_item_id)) exitWith {false};
	if (typeName _item_id != "STRING") exitWith {false};
	if (_item_id == "") exitWith {false};
	if (not(isClass(configFile >> "CfgWeapons" >> _item_id))) exitWith {false};
	if (not(isClass(configFile >> "CfgWeapons" >> _item_id >> "ItemInfo"))) exitWith {false};
	true
};

class_magazine = {
	ARGV(0,_item_id);
	if (undefined(_item_id)) exitWith {false};
	if (typeName _item_id != "STRING") exitWith {false};
	if (_item_id == "") exitWith {false};
	isClass(configFile >> "CfgMagazines" >> _item_id)
};

class_item_mass = {
	ARGV(0,_item_id);
	if (not([_item_id] call class_item)) exitWith {0};
	
	private["_itemInfo"];
	_itemInfo = (configFile >> "CfgWeapons" >> _item_id >> "ItemInfo");
	
	(getNumber(_itemInfo >> "mass"))
};


class_container = {
	//player groupChat format["class_container %1", _this];
	ARGV(0,_container_id);
	if (undefined(_container_id)) exitWith {false};
	if (typeName _container_id != "STRING") exitWith {false};
	
	private["_parent"];
	_parent = configName(inheritsFrom(configFile >> "CfgVehicles" >> _container_id));
	
	(_parent == toLower("ContainerSupply"))
};

class_container_max_load = {
	//player groupChat format["class_container_max_load %1", _this];
	ARGV(0,_container_id);
	if (not([_container_id] call class_container)) exitWith {0};
	
	
	private["_config"];
	_config = (configFile >> "CfgVehicles" >> _container_id);
	if (not(isNumber(_config >> "maximumload"))) exitWith {0};
	
	(getNumber(_config >> "maximumload"))
};

class_item_max_load = {
	//player groupChat format["class_item_max_load = %1", _this];
	ARGV(0,_item_id);
	if (not([_item_id] call class_item)) exitWith {0};
	
	if (not(isClass(configFile >> "CfgWeapons" >> _item_id))) exitWith {0};
	
	private["_itemInfo"];
	_itemInfo = (configFile >> "CfgWeapons" >> _item_id >> "ItemInfo");
	
	if (not(isText(_itemInfo >> "containerclass"))) exitWith {0};
	
	private["_container_id"];
	_container_id = getText(_itemInfo >> "containerclass");
	

	([_container_id] call class_container_max_load)
};

config_functions_defined = true;