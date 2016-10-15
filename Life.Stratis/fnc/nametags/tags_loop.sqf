// A_nametags_fnc_tags_loop

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


if (alive player) then {
	private _side = [player] call A_player_fnc_side;
	A_nametags_var_name_tags_side_units = A_nametags_var_name_tags_side_units - [objNull];
	
	{
		private _cplayer = _x;
	//	if UNDEFINED(_cplayer) exitWith {};
	//	if (typeName _cplayer != "OBJECT") exitWith {};
	//	if (isNull _cplayer) exitWith {};
		if (_cplayer isEqualTo objNull) exitwith {};
		
		private _cside = side _cplayer;
		if (_cside != _side) exitWith {};
		if (_cplayer in A_nametags_var_name_tags_side_units) exitWith {};
		
		A_nametags_var_name_tags_side_units pushBack _cplayer;
	} forEach playableUnits;
};