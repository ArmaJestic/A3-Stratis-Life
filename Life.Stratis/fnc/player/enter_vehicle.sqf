// A_player_fnc_enter_vehicle

#include "../../includes/macro.h"

 
//player groupChat format["A_player_fnc_enter_vehicle %1", _this];
ARGV(0,_player);
ARGV(1,_vehicle);
ARGV(2,_immediate);
if (not([_player] call A_player_fnc_exists)) exitWith {false};
if (undefined(_vehicle)) exitWith {false};
if (undefined(_immediate)) exitWith {false};
if (typeName _immediate != "BOOL") exitWith {false};

_vehicle lock false;
private["_empty_driver", "_empty_gunner", "_empty_commander", "_empty_cargo"];
_empty_driver = _vehicle emptyPositions "Driver";
_empty_gunner = _vehicle emptyPositions "Gunner";
_empty_commander = _vehicle emptyPositions "Commander";
_empty_cargo = _vehicle emptyPositions "Cargo";


if (_empty_driver > 0) exitWith {
	if (_immediate) then {
		_player moveInDriver _vehicle;
	}
	else {
		_player action ["getInDriver", _vehicle];
	};
	true
};
	
if (_empty_gunner > 0) exitWith {
	if (_immediate) then {
		_player moveInGunner _vehicle;
	}
	else {
		_player action ["getInGunner", _vehicle];
	};
	true
};
	
if (_empty_commander > 0) exitWith {
	if (_immediate) then {
		_player moveInCommander _vehicle;
	}
	else {
		_player action ["getInCommmander", _vehicle];
	};
	true
};
	
if (_empty_cargo > 0) exitWith { 
	if (_immediate) then {
		_player moveInCargo _vehicle;
	}
	else {
		_player action ["getInCargo", _vehicle];
	};
	true
};

false
