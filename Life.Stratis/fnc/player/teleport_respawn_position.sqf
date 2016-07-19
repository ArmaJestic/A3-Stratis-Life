// A_player_fnc_teleport_respawn_position

#include "../../includes/macro.h"


ARGV(0,_player);
if (undefined(_player)) exitWith {};

if (undefined(attachRef)) then {
	attachRef = [] call A_object_fnc_create_attach_ref;
};

private["_respawn"];
_respawn = missionnamespace getvariable ["BIS_fnc_respawnMenuPosition_respawn",""];

	
if (isNil "_respawn") exitWith {};
if ((typeName _respawn == "STRING") && {_respawn == ""}) exitWith {};

if (typeName _respawn == "OBJECT" && {_respawn isKindOf "Air" || _respawn isKindOf "LandVehicle" || _respawn isKindOf "Ship"}) then {
	private["_vehicle"];
	_vehicle = _respawn;
	//Driver
	if (!alive (driver _vehicle) && !(lockedDriver _vehicle)) then {
		_player moveInDriver _vehicle;
	};
	if (_player in _vehicle) exitwith {};

	//Turrets
	{
		if (!alive (_vehicle turretunit _x) && !(_vehicle lockedturret _x)) then {
			_player moveinturret [_vehicle,_x];
		};
	} foreach ([_vehicle,[]] call bis_fnc_getTurrets);
	if (_player in _vehicle) exitwith {};

	//Cargo
	if ((_vehicle emptyPositions "cargo") > 0 && (locked _vehicle) <= 1) then {
		_player moveincargo _vehicle;
	};
	if (_player in _vehicle) exitwith {};
	
	_player setPos getPos _vehicle;
}
else { if (typeName _respawn == "STRING") then {
	_respawn = missionNamespace getVariable [_respawn + "_proxy", _respawn];
	if (typeName _respawn == "STRING") exitWith {
		_player setPos (getMarkerPos _respawn);
	};
	
	private["_rad", "_dir"];
	_rad = [_respawn, "radius", 0] call A_object_fnc_getVariable;
	_rad = (random _rad);
	_dir = random(360);
	
	private["_pos"];
	_pos = _respawn modelToWorld [0,0,0];
	
	//convert from polar coordinates to X, Y
	private["_x", "_y", "_xr", "_yr"];
	_xr = _rad * cos(_dir);
	_yr = _rad * sin(_dir);
	player globalChat format["_xr = %1, _yr = %2, _dir = %3", _xr, _yr, _dir];
	
	_player attachTo [_respawn, [_xr,_yr,0]];
	detach _player;
}
else { if (typeName _respawn == "ARRAY") then {	
	_player attachTo [attachRef, _respawn];
	detach _player;
};};};
