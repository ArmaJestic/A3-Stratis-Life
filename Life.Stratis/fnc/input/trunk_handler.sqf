// A_input_fnc_trunk_handler

#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


if(!INV_shortcuts) exitWith { false };
if(dialog) exitWith {closeDialog 0; false };

private["_vcls", "_vcl"];
_vcls = nearestobjects [getpos player, ["LandVehicle", "Air", "ship", "TKOrdnanceBox_EP1"], 25];
_vcl = _vcls select 0;


private["_inside_vehicle"];
_inside_vehicle = !((vehicle player) == player);
if (_inside_vehicle) exitWith {
	player groupChat format["You must be outside the vehicle to use the trunk"];
};

private["_vehicle"];
_vehicle = cursorTarget;
if (undefined(_vehicle)) exitWith {false};
if (typeName _vehicle != "OBJECT") exitWith {false};
if (!(_vehicle isKindOf "LandVehicle" || _vehicle isKindOf "Air" || _vehicle iskindOf "Ship" || _vehicle isKindOf "TKOrdnanceBox_EP1")) exitWith {false};

private["_distance"];
_distance = _vehicle distance player;;
if (_distance > 10 ) exitWith {false};
if (_distance > 5 ) exitWith {
	player groupChat format["You need to be closer to the vehicle to use the trunk"];
};


if(!([player, _vehicle] call A_vehicle_fnc_owner)) exitWith {
	player groupchat "You do not have the keys to this vehicle.";
	false
};

if (([_vehicle] call A_trunk_fnc_in_use)) exitWith { 
	player groupChat format["This vehicle's trunk is being used by %1", ([_vehicle] call A_trunk_fnc_user)];
	false
};

[_vehicle] call A_trunk_fnc_open;
[player, _vehicle] call A_storage_menu_fnc_menu_vehicle_storage;
true
