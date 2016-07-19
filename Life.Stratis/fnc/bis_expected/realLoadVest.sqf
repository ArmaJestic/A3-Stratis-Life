// A_bis_expected_fnc_realLoadVest

#include "../../includes/macro.h"


ARGV(0,_player);
if (not([_player] call A_player_fnc_human)) exitWith {false};

private["_vest_id"];
_vest_id = [_player] call A_player_fnc_vest;
if (_vest_id == "") exitWith {0};

private["_vest_max_load"];
_vest_max_load = [_vest_id] call A_config_fnc_class_item_max_load;
(_vest_max_load * (loadVest _player))
