// A_vector_fnc_matrixX
#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"

ARGV(0,_m);
ARGV(1,_v);

([
   (((_v select 0) * ((_m select 0) select 0)) + ((_v select 1) * ((_m select 0) select 1)) + ((_v select 2) * ((_m select 0) select 2))),
   (((_v select 0) * ((_m select 1) select 0)) + ((_v select 1) * ((_m select 1) select 1)) + ((_v select 2) * ((_m select 1) select 2))),
   (((_v select 0) * ((_m select 2) select 0)) + ((_v select 1) * ((_m select 2) select 1)) + ((_v select 2) * ((_m select 2) select 2)))
 ])
