// A_interaction_fnc_admin_list_menu

#include "header.h"


params["_player"];
if (!([_player] call A_player_fnc_human)) exitWith {null};

if (!(createDialog "ListMenu")) exitWith {
	player groupChat format["ERROR: cannot create admin list menu"];	
};

[_player, "admin_list"] call A_list_menu_fnc_setup;