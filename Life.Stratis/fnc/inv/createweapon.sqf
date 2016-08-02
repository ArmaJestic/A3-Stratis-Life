// A_inv_fnc_createweapon

#include "..\..\includes\macro.h"


private["_class", "_amount", "_crate"];
_class = _this select 0;
_amount = _this select 1;
_crate = _this select 2;
_in_hands = if (count _this > 3) then { _this select 3 } else { false };

if (_in_hands) then {
	player addWeapon _class;
	player action ["switchweapon", player, player, 0];
}
else {
	_crate addweaponCargoGlobal [_class,_amount];
};
