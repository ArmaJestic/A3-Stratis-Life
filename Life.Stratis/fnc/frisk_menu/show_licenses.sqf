// A_frisk_menu_fnc_show_licenses

#include "../../includes/constants.h"
#include "../../includes/macro.h"


ARGV(0,_title);
ARGV(1,_player);
ARGV(2,_this);

ARGV(0,_target);

if (undefined(_target)) exitWith {};

private["_title", "_list"];
_title = format["%1's Licenses", (name _player)];
_list = [_title, 0.14, 0.14, 0.6, 0.7] call A_main_menu_fnc_right_setup;

lbClear (ctrlIDC _list);

private["_i","_licenses"];
_licenses = [_target, "INV_LicenseOwner"] call A_player_fnc_get_array;
_i = 0;
while {_i < (count _licenses)} do {
	private["_license"];
	_license = (_licenses select _i);
	_list lbAdd format ["%1", (_license call A_inventory_fnc_get_license_name)];
	_i = _i + 1;
};
