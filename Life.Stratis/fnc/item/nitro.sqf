// A_item_fnc_nitro

#include "..\..\includes\macro.h"


_art = _this select 0;

if (_art == "use") then {
	_item   = _this select 1;
	_vcl  	= vehicle player;
	_type	= typeof _vcl;

	if(([_vcl, "A_item_fnc_nitro"] call A_object_fnc_getVariable) == 1) exitWith {
		player groupchat "this vehicle already has A_item_fnc_nitro installed"
	};
	if (player == _vcl) exitWith {player groupChat localize "STRS_inv_items_speed_car"};
	if (!(_vcl iskindof "Car")) exitWith {player groupChat localize "STRS_inv_items_speed_no";};

	[player, _item, -1] call A_inventory_fnc_add_item;

	player groupchat "tuning vehicle...";
	_vcl setfuel 0;
	sleep 10;
	_vcl setfuel 1;
	[_vcl, "A_item_fnc_nitro", 1, true] call A_object_fnc_setVariable;
	player groupchat "vehicle tuned!";
	sleep 2;
	player groupchat "press and hold shift to activate A_item_fnc_nitro";
};
