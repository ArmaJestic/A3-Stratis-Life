// A_inv_fnc_locateclosestvehicle

#include "..\..\includes\macro.h"


private["_i", "_list", "_vehicle", "_distance"];
_distance = _this select 0;
if (undefined(_distance)) exitWith {null};
if (typeName _distance != "SCALAR") exitWith {null};

_list = nearestObjects [player, ["LandVehicle", "Air"], _distance];
//player groupChat format["_list = %1", _list];
_i = (count _list - 1);
_vehicle = null;
while { _i >= 0 } do {
	private["_current", "_found"];
	_current = _list select _i;
	//player groupChat format["_current = %1", _current];
	if (alive(_current) && ([_current] call A_vehicle_fnc_player_owned)) then {
		_vehicle = _current;
	};
	_i = _i - 1;
};

_vehicle
