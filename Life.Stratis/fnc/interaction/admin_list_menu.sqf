// A_interaction_fnc_admin_list_menu

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"

_this spawn {
ARGV(0,_player);
if (!([_player] call A_player_fnc_human)) exitWith {null};

if (!(createDialog "ListMenu")) exitWith {
	player groupChat format["ERROR: cannot create admin list menu"];	
};

[_player, "admin_list"] call A_list_menu_fnc_setup;
};
