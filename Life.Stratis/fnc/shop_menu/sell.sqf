// A_shop_menu_fnc_sell

#include "../../includes/constants.h"
#include "../../includes/macro.h"

 [] spawn {
if (A_shop_menu_var_sell_active) exitWith {
	player groupChat format["ERROR: A_shop_menu_fnc_sell already active"];
};
A_shop_menu_var_sell_active = true;

private["_data"];
_data = call A_shop_menu_fnc_update_sell_item;
if (undefined(_data)) exitWith {
	A_shop_menu_var_sell_active = false;
};

ctrlEnable [sell_button_idc, false];

private ["_type", "_sold"];
_type = _data select A_shop_menu_var_sell_item_type;
_sold = true;
switch _type do {
	case "Item": {
		[_data] call A_shop_menu_fnc_sell_item;
	};
	case "Vehicle": {
		_sold = [_data] call A_shop_menu_fnc_sell_vehicle;
	};
	case "Weapon": {
		[_data] call A_shop_menu_fnc_sell_gear;
	};
	case "Magazine": {
		[_data] call A_shop_menu_fnc_sell_gear;
	};
	case "backpack": {
		[_data] call A_shop_menu_fnc_sell_gear;
	};
	case "Vest": {
		[_data] call A_shop_menu_fnc_sell_gear;
	};
	case "Uniform": {
		[_data] call A_shop_menu_fnc_sell_gear;
	};
	case "LinkedItem": {
		[_data] call A_shop_menu_fnc_sell_gear;
	};
	case "BISItem": {
		[_data] call A_shop_menu_fnc_sell_gear;
	};
	case "Headgear": {
		[_data] call A_shop_menu_fnc_sell_gear;
	};
	case "Goggles": {
		[_data] call A_shop_menu_fnc_sell_gear;
	};
	case "Attachment": {
		[_data] call A_shop_menu_fnc_sell_gear;
	};
};

if (_sold) then {
	[_data] call A_shop_menu_fnc_sell_transaction;
};
call A_shop_menu_fnc_update_sell_item;

A_shop_menu_var_sell_active = false;
};
