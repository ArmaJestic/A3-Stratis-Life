// A_main_menu_fnc_create

#include "../../includes/macro.h"
#include "../../includes/constants.h"


private["_finance_button"];
_finance_button = ["Finances", A_main_menu_fnc_handle_finances, ["Hello World!"]];

private["_statistics_button"];
_statistics_button = ["Statistics", A_main_menu_fnc_handle_statistics];

private["_factories_button"];
_factories_button = ["Factories", A_main_menu_fnc_handle_factories];

private["_gangs_button"];
_gangs_button = ["Gangs", A_main_menu_fnc_handle_gangs];

private["_gang_areas_button"];
_gang_areas_button = ["Gang Areas", A_main_menu_fnc_handle_gang_areas];

private["_licenses_button"];
_licenses_button = ["Licenses", A_main_menu_fnc_handle_licenes];

private["_bank_button"];
_bank_button = ["Bank", A_main_menu_fnc_handle_bank];

private["_players_button"];
_players_button = ["Players", A_main_menu_fnc_handle_players];

private["_crimes_button"];
_crimes_button = ["Crime log", A_main_menu_fnc_handle_crimes];

private["_workpalces_button"];
_workpalces_button = ["Workplaces", A_main_menu_fnc_handle_workplaces];

private["_government_button"];
_government_button = ["Elections", A_main_menu_fnc_handle_elections];
	
private["_legislation_button"];
_legislation_button = ["Legislation", A_main_menu_fnc_handle_legislation];

private["_economy_button"];
_economy_button = ["Economy", A_main_menu_fnc_handle_economy];

private["_buttons_data"];

_buttons_data = [
	_finance_button,
	_economy_button,
	_government_button,
	_legislation_button,
	_workpalces_button,
	_crimes_button,
	_players_button,
	_bank_button,
	_licenses_button,
	_gang_areas_button,
	_gangs_button,
	_factories_button,
	_statistics_button
	];

[toUpper("Main Menu"), _buttons_data] call A_main_menu_fnc_setup;
