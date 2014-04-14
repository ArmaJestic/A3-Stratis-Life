#include "Awesome\Functions\macro.h"

_art = _this select 0;

if (_art == "use") then {
	_item   = _this select 1;
	_vcl  	= vehicle player;
	_type	= typeof _vcl;

	if(([_vcl, "nitro"] call object_getVariable) == 1) exitWith {
		player groupchat "this vehicle already has nitro installed"
	};
	if (player == _vcl) exitWith {player groupChat localize "STRS_inv_items_speed_car"};
	if (!(_vcl iskindof "Car")) exitWith {player groupChat localize "STRS_inv_items_speed_no";};

	[player, _item, -1] call inventory_add_item;

	player groupchat "tuning vehicle...";
	_vcl setfuel 0;
	sleep 10;
	_vcl setfuel 1;
	[_vcl, "nitro", 1, true] call object_setVariable;
	player groupchat "vehicle tuned!";
	sleep 2;
	player groupchat "press and hold shift to activate nitro";
};



