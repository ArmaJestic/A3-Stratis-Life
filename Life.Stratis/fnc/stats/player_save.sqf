// A_stats_fnc_player_save
//method intended saving player stats ... it can be run on any client, or even cross-client to save stats for another player

#include "header.h"


params["_player", ["_variable",null,[""]], "_value"];

if (UNDEFINED(_variable)) exitWith {null};
if (UNDEFINED(_value)) exitWith {null};

private _uid = [_player] call A_stats_fnc_get_uid;
if (_uid == "") exitWith {null};
	
[_uid, _variable, _value] call A_stats_fnc_save;