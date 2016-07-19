// A_stats_fnc_player_save

//method intended saving player stats ... it can be run on any client, or even cross-client to save stats for another player

#include "..\..\includes\macro.h"

private["_player", "_variable", "_value"];
_player = _this select 0;
_variable = _this select 1;
_value = _this select 2;
	
private["_uid"];
_uid = [_player] call A_stats_fnc_get_uid;
if (_uid == "") exitWith {null};

if (undefined(_variable)) exitWith {null};
if (undefined(_value)) exitWith {null};
if (typeName _variable != "STRING") exitWith {null};
	
[_uid, _variable, _value] call A_stats_fnc_save;
