// A_economy_menu_fnc_menu_create

#include "../../includes/constants.h"
#include "../../includes/macro.h"

	
ARGV(0,_this);
ARGV(0,_player);

private["_item_tax_button"];
_item_tax_button = ["Item Tax", A_economy_menu_fnc_menu_handle_tax, ["Item"]];

private["_vehicle_tax_button"];
_vehicle_tax_button = ["Vehicle Tax", A_economy_menu_fnc_menu_handle_tax, ["Vehicle"]];

private["_magazine_tax_button"];
_magazine_tax_button = ["Magazines Tax", A_economy_menu_fnc_menu_handle_tax, ["Magazine"]];

private["_weapon_tax_button"];
_weapon_tax_button = ["Weapons Tax", A_economy_menu_fnc_menu_handle_tax, ["Weapon"]];

private["_bank_tax"];
_bank_tax = ["Banking Tax", A_economy_menu_fnc_menu_handle_tax, ["Bank"]];

private["_buttons_data"];

_buttons_data = [
	_item_tax_button,
	_vehicle_tax_button,
	_magazine_tax_button,
	_weapon_tax_button,
	_bank_tax
	];

[toUpper("Economy Menu"), _buttons_data] call A_main_menu_fnc_setup;
