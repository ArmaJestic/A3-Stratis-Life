// A_item_fnc_m_ammo

#include "..\..\includes\macro.h"


_action = _this select 0;
_item   = _this select 1;
_amount = _this select 2;

_veh = vehicle player;

if !(_veh iskindOf "StaticMortar") exitwith {
	player groupchat "You must be in a M252 or Podnos static";
};

switch _item do {
	case "Mammo_HE": {
		[_veh, "HE"] call A_item_fnc_m_ammo_add;
		player groupchat "8 High Explosive rounds added";
		[player, _item, -1] call A_inventory_fnc_add_item;
	};

	case "Mammo_WP": {
		[_veh, "WP"] call A_item_fnc_m_ammo_add;
		player groupchat "8 Willie Pete rounds added";
		[player, _item, -1] call A_inventory_fnc_add_item;
	};

	case "Mammo_IL": {
		[_veh, "IL"] call A_item_fnc_m_ammo_add;
		player groupchat "8 Illumination rounds added";
		[player, _item, -1] call A_inventory_fnc_add_item;
	};
};
