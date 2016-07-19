// A_player_fnc_lookup_name

#include "..\..\includes\macro.h"


ARGV(0,_name);

if (undefined(_name)) exitWith {null};
if (typeName _name != "STRING") exitWith {null};

private["_player"];
_player = null;
{
	private["_player_variable_name", "_player_variable"];
	_player_variable_name = _x;
	_player_variable = missionNamespace getVariable _player_variable_name;

	if ([_player_variable] call A_player_fnc_exists) then {
		private["_cname"];
		_cname = [_player_variable, "name"] call A_object_fnc_getVariable;
		if (_cname == _name) exitWith {
			_player = _player_variable;
		};
	};
	if (not(undefined(_player))) exitWith {null};
} forEach playerstringarray;
_player
