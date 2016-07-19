// A_vector_fnc_normalize
#include "../../includes/constants.h"
#include "../../includes/macro.h"

private["_v1"];
_v1 = _this select 0;

private["_len"];
_len = sqrt((_v1 select 0)^2 + (_v1 select 1)^2 + (_v1 select 2)^2);
if (_len == 0) exitWith {[0,0,0]};
([(_v1 select 0)/(_len), (_v1 select 1)/(_len), (_v1 select 2)/(_len)])
