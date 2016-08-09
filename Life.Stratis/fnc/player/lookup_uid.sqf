// A_player_fnc_lookup_uid

#include "..\..\includes\macro.h"


ARGV(0,_uid);

if (undefined(_uid)) exitWith {null};
if (typeName _uid != "STRING") exitWith {null};

private["_player"];
_player = null;
{
	private["_player_variable_name", "_player_variable"];
	_player_variable_name = _x;
	_player_variable =  missionNamespace getVariable _player_variable_name;
	if (!(undefined(_player_variable)) && {([_player_variable] call A_player_fnc_human)}) then {
		private["_cuid"];
		_cuid = (getPlayerUID _player_variable);
		if (_cuid == _uid) exitWith {
			_player = _player_variable;
		};
	};
	if (!(undefined(_player))) exitWith {null};
} forEach playerstringarray;

_player
