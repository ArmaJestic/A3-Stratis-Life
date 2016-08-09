// A_inv_fnc_createlinkeditem

#include "..\..\includes\macro.h"


private["_class", "_amount", "_crate", "_in_hands"];

_class = _this select 0;
_amount = _this select 1;
_crate = _this select 2;
_in_hands = if (count _this > 3) then { _this select 3 } else { false };

if (_in_hands) then {
	player linkItem _class;
}else{
	_crate addItemCargoGlobal [_class, _amount];
};
