// A_interaction_fnc_kick_to_lobby

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"


//player groupChat format["A_interaction_fnc_kick_to_lobby %1", _this];
ARGV(0,_target);
if (!([_target] call A_player_fnc_human)) exitWith {null};
if (player != _target) exitWith {null};
endMission "LOSER";
