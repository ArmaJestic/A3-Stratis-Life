// A_inv_fnc_createmag

#include "..\..\includes\macro.h"


liafu = true;
private["_class", "_amount", "_crate"];
_class = _this select 0;
_amount = _this select 1;
_crate = _this select 2;

_crate addmagazineCargoGlobal [_class,_amount];
