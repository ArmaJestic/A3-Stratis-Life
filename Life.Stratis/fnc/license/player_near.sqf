// A_license_fnc_player_near

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


//player groupChat format["A_license_fnc_player_near %1", _this];
ARGV(0,_player);
ARGV(1,_distance);

if (!([_player] call A_player_fnc_exists)) exitWith {null};
if (undefined(_distance)) exitWith {null};
if (typeName _distance != "SCALAR") exitWith {null};

private["_min_distance", "_min_vendor"];
_min_distance = _distance;
_min_vendor = null;

{
	private["_clicense", "_cvendors"];
	_clicense = _x;
	_cvendors = _clicense select A_license_var_vendors;
	{
		private["_cvendor", "_cdistance"];
		_cvendor = _x;
		if ((typeName _x) == "STRING") then {
			_cvendor = missionNamespace getVariable[_x, objNull];
		}
		_cdistance = _player distance _cvendor;
		if (_cdistance < _min_distance) then {
			_min_distance = _cdistance;
			_min_vendor = _cvendor;
		};
	} forEach _cvendors;
} forEach A_license_var_INV_Licenses;

if (undefined(_min_vendor)) exitWith {null};
_min_vendor
