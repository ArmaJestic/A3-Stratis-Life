// A_quarry_fnc_player_near

#include "header.h"


//player groupChat format["A_quarry_fnc_player_near %1", _this];
ARGV(0,_player);
if (!([_player] call A_player_fnc_exists)) exitWith {null};

private["_min_distance", "_quarry"];
_quarry = null;

{
	private["_cquarry", "_cdistance", "_clocation", "_cradius"];
	_cquarry = _x;
	_clocation = _cquarry select INDEX_LOCATION;
	_cmarker = _clocation select INDEX_LOCATION_MARKER;
	_cradius = _clocation select INDEX_LOCATION_RADIUS;
	
	_cdistance = _player distance (getMarkerPos  _cmarker);
	if (_cdistance < _cradius) exitWith {
		_quarry = _cquarry;
	};
} forEach A_quarry_var_data;

_quarry
