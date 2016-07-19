// A_oil_derrick_fnc_sound_loop

#include "../../includes/dikcodes.h"
#include "../../includes/macro.h"


ARGV(0,_object);
playSound3D [MISSION_ROOT + "sounds\oil_derrick.ogg", _object, false, getPosASL _object, 1,1,100];
sleep 20;
_this spawn A_oil_derrick_fnc_sound_loop;
