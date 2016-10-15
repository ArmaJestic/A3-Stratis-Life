// A_license_fnc_player_near

#include "header.h"


params["_player",["_distance",null,[0]]];

if (!([_player] call A_player_fnc_exists)) exitWith {null};
if (UNDEFINED(_distance)) exitWith {null};

private _min_distance = _distance;
private _min_vendor = null;

{
	private _clicense = _x;
	private _cvendors = _clicense select LICENSE_INDEX_VENDORS;
	{
		private["_cvendor", "_cdistance"];
		_cvendor = _x;
		if ((typeName _x) == "STRING") then {
			_cvendor = missionNamespace getVariable[_x, objNull];
		};
		if !(isNull _cvendor) then {
			_cdistance = _player distance _cvendor;
			if (_cdistance < _min_distance) then {
				_min_distance = _cdistance;
				_min_vendor = _cvendor;
			};
		};
	} forEach _cvendors;
} forEach A_license_var_licenses;

if (UNDEFINED(_min_vendor)) exitWith {null};
_min_vendor