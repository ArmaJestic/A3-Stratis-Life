// A_player_fnc_teleport_respawn_position

#include "header.h"


diag_log format['A_player_fnc_teleport_respawn_position %1: start', _this];

ARGV(0,_player);
if (UNDEFINED(_player)) exitWith {diag_log format['A_player_fnc_teleport_respawn_position %1: exit1', _this];};

if (UNDEFINED(attachRef)) then {
	attachRef = [] call A_object_fnc_create_attach_ref;
};

// temp disabled
// private["_respawn"];
// _respawn = missionnamespace getvariable["BIS_fnc_respawnMenuPosition_respawn",""];
//private _respawn = switch ([_player] call A_stats_fnc_human_side) do {
//	case civilian: {"respawn_civilian"};
//	case west: {"respawn_west"};
//	case east: {"respawn_east"};
//	case independent: {"respawn_guerrila"};
//	default {""};
//};
private _respawn = [([_player] call A_player_fnc_side)] call A_player_fnc_side_spawn_marker;
	
if (isNil "_respawn") exitWith {diag_log format['A_player_fnc_teleport_respawn_position %1: exit2', _this];};
if ((typeName _respawn == "STRING") && {_respawn == ""}) exitWith {diag_log format['A_player_fnc_teleport_respawn_position %1: exit3', _this];};

if ((typeName _respawn == "OBJECT") && {(_respawn isKindOf "Air") || {_respawn isKindOf "LandVehicle"} || {_respawn isKindOf "Ship"}}) then {
	diag_log format['A_player_fnc_teleport_respawn_position %1: object vehicle respawn', _this];
	
	private["_vehicle"];
	_vehicle = _respawn;
	//Driver
	if (!(alive (driver _vehicle)) && {!(lockedDriver _vehicle)}) then {
		_player moveInDriver _vehicle;
	};
	if (_player in _vehicle) exitwith {diag_log format['A_player_fnc_teleport_respawn_position %1: exit4', _this];};

	//Turrets
	{
		if ((!alive (_vehicle turretunit _x)) && {!(_vehicle lockedturret _x)}) then {
			_player moveinturret [_vehicle,_x];
		};
	} foreach ([_vehicle,[]] call bis_fnc_getTurrets);
	
	if (_player in _vehicle) exitwith {diag_log format['A_player_fnc_teleport_respawn_position %1: exit5', _this];};

	//Cargo
	if (((_vehicle emptyPositions "cargo") > 0) && {(locked _vehicle) <= 1}) then {
		_player moveincargo _vehicle;
	};
	
	if (_player in _vehicle) exitwith {diag_log format['A_player_fnc_teleport_respawn_position %1: exit6', _this];};
	
	player setVelocity [0,0,0];
	_player setPosATL (getPosATL _vehicle);
}else{
	if (typeName _respawn == "STRING") then {
		diag_log format['A_player_fnc_teleport_respawn_position %1: marker', _this];
	
		// not sure if this works
		// "_proxy" ending is for named objects, special way to respawn (like above ground for instance)
	//	_respawn = missionNamespace getVariable[_respawn + "_proxy", _respawn];
		if (typeName _respawn == "STRING") exitWith {
			diag_log format['A_player_fnc_teleport_respawn_position %1: exit7', _this];
			_player setVelocity[0,0,0];
			_player setPosATL (getMarkerPos _respawn);
		};
		
		private["_rad","_dir","_pos","_x","_y","_xr","_yr"];
		_rad = [_respawn, "radius", 0] call A_object_fnc_getVariable;
		_rad = (random _rad);
		_dir = random(360);
		
		_pos = _respawn modelToWorld [0,0,0];
		
		//convert from polar coordinates to X, Y
		_xr = _rad * cos(_dir);
		_yr = _rad * sin(_dir);
		diag_log format["A_player_fnc_teleport_respawn_position %1: _xr = %2, _yr = %3, _dir = %4", _this, _xr, _yr, _dir];
		
		_player attachTo [_respawn, [_xr,_yr,0]];
		detach _player;
	}else{
		if (typeName _respawn == "ARRAY") then {
			diag_log format['A_player_fnc_teleport_respawn_position %1: array', _this];
		
			_player attachTo [attachRef, _respawn];
			detach _player;
		}else{
			diag_log format['A_player_fnc_teleport_respawn_position %1: respawn classification failed', _this];
		};
	};
};

diag_log format['A_player_fnc_teleport_respawn_position %1: end', _this];