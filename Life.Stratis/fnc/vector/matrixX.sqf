// A_vector_fnc_matrixX
#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


params["_m","_v"];

([
   (((_v select 0) * ((_m select 0) select 0)) + ((_v select 1) * ((_m select 0) select 1)) + ((_v select 2) * ((_m select 0) select 2))),
   (((_v select 0) * ((_m select 1) select 0)) + ((_v select 1) * ((_m select 1) select 1)) + ((_v select 2) * ((_m select 1) select 2))),
   (((_v select 0) * ((_m select 2) select 0)) + ((_v select 1) * ((_m select 2) select 1)) + ((_v select 2) * ((_m select 2) select 2)))
 ])