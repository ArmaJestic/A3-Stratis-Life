// A_interaction_fnc_keychain_give_receive

#include "../../includes/macro.h"
#include "../../includes/constants.h"
#include "../../includes/dikcodes.h"

_this spawn {
//player groupChat format["A_interaction_fnc_keychain_give_receive %1", _this];
ARGV(0,_player);
ARGV(1,_target);
ARGV(2,_vehicle);

if (not([_player] call A_player_fnc_human)) exitWith {null};
if (not([_target] call A_player_fnc_human)) exitWith {null};
if (not([_vehicle] call A_vehicle_fnc_exists)) exitWith {null};

if (_target != player) exitWith {null};

[_target, _vehicle] call A_vehicle_fnc_add;
player groupChat format["%1-%2, you received the key for %3 from %4-%5", _target, (name _target), _vehicle, _player, (name _player)];
};
