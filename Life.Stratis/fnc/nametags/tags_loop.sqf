// A_nametags_fnc_tags_loop

#include "..\..\includes\macro.h"
#include "..\..\constants.h"


//player groupChat format["A_nametags_fnc_tags_loop"];
private["_player"];
_player = player;
if (alive _player) then {
	private["_side"];
	_side = [_player] call A_player_fnc_side;
	A_nametags_var_A_nametags_var_name_tags_side_units = A_nametags_var_A_nametags_var_name_tags_side_units - [objNull];
	
	private["_cplayer", "_cside"];
	{
		_cplayer = _x;
		if (true) then {
			if (undefined(_cplayer)) exitWith {null};
			if (typeName _cplayer != "OBJECT") exitWith {null};
			if (isNull _cplayer) exitWith {null};
			_cside = side _cplayer;
			if (not(_cside == _side)) exitWith {null};
			if (_cplayer in A_nametags_var_name_tags_side_units) exitWith {null};
			A_nametags_var_A_nametags_var_name_tags_side_units set [count(A_nametags_var_A_nametags_var_name_tags_side_units), _cplayer];
		};
	} forEach playableUnits;
};

[] spawn A_nametags_fnc_tags_loop;
