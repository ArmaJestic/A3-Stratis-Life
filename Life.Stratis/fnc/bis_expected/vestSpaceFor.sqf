// A_bis_expected_fnc_vestSpaceFor

#include "../../includes/macro.h"


ARGV(0,_player);
ARGV(1,_item_id);

if (not([_player] call A_player_fnc_human)) exitWith {false};
if (not([_item_id] call A_config_fnc_class_item)) exitWith {false};

private["_item_mass", "_vest_load", "_vest_max_load", "_vest_id"];
_vest_id = [_player] call A_player_fnc_uniform;

if (_vest_id == "") exitWith {false};
_item_mass = [_item_id] call A_config_fnc_class_item_mass;
_vest_max_load = [_vest_id] call A_config_fnc_class_item_max_load;
_vest_load =  [_player] call A_bis_expected_fnc_realLoadVest;

((_vest_load + _item_mass) <= _vest_max_load)
