// A_inv_fnc_createpack

#include "..\..\includes\macro.h"


liafu = true;
private["_class", "_amount", "_crate"];
_class = _this select 0;
_amount = _this select 1;
_crate = _this select 2;
_in_hands = if (count _this > 3) then { _this select 3 } else { false };


if (_in_hands) then {
	player addBackpack _class;
}else{
	_crate addBackpackCargoGlobal [_class, _amount];
};

//remove the backpack's contents 
[] spawn {
	sleep 1;
	private["_backpack"];
	_backpack = unitBackpack player;
	if (undefined(_backpack)) exitWith {null};
	clearWeaponCargoGlobal _backpack;
	clearMagazineCargoGlobal _backpack;
};
