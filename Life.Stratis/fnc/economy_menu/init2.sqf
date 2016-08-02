// init2

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


if (undefined(economy_tax_data)) then {
	economy_tax_data = [
		["Item", "Item", 5, [1, 25]], 
		["Vehicle", "Vehicle", 5, [1, 25]], 
		["Magazine","Magazine", 5, [1, 25]], 
		["Weapon", "Weapon", 5, [1, 25]],
		["Bank", "Bank", 5, [1, 25]]
	];
};