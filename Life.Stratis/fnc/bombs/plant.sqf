// A_bombs_fnc_plant

#include "..\..\includes\macro.h"


_item = _this select 1;
_id = format["%1_%2", player, round(time)];
_vcl = vehicle player;
_settings   = [];
_exit      = 0;
_explosion = 0;
if (vehicle player == player) exitWith {
	player groupChat localize "STRS_inv_item_vehiclebomb_notinvehicle";
};
	
format ["if (player in %1) then {player groupChat format[localize ""STRS_inv_item_vehiclebomb_legen_gesehen"", %2];};", _vcl, player] call A_broadcast_fnc_broadcast;
player groupChat format[localize "STRS_inv_item_vehiclebomb_planted", _id];

switch _item do {
	case "fernzuenderbombe": { 
		_settings = [ false ];
	};
	case "zeitzuenderbombe": { 
		_settings = [ ((round(time))+(_this select 2)) ];
	};
	case "aktivierungsbombe": { 
		_settings = [ false ];
	};
	case "geschwindigkeitsbombe": { 
		_settings = [ (_this select 2), false, (_this select 3), 0 ];  
	};
};

format["[%1, ""%2"", %3, ""%4"", ""%5"", %6] call A_bombs_fnc_add;", player, _id, _vcl, _item, "planted", _settings] call A_broadcast_fnc_broadcast;
[player, _item, (-1)] call A_inventory_fnc_add_item;