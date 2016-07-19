// A_quarry_fnc_player_near

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


//player groupChat format["A_quarry_fnc_player_near %1", _this];
ARGV(0,_player);
if (not([_player] call A_player_fnc_exists)) exitWith {null};

private["_min_distance", "_quarry"];
_quarry = null;

{
	private["_cquarry", "_cdistance", "_clocation", "_cradius"];
	_cquarry = _x;
	_clocation = _cquarry select A_quarry_var_data_location;
	_cmarker = _clocation select A_quarry_var_data_location_marker;
	_cradius = _clocation select A_quarry_var_data_location_radius;
	
	_cdistance = _player distance (getMarkerPos  _cmarker);
	if (_cdistance < _cradius) exitWith {
		_quarry = _cquarry;
	};
} forEach A_quarry_var_data;

_quarry
