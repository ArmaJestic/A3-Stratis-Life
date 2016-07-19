// A_object_fnc_set_heading

#include "../../includes/macro.h"


ARGV(0,_object);
ARGV(1,_data);

private["_vectors"];
_vectors = [_data] call A_object_fnc_calcualte_vectors;
_object setVectorDirAndUp _vectors;
