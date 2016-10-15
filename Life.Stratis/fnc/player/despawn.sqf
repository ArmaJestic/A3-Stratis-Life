// A_player_fnc_despawn

#include "header.h"


diag_log format['A_player_fnc_despawn %1: start', _this];

params["_unit","_delay"];

if (UNDEFINED(_unit)) exitWith {diag_log format['A_player_fnc_despawn %1: end1', _this];};
if (typeName _unit != "OBJECT") exitWith {diag_log format['A_player_fnc_despawn %1: end2', _this];};
if (isNull _unit) exitWith {diag_log format['A_player_fnc_despawn %1: end3', _this];};
if (UNDEFINED(_delay)) exitWith {diag_log format['A_player_fnc_despawn %1: end4', _this];};
if (typeName _delay != "SCALAR") exitWith {diag_log format['A_player_fnc_despawn %1: end5', _this];};


//_delay = ((_delay - 5) max (0));
//[_delay] call A_player_fnc_isleep;
sleep _delay;

// useless, why delete body
//if ([_unit] call A_bases_fnc_underbase_player) exitWIth {
//	_unit setPosASL[0,0,0];
//	deleteVehicle _unit;
//};

//private["_i"];
//_i = 0;
//while {_i < 5} do {
//	hideBody _unit;
//	sleep 1;
//	_i = _i + 1;
//};
hideBody _unit;

//if (isServer) then {
//	sleep 5;
//	deleteVehicle _unit;
//};

diag_log format['A_player_fnc_despawn %1: end', _this];