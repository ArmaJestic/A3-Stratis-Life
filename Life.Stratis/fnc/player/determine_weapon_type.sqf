// A_player_fnc_determine_weapon_type

#include "..\..\includes\macro.h"


//player groupChat format["A_player_fnc_determine_weapon_type %1", _this];
ARGV(0,_player);
ARGV(1,_weapon_id);


if (not([_player] call A_player_fnc_exists)) exitWith {-1};
if (undefined(_weapon_id)) exitWith {-1};
if (typeName _weapon_id != "STRING") exitWith {-1};


private["_player_weapons"];
_A_player_fnc_weapons = [_player] call A_player_fnc_weapons;

//determine the type of weapon

private["_i", "_weapon_type"];
_i = 1;
_weapon_type = -1;
while { _i < count(_player_weapons) } do {
	private["_cweapon_id"];
	_cweapon_id = _player_weapons select _i;
	if (not(_cweapon_id == "") && (_cweapon_id == _weapon_id)) exitWith {
		_weapon_type = _i;
	};
	_i = _i + 1;
};

(_weapon_type)
