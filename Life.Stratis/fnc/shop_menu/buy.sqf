// A_shop_menu_fnc_buy

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


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
		[_data, A_inv_fnc_createweapon] call A_shop_menu_fnc_buy_gear_item;
	};
	case "Magazine": {
		[_data, A_inv_fnc_createmag] call A_shop_menu_fnc_buy_gear_item;
	};
	case "backpack": {
		[_data, A_inv_fnc_createpack] call A_shop_menu_fnc_buy_gear_item;
	};
	case "Vest": {
		[_data, A_inv_fnc_createvest] call A_shop_menu_fnc_buy_gear_item;
	};
	case "Uniform": {
		[_data, A_inv_fnc_createuniform] call A_shop_menu_fnc_buy_gear_item;
	};
	case "LinkedItem": {
		[_data, A_inv_fnc_createlinkeditem] call A_shop_menu_fnc_buy_gear_item;
	};
	case "BISItem": {
		[_data, A_inv_fnc_createbisitem] call A_shop_menu_fnc_buy_gear_item;
	};
	case "Headgear": {
		[_data, A_inv_fnc_createheadgear] call A_shop_menu_fnc_buy_gear_item;
	};
	case "Goggles": {
		[_data, A_inv_fnc_creategoggles] call A_shop_menu_fnc_buy_gear_item;
	};
	case "Attachment": {
		[_data, A_inv_fnc_createattachment] call A_shop_menu_fnc_buy_gear_item;
	};
};
call A_shop_menu_fnc_update_buy_item;
