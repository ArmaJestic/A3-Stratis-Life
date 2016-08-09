// A_mine_fnc_player_near

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


//player groupChat format["A_mine_fnc_player_near %1", _this];
ARGV(0,_player);
if (!([_player] call A_player_fnc_exists)) exitWith {null};

private["_min_distance", "_mine"];
_mine = null;

{
	private["_cmine", "_cdistance", "_clocation", "_cradius"];
	_cmine = _x;
	_clocation = _cmine select A_mine_var_data_location;
	_cmarker = _clocation select A_mine_var_data_location_marker;
	_cradius = _clocation select A_mine_var_data_location_radius;
	
	_cdistance = _player distance (getMarkerPos  _cmarker);
	if (_cdistance < _cradius) exitWith {
		//player groupChat format["marker: %1", _cmarker];
		_mine = _cmine;
	};
} forEach A_mine_var_data;

_mine
