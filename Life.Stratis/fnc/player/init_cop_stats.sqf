// A_player_fnc_init_cop_stats

#include "../../includes/macro.h"


ARGV(0,_player);
if (not([_player] call A_player_fnc_blufor)) exitWith {null};

private["_gasmask_on"];
_gasmask_on = ([player, "gasmask_on"] call A_inventory_fnc_get_item_amount > 0);
[_player, "gasmask", _gasmask_on, true] call A_object_fnc_setVariable;

if ([player, "stun_light_on"] call A_inventory_fnc_get_item_amount > 0) then {
	[_player, "stun_armor", "light", true] call A_object_fnc_setVariable;
}
else { if ([player, "stun_full_on"] call A_inventory_fnc_get_item_amount > 0) then {
	[_player, "stun_armor", "full", true] call A_object_fnc_setVariable;
}
else {
	[_player, "stun_armor", "none", true] call A_object_fnc_setVariable;
};};
stunshots = 0;
