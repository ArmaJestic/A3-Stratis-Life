// A_interaction_fnc_keychain_drop

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"


//player groupChat format["A_interaction_fnc_keychain_drop %1", _this];
ARGV(0,_player);
ARGV(1,_vehicle);
if (!([_player] call A_player_fnc_human)) exitWith {null};
if (!([_vehicle] call A_vehicle_fnc_exists)) exitWith {null};

    [_player, _vehicle] call A_vehicle_fnc_remove;
    player groupChat format["You dropped the key for %1", _vehicle];
