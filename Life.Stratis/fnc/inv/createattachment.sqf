// A_inv_fnc_createattachment

#include "header.h"


player groupChat format["A_inv_fnc_createattachment %1", _this];
private["_class", "_amount", "_crate", "_in_hands"];

_class = _this select 0;
_amount = _this select 1;
_crate = _this select 2;
_in_hands = if (count _this > 3) then { _this select 3 } else { false };

if (_in_hands) then {
	[player, _class] call A_bis_expected_fnc_addWeaponItem;
}else{
	_crate addItemCargoGlobal [_class, _amount];
};
