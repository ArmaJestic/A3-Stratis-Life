#include "Awesome\Functions\macro.h"

_art = _this select 0;

if (_art == "use") then {
	liafu = true;

	_item = _this select 1;
	_vcl = (nearestobjects [getpos player, ["LandVehicle", "Air"], 15] select 0);

	if (player != vehicle player) exitWith {player groupChat "You must be outside the vehicle to repair it";};
	if (player distance _vcl > 10) exitWith {player groupChat "You are too far away to repair the vehicle";};
	if ((damage _vcl) == 0) exitWith {player groupChat localize "STRS_inv_items_repair_notneeded";};

	player groupchat "Repairing! Stay close outside of vehicle";
	[player, _item, -1] call inventory_add_item;
	format ["%1 switchmove ""InBaseMoves_repairVehicleKnl"";", player] call broadcast;
	sleep 10;
	if ((player distance _vcl < 10) and (!isPlayer _vcl) and (speed _vcl < 1)) then {
		_vcl setDamage 0;
		player groupChat localize "STRS_inv_items_repair_repaired";
	}
	else {
		[player, _item, 1] call inventory_add_item;
		player groupChat "Repairs canceled by moving or having someone inside vehicle";
	};
};

