// A_bis_expected_fnc_realLoadUniform

#include "../../includes/macro.h"


ARGV(0,_player);
if (not([_player] call A_player_fnc_human)) exitWith {false};

private["_uniform_id"];
_uniform_id = [_player] call A_player_fnc_uniform;
if (_uniform_id == "") exitWith {0};

private["_uniform_max_load"];
_uniform_max_load = [_uniform_id] call A_config_fnc_class_item_max_load;
(_uniform_max_load * (loadUniform _player))
