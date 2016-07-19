// A_shop_menu_fnc_get_player_by_uid

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_uid);
if (undefined(_uid)) exitWith {null};
if (typeName _uid != "STRING") exitWith {null};

private["_player"];
_player = null;
{
	private["_player_variable_name", "_cplayer", "_cuid"];
	_player_variable_name = _x;
	_cplayer = missionNamespace getVariable [_player_variable_name, null];
	_cuid = getPlayerUID _cplayer; 
	if (_cuid == _uid) exitWith {
		_player = _cplayer;
	};
} foreach playerstringarray;

_player
