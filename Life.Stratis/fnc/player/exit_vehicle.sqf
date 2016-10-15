// A_player_fnc_exit_vehicle

#include "header.h"


//player groupChat format["A_player_fnc_exit_vehicle %1", _this];
ARGV(0,_player);
ARGV(1,_vehicle);
ARGV(2,_immediate);
if (!([_player] call A_player_fnc_exists)) exitWith {null};
if (UNDEFINED(_vehicle)) exitWith {null};
if (UNDEFINED(_immediate)) exitWith {false};
if (typeName _immediate != "BOOL") exitWith {false};

_vehicle lock false;
if (_immediate) then {
	moveOut _player;
}else{
	private["_engine_state"];
	_engine_state =  isEngineOn _vehicle;
	_player action ["Eject", _vehicle];
	_vehicle engineOn _engine_state;
};

if (!(alive _player)) then {
	_player setPos [-1,-1,-1];
};
