// A_interaction_fnc_teleport_player

#include "../../includes/macro.h"
#include "../../includes/constants.h"
#include "../../includes/dikcodes.h"


ARGV(0,_player);
if (not([_player] call A_player_fnc_human)) exitWith {null};

openMap true; 
onMapSingleClick format["%1 setPos _pos; %1 setVelocity [0,0,0]; openMap false; onMapSingleClick """"; true", (vehicle _player)];
