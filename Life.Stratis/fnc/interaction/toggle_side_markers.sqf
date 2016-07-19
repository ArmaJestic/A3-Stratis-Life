// A_interaction_fnc_toggle_side_markers

#include "../../includes/macro.h"
#include "../../includes/constants.h"
#include "../../includes/dikcodes.h"


ARGV(0,_title);
ARGV(1,_player);

if (undefined(_player)) exitWith {null};
if (_player != player) exitWith {null};

private["_sidemarkers"];
_sidemarkers = [_player, "sidemarkers"] call A_player_fnc_get_bool;
_sidemarkers = not(_sidemarkers);
[_player, "sidemarkers", _sidemarkers] call A_player_fnc_set_bool;

if (not(_sidemarkers)) then {
	player groupChat format["Side markers disabled"];
}
else {
	player groupChat format["Side markers enabled"];
};
