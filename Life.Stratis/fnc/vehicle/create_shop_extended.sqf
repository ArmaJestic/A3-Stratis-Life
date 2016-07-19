// A_vehicle_fnc_create_shop_extended

#include "..\..\includes\macro.h"


//player groupChat format["A_vehicle_fnc_create_shop_extended %1", _this];
ARGV(0,_logic);
ARGV(1,_class);
ARGV(2,_item);
ARGV(3,_exact);

private["_vehicle_name", "_position"];
_vehicle_name = call A_vehicle_fnc_generate_name;
_position = getPosATL _logic;

private["_vehicle"];
_vehicle = [_class, _position, _exact] call A_vehicle_fnc_create;

if (not(undefined(_vehicle))) then {
	_vehicle setDir (getDir _logic);
};

//player groupChat format["_vehicle_name = %1,  _vehicle = %2", _vehicle_name, _vehicle];
[_vehicle, _vehicle_name] call A_vehicle_fnc_set_init;
//[[_vehicle, _item, false], "A_vehicle_fnc_modifications_init_handler_persistent", true, true] call BIS_fnc_MP;
[[_vehicle, _item, false], "A_vehicle_fnc_modifications_init_handler_persistent", true, _vehicle] call A_jip_fnc_register;

(_vehicle)
