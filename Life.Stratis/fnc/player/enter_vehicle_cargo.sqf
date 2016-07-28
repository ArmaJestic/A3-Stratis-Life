// A_player_fnc_enter_vehicle_cargo

#include "..\..\includes\macro.h"

 
player groupChat format["A_player_fnc_enter_vehicle_cargo %1", _this];
ARGV(0,_player);
ARGV(1,_vehicle);
ARGV(2,_immediate);
if (not([_player] call A_player_fnc_exists)) exitWith {false};
if (undefined(_vehicle)) exitWith {false};
if (undefined(_immediate)) exitWith {false};
if (typeName _immediate != "BOOL") exitWith {false};

_vehicle lock false;
private["_empty_commander", "_empty_cargo"];
_empty_commander = _vehicle emptyPositions "Commander";
_empty_cargo = _vehicle emptyPositions "Cargo";


if (_empty_commander > 0) exitWith {
	if (_immediate) then {
		_player moveInCommander _vehicle;
	}
	else {
		_player A_actions_fnc_action ["getInCommmander", _vehicle];
	};
	true
};
	
if (_empty_cargo > 0) exitWith { 
	if (_immediate) then {
		_player moveInCargo _vehicle;
	}
	else {
		_player A_actions_fnc_action ["getInCargo", _vehicle];
	};
	true
};

false
