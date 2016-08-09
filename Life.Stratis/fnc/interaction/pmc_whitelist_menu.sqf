// A_interaction_fnc_pmc_whitelist_menu

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"

_this spawn {
ARGV(0,_player);
if (!([_player] call A_player_fnc_human)) exitWith {null};

if (!(createDialog "ListMenu")) exitWith {
	player groupChat format["ERROR: cannot create PMC Whitelist menu"];	
};

private["_list_name"];
_list_name = "pmc_whitelist";

if (!([_list_name] call A_list_fnc_exists)) then {
	//create the PMC White-List
	[_list_name, "PMC Whitelist"] call A_list_fnc_create;
};

[_player, _list_name] call A_list_menu_fnc_setup;
};
