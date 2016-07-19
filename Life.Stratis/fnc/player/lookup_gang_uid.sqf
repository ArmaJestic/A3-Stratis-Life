// A_player_fnc_lookup_gang_uid

#include "../../includes/macro.h"


ARGV(0,_player_gang_uid);
if (undefined(_player_gang_uid)) exitWith {null};
if (typeName _player_gang_uid != "STRING") exitWith {null};

private["_player"];
_player = null;

{
	private["_unit", "_unit_gang_uid"];
	_unit = _x;
	_unit_gang_uid = [_unit] call A_gang_fnc_player_uid;
	
	if (_unit_gang_uid == _player_gang_uid) then {
		_player = _unit;
	};
} forEach playableUnits;

(_player)
