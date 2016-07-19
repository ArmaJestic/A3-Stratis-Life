// A_player_fnc_init_civilian_stats

#include "..\..\includes\macro.h"


ARGV(0,_player);
if (not([_player] call A_player_fnc_civilian)) exitWith {null};

[_player, "gasmask", false, true] call A_object_fnc_setVariable;
[_player, "stun_armor", "none", true] call A_object_fnc_setVariable;
[_player, "stun_light_on", 0] call A_inventory_fnc_set_item_amount;
[_player, "stun_full_on", 0] call A_inventory_fnc_set_item_amount;
