// A_vector_fnc_subtract
#include "../../includes/constants.h"
#include "../../includes/macro.h"

ARGV(0,_v1);
ARGV(1,_v2);

([((_v1 select 0) - (_v2 select 0)), ((_v1 select 1) - (_v2 select 1)), ((_v1 select 2) - (_v2 select 2))])
