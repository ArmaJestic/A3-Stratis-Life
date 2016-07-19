// A_player_fnc_players_object_near

#include "..\..\includes\macro.h"


ARGV(0,_object);
ARGV(1,_distance);

if (undefined(_object)) exitWith {[]};
if (undefined(_distance)) exitWith {[]};
if (typeName _object != "OBJECT") exitWith {[]};
if (typeName _distance != "SCALAR") exitWith {[]};

private["_near_players"];
_near_players = [];
{
	private["_player_variable_name", "_player_variable"];
	_player_variable_name = _x;
	_player_variable = missionNamespace getVariable _player_variable_name;
	if ([_player_variable] call A_player_fnc_human) then {
		if ((_player_variable distance _object) < _distance) then {
			_near_players = _near_players + [_player_variable];
		};
	};
} forEach playerstringarray;

_near_players
