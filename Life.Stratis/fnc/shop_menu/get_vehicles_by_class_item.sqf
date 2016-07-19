// A_shop_menu_fnc_get_vehicles_by_class_item

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


//player groupChat format["A_shop_menu_fnc_get_vehicles_by_class_item %1", _this];

ARGV(0,_player);
ARGV(1,_class);
ARGV(2,_item);
ARGV(3,_distance);

if (not([_player] call A_player_fnc_exists)) exitWith {[]};
if (undefined(_class)) exitWith { [] };
if (typeName _class != "STRING") exitWith { [] };
if (undefined(_item)) exitWith {[]};
if (typeName _item != "STRING") exitWith {[]};
if (undefined(_distance)) exitWith { [] };
if (typeName _distance != "SCALAR") exitWith { [] };

private["_vehicles"];
_vehicles = [];

_vehicles_name_list = [_player] call A_vehicle_fnc_list;


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
		_citem = [_vehicle, "item_name"] call A_vehicle_fnc_get_string;
		//player groupChat format["_citem = %1", _citem];
		if (_citem != _item) exitWith {null};
		
		_vehicles = _vehicles + [_vehicle];
	};
} foreach _vehicles_name_list;

_vehicles

