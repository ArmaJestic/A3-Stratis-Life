// A_bases_fnc_underbase_check_effects

#include "header.h"


private _player = player;
private _underwater_base = [_player] call A_bases_fnc_underwater_player_inside;
private _underground_base = [_player] call A_bases_fnc_underground_player_inside;
private _respawning = (playerRespawnTime > 0) && {!(alive _player)};

private _under = (_underground_base || {_underwater_base});

if (_under && {!_respawning}) then {
	showGPS false;
	showMap false;
	enableEnvironment false;
}else{
	showGPS true;
	showMap true;
	enableEnvironment true;
};

if (_underwater_base) exitWith {};

if (_under && {!A_time_var_loop_exit}) exitwith {
	call A_bases_fnc_underbase_setnight;
};
if (!(_under) && {A_time_var_loop_exit}) then {
	call A_bases_fnc_underbase_setday;
};