// A_vehicle_fnc_recreate

#include "..\..\includes\macro.h"


//player groupChat format["A_vehicle_fnc_recreate %1", _this];
ARGV(0,_name);
ARGV(1,_class);

if (undefined(_name)) exitWith {null};
if (typeName _name != "STRING") exitWith {null};
if (undefined(_class)) exitWith {null};
if (typeName _class != "STRING") exitWith {null};

private["_vehicle"];
private["_vehicle"];
_vehicle = missionNamespace getVariable _name;
private["_vehicle_exists"];
_vehicle_exists = false;
if (!(undefined(_vehicle))) then {
	if (typeName _vehicle == "OBJECT") then {
		if (!(isNull _vehicle)) then {
			_vehicle_exists = true;
		};
	};
};
if (_vehicle_exists) exitWith {_vehicle};


private["_data"];
//player groupChat format["Recreating _name = %1", _name];
_data = [_name] call A_stats_fnc_load_request_send;
private["_safe_pos"];
_safe_pos = [5086.96,6585.59,0.00146484]; //random on-land position
_vehicle = [_class, _safe_pos, false] call A_vehicle_fnc_create; 
[_vehicle, _name] call A_vehicle_fnc_set_init;	
[_data, _vehicle] call A_stats_fnc_compile_sequential;
[_vehicle, "position_atl", 5] call A_vehicle_fnc_object_wait_stats;	
[_vehicle] call A_vehicle_fnc_init_stats;
private["_item_name"];
_item_name = [_vehicle, "item_name"] call A_vehicle_fnc_get_string;
//[[_vehicle, _item_name, true], "A_vehicle_fnc_modifications_init_handler_persistent", true, true] call BIS_fnc_MP;
[[_vehicle, _item_name, true], "A_vehicle_fnc_modifications_init_handler_persistent", true, true, _vehicle] call A_jip_fnc_register;

(_vehicle)
