// A_list_menu_fnc_populate

#include "../../includes/macro.h"
#include "../../includes/constants.h"


ARGV(0,_control);
ARGV(1,_uids);

if (undefined(_control)) exitWith {null};
if (undefined(_uids)) exitWith {null};
if (typeName _uids != "ARRAY") exitWith {null};

 lbClear _control;

private["_i"];
_i = 0;
{if (true) then {
	private["_player", "_name", "_uid"];
	_player = _x;
	_name = (name _player);
	_uid = (getPlayerUID _player);
	
	if (not([_player] call A_player_fnc_human)) exitWith {null};
	
	_i = _i + 1;
	
	private["_color"];
	_color = [1,0,0,0.8];
	if (_uid in _uids) then {
		_color = [0,1,0,0.8]; 
	};
	
	private["_index"];
	_index = _control lbAdd format["%1. %2", _i, _name, _uid];
	_control lbSetData [_index, _uid];
	_control lbSetColor [_index, _color];	
};} forEach (allUnits);
