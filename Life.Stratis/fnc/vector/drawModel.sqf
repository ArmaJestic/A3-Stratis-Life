// A_vector_fnc_drawModel
#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"

ARGV(0,_object);
ARGV(1,_vector1)
ARGV(2,_vector2);

private["_pos1", "_pos2"];
_pos1 = (_object modelToWorld _vector1);
_pos2 = (_object modelToWorld _vector2);

drawLine3D [_pos1, _pos2, [1,0,0,1]];
