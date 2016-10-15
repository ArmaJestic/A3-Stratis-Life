// A_player_fnc_get_first_weapon

#include "header.h"


ARGV(0,_player);
if (!([_player] call A_player_fnc_exists)) exitWith {null};


private["_weapons", "_weapon_id", "_i"];
_weapons =  [_player] call A_player_fnc_weapons;
_weapon_id = "";

_i = 0;
while {_i < count(_weapons) } do {
	private["_cweapon_id"];
	_cweapon_id = _weapons select _i;
	if !(_cweapon_id == "") exitWith {
		_weapon_id = _cweapon_id;
	};
	_i = _i + 1;
};

(_weapon_id)
