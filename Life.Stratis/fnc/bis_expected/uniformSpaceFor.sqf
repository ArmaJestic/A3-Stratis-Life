// A_bis_expected_fnc_uniformSpaceFor

#include "..\..\includes\macro.h"


ARGV(0,_player);
ARGV(1,_item_id);

if (not([_player] call A_player_fnc_human)) exitWith {false};
if (not([_item_id] call A_config_fnc_class_item)) exitWith {false};

private["_item_mass", "_uniform_load", "_uniform_max_load", "_uniform_id"];
_uniform_id = [_player] call A_player_fnc_uniform;

if (_uniform_id == "") exitWith {false};
_item_mass = [_item_id] call A_config_fnc_class_item_mass;
_uniform_max_load = [_uniform_id] call A_config_fnc_class_item_max_load;
_uniform_load =  [_player] call A_bis_expected_fnc_realLoadUniform;

((_uniform_load + _item_mass) <= _uniform_max_load)
