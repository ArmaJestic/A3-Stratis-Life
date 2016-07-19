// A_mounted_fnc_attach

#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


ARGV(0,_player);
ARGV(1,_vehicle);
ARGV(2,_offset);

_player attachTo [_vehicle, _offset];
[_player, [(getDir _player),0,0]] call A_mounted_fnc_set_heading;
