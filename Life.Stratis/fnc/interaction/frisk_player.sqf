// A_interaction_fnc_frisk_player

#include "header.h"


player groupChat format["A_interaction_fnc_frisk_player %1", _this];
ARGV(0,_player);
ARGV(1,_target);

if (!([_player] call A_player_fnc_human)) exitWith {null};
if (!([_target] call A_player_fnc_human)) exitWith {null};

if (_player != player) exitWith {null};

private["_interaction"];
_interaction = "A_missions_fnc_search";
if (!([_player, _target, _interaction] call A_interaction_fnc_check_distance)) exitWith {null};
if (!([_player, _target, _interaction] call A_interaction_fnc_check_armed)) exitWith {null};


if(!([_target] call A_player_fnc_vulnerable))exitwith{
	player groupChat format["%1-%2 does not have his hands up, or is subdued", _target, (name _target)];
};

private["_buttons"];
_buttons = [
	["Inventory", A_frisk_menu_fnc_show_inventory, [_target]],
	["Weapons", A_frisk_menu_fnc_show_weapons, [_target]],
	["Licenses", A_frisk_menu_fnc_show_licenses, [_target]],
	["Magazines", A_frisk_menu_fnc_show_magazines, [_target]]
];

[toUpper("Frisk Player"), _buttons] call A_main_menu_fnc_setup;
