// A_shop_menu_fnc_buy

#include "../../includes/constants.h"
#include "../../includes/macro.h"


private["_data"];
_data = call A_shop_menu_fnc_update_buy_item;
if (undefined(_data)) exitWith {null};

ctrlEnable [buy_button_idc, false];

[_data] call A_shop_menu_fnc_buy_transaction;
private ["_type"];
_type = _data select A_shop_menu_var_buy_item_type;
switch _type do {
	case "Item": {
		[_data] call A_shop_menu_fnc_buy_item;
	};
	case "Fort": {
		[_data] call A_shop_menu_fnc_buy_fort;
	};
	case "Vehicle": {
		[_data] call A_shop_menu_fnc_buy_vehicle;
	};
	case "Weapon": {
		[_data, INV_CreateWeapon] call A_shop_menu_fnc_buy_gear_item;
	};
	case "Magazine": {
		[_data, INV_CreateMag] call A_shop_menu_fnc_buy_gear_item;
	};
	case "backpack": {
		[_data, INV_CreatePack] call A_shop_menu_fnc_buy_gear_item;
	};
	case "Vest": {
		[_data, INV_CreateVest] call A_shop_menu_fnc_buy_gear_item;
	};
	case "Uniform": {
		[_data, INV_CreateUniform] call A_shop_menu_fnc_buy_gear_item;
	};
	case "LinkedItem": {
		[_data, INV_CreateLinkedItem] call A_shop_menu_fnc_buy_gear_item;
	};
	case "BISItem": {
		[_data, INV_CreateBISItem] call A_shop_menu_fnc_buy_gear_item;
	};
	case "Headgear": {
		[_data, INV_CreateHeadgear] call A_shop_menu_fnc_buy_gear_item;
	};
	case "Goggles": {
		[_data, INV_CreateGoggles] call A_shop_menu_fnc_buy_gear_item;
	};
	case "Attachment": {
		[_data, INV_CreateAttachment] call A_shop_menu_fnc_buy_gear_item;
	};
};
call A_shop_menu_fnc_update_buy_item;
