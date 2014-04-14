#include "Awesome\Functions\macro.h"

_art = _this select 0;

if (_art == "use") then {

	_vcl = (nearestobjects [getpos player, ["LandVehicle", "Air", "ship"], 10] select 0);
	
	private["_item", "_data"];
	_item = typeOf(_vcl);
	_data = ITEM_DATA(_item);
	if (count(_data) == 0) exitWith {};
	
	private["_weight"];
	_weight =  ITEM_DATA_WEIGHT(_data);

	if (player != vehicle player) exitWith {player groupChat "You must be outside the vehicle to repair it";};
	if (player != vehicle player) exitWith {player groupChat "You must be outside the vehicle to repair it";};
	if (_weight > 1) exitWith {player groupChat localize "STRS_inv_items_repair_wrongvcl";};
	["use", "kleinesreparaturkit", 1] execVM "largerepair.sqf";

};

