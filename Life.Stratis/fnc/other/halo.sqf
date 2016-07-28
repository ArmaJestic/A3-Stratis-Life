// A_other_fnc_halo

#include "..\..\includes\macro.h"

 
_this = call compile (_this select 3);

_unit = _this select 0;
_height = _this select 1;

[_unit, _height] exec "ca\air2\A_other_fnc_halo\data\Scripts\HALO_init.sqs";
