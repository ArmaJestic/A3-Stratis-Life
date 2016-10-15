// A_vehicle_fnc_create_shop_extended

#include "header.h"


params["_logic","_class","_item","_exact"];
private _vehicle_name = call A_vehicle_fnc_generate_name;
private _position = getPosATL _logic;
private _vehicle = [_class, _position, _exact] call A_vehicle_fnc_create;

if DEFINED(_vehicle) then {
	_vehicle setDir (getDir _logic);
};

[_vehicle, _vehicle_name] call A_vehicle_fnc_set_init;
[[_vehicle, _item, false], "A_vehicle_fnc_modifications_init_handler_persistent", _vehicle] call A_jip_fnc_register;

(_vehicle)