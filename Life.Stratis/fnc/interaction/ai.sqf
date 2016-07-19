// A_interaction_fnc_ai

#include "../../includes/macro.h"
#include "../../includes/constants.h"
#include "../../includes/dikcodes.h"


//player groupChat format["A_interaction_fnc_ai %1", _this];
ARGV(0,_player);
ARGV(1,_target);

if (undefined(_player)) exitWith {false};
if (undefined(_target)) exitWith {false};

if (not([_player] call A_player_fnc_human)) exitWith {false};
if ([_target] call A_player_fnc_human) exitWith {false};
if (not(_target in A_farming_var_shopusearray)) exitWith {false};

private["_id"];
_id = _target call A_inventory_fnc_get_shop_number;

if(([_player] call A_player_fnc_blufor) and (_target in drugsellarray)) exitWith {
	[_id] spawn A_shop_menu_fnc_drug_search;
	true;
};

private["_handled"];
if((_target in pmc_shop_list)) exitWith {
	if (not([_player] call A_player_fnc_civilian)) exitWith {
		player groupChat "You cannot access PMC Shops, you are not a civilian";
		true
	};

	if (not([_player] call A_player_fnc_pmc_whitelist)) exitWith {
		player groupChat "You cannot access PMC Shops, the police chief has not added you to the whitelist";
		true
	};
	[_id] call A_shop_menu_fnc_open_dialog;
	true
};

[_id] call A_shop_menu_fnc_open_dialog;
true
