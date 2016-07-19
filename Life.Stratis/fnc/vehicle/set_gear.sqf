// A_vehicle_fnc_set_gear

#include "../../includes/macro.h"


//player groupChat format["A_vehicle_fnc_set_gear %1", _this];
ARGV(0,_vehicle);
ARGV(1,_gear);
if (not([_vehicle] call A_vehicle_fnc_exists)) exitWith {null};
if (undefined(_gear)) exitWith {null};
if (typeName _gear != "ARRAY") exitWith {null};

private["_weapons_cargo", "_magazines_cargo"];	

_weapons_cargo = _gear select A_vehicle_var_gear_weapons_cargo;
_magazines_cargo = _gear select A_vehicle_var_gear_magazines_cargo;

if (undefined(_weapons_cargo)) exitWith {null};
if (undefined(_magazines_cargo)) exitWith {null};

if (typeName _weapons_cargo != "ARRAY") exitWith {null};
if (typename _magazines_cargo != "ARRAY") exitWith {null};


private["_cargo_weapons_class", "_cargo_weapons_count", "_cargo_magazines_class", "_cargo_magazines_count"];
_cargo_weapons_class  = _weapons_cargo select 0;
_cargo_weapons_count	= _weapons_cargo select 1;
_cargo_magazines_class = _magazines_cargo select 0;
_cargo_magazines_count= _magazines_cargo select 1;
	
private["_i"];

_i = 0;
while { _i < (count _cargo_weapons_class) } do {
	private["_weapon_class", "_weapon_count"];
	_weapon_class = _cargo_weapons_class select _i;
	_weapon_count = _cargo_weapons_count select _i;
	_vehicle addWeaponCargoGlobal [_weapon_class, _weapon_count];
	_i = _i + 1;
};
	
_i = 0;
while { _i < (count _cargo_magazines_class) } do { 
	private["_magazine_class", "_magazine_count"];
	_magazine_class = _cargo_magazines_class select _i;
	_magazine_count = _cargo_magazines_count select _i;
	_vehicle addMagazineCargoGlobal [_magazine_class, _magazine_count];
	_i = _i + 1;
};