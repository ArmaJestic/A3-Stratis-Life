// A_item_fnc_suicide_bomb

#include "..\..\includes\macro.h"


_art = _this select 0;

if (_art == "use") then {
	private["_position", "_max_height", "_inVehicle"];
	_max_height = 5;
	_position = getPosATL player;
	_inVehicle = ((vehicle player) != player);

	if ((_position select 2) > _max_height && _inVehicle) exitWith {
		player groupChat format["Suicide A_bombs_fnc_bombs can only be used at ground level"];
	};

	if ((player distance (getmarkerpos "respawn_civilian")) < 130) exitWith {
		player groupchat "Some supernatural force prevents you from detonating a bomb in this holy place!"
	};
	
	_item   = _this select 1;
	_anzahl = _this select 2;
	"hint localize ""STRS_inv_item_selbstmordbombe_globalmsg"";" call A_broadcast_fnc_broadcast;
	for [{_i=5}, {_i >= 0}, {_i=_i-1}] do {
		cutText[format["Bombcountdown: -->*%1*<--", _i],"plain"];
		sleep 1;
	};

	if (!(alive player)) exitWith {null};
	call compile format ["autobombe%2 = createVehicle [""Bo_GBU12_LGB"", (%1), [], 0, ""NONE""];",(getpos player), (round (random 2000))];
	[player, _item, -1] call A_inventory_fnc_add_item;
};
