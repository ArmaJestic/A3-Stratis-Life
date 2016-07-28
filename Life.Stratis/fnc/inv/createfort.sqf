// A_inv_fnc_createfort

#include "..\..\includes\macro.h"


_this spawn {
	private ["_class", "_kind", "_logic", "_vehicle", "_vehicle_name"];
	_logic = _this select 0;
	_class = _this select 1;
	_kind = _this select 2;	
	if (not(alive player)) exitWith {null};
	liafu = true;
	_vehicle = createVehicle [_class, (getPosATL _logic), [], 0, "NONE"];
	
	switch _kind do {
		case "Static" do {
			_vehicle_name = format["%1_%2_%3", _kind, player, round(time)];
			//[[_vehicle, _vehicle_name], "A_inv_fnc_createfort_init_handler_persistent", true, true] spawn BIS_fnc_MP;
			[[_vehicle, _vehicle_name], "A_inv_fnc_createfort_init_handler_persistent", true, true, _vehicle] spawn A_jip_fnc_register;
			waitUntil {not(isNil _vehicle_name)};
			[[_vehicle], "A_inv_fnc_createfort_init_handler", true, false] spawn BIS_fnc_MP;
		};
		case "Fort" do {};
		case "Box" do {
			clearBackpackCargoGlobal _vehicle;
			clearMagazineCargoGlobal _vehicle;
			clearWeaponCargoGlobal _vehicle;
		};
	};
};
