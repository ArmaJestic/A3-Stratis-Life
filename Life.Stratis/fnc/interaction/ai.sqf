// A_interaction_fnc_ai

#include "header.h"


params[["_player",objNull,[objNull]],["_target",objNull,[objNull]]];
if ((isNull _player)||{isNull _target}) exitwith {false};

if (!([_player] call A_player_fnc_human)) exitWith {false};
if ([_target] call A_player_fnc_human) exitWith {false};
if (!([_target] call A_object_fnc_shop)) exitWith {false};

private _id = _target call A_inventory_fnc_get_shop_number;

if(([_player] call A_player_fnc_blufor) and (_target in A_bank_var_drugsellarray)) exitWith {
	[_id] call A_shop_menu_fnc_drug_search;
	true;
};

if((_target in pmc_shop_list)) exitWith {
	if (!([_player] call A_player_fnc_civilian)) exitWith {
		systemChat "You cannot access PMC Shops, you are not a civilian";
		true
	};

	if (!([_player] call A_player_fnc_pmc_whitelist)) exitWith {
		systemChat "You cannot access PMC Shops, the police chief has not added you to the whitelist";
		true
	};
	[_id] call A_shop_menu_fnc_open_dialog;
	true
};

[_id] call A_shop_menu_fnc_open_dialog;
true