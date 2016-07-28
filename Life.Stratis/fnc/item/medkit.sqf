// A_item_fnc_medkit

#include "..\..\includes\macro.h"


_art = _this select 0;

if (_art == "use") then {

	_item   = _this select 1;
	_anzahl = _this select 2;

	if(vehicle player != player)exitwith{player groupchat "you cannot use this in a vehicle"};
	if(!(player call A_inventory_fnc_heal))exitWith {null};
	[player, _item, -1] call A_inventory_fnc_add_item;
};
