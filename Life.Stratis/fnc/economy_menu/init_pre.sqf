// A_economy_menu_fnc_init_pre

#include "header.h"


if (isServer) then {
	economy_tax_data = [
		["Item", "Item", 5, [1, 25]], 
		["Vehicle", "Vehicle", 5, [1, 25]], 
		["Magazine","Magazine", 5, [1, 25]], 
		["Weapon", "Weapon", 5, [1, 25]],
		["Bank", "Bank", 5, [1, 25]]
	];
	publicVariable "economy_tax_data";
};