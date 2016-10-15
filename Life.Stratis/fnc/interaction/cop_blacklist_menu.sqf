// A_interaction_fnc_cop_blacklist_menu

#include "header.h"

_this spawn {
ARGV(0,_player);
if (!([_player] call A_player_fnc_human)) exitWith {null};

if (!(createDialog "ListMenu")) exitWith {
	player groupChat format["ERROR: cannot create Cop Blacklist menu"];	
};

private["_list_name"];
_list_name = "cop_blacklist";

if (!([_list_name] call A_list_fnc_exists)) then {
	//create the PMC White-List
	[_list_name, "Cop Blacklist"] call A_list_fnc_create;
};

[_player, _list_name] call A_list_menu_fnc_setup;
};
