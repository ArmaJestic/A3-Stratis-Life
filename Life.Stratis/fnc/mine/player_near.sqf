// A_mine_fnc_player_near

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


params["_player"];
if (!([_player] call A_player_fnc_exists)) exitWith {null};

private _mine = null;
{
	private["_cmine", "_cdistance", "_clocation", "_cradius"];
	_cmine = _x;
	_clocation = _cmine select MINE_INDEX_LOCATION;
	_cmarker = _clocation select MINE_INDEX_LOCATION_MARKER;
	_cradius = _clocation select MINE_INDEX_LOCATION_RADIUS;
	
	_cdistance = _player distance (getMarkerPos  _cmarker);
	if (_cdistance < _cradius) exitWith {
		_mine = _cmine;
	};
} forEach A_mine_var_data;

_mine