// A_player_fnc_weapons_compatible_with_attachment

#include "header.h"


ARGV(0,_player);
if (!([_player] call A_player_fnc_exists)) exitWith {[]};

private["_weapons"];
_weapons = [_player] call A_player_fnc_weapons;

private["_compatible_attachments", "_i"];
_compatible_attachments = [];
_i = 0;
while {_i < count(_weapons) } do {
	private["_weapon_id"];
	_weapon_id = _weapons select _i;
	if (!([_weapon_id, _item_id] call A_weapon_fnc_compatible_with_attachment)) then {
		_weapons set [_i, ""];
	};
	_i = _i + 1;
};

(_weapons)
