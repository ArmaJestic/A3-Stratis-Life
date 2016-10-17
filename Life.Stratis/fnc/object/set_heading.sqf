// A_object_fnc_set_heading
// used for attached objects, because setdir w/ attached objects will have it point to the obj attached to
// [_object,_heading]
// object, object to set
// data is, [direction,angle,pitch]
// direction (yaw)
// angle (bank/roll)
// pitch (pitch)

#include "..\..\includes\macro.h"


params["_object","_data"];

private _vectors = [_data] call A_object_fnc_calculate_vectors;

_object setVectorDirAndUp _vectors;