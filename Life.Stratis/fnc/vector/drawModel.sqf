// A_vector_fnc_drawModel
#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


params["_object","_vector1","_vector2"];

private _pos1 = (_object modelToWorld _vector1);
private _pos2 = (_object modelToWorld _vector2);

drawLine3D [_pos1, _pos2, [1,0,0,1]];