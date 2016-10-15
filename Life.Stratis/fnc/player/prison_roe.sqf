// A_player_fnc_prison_roe

#include "header.h"

 _this spawn {
//player groupChat format["roe prison _this = %1", _this];
ARGV(0,_player);
if (!([_player] call A_player_fnc_human)) exitWith {null};
if (_player != player) exitWith {null};

private["_time_left"];
_time_left = [_player, "roeprisontime"] call A_player_fnc_get_scalar;
if (_time_left <= 0) exitWith {
	[_player, "roeprison", false] call A_player_fnc_set_bool;
};

private["_message"];
_message = format["%1-%2 has been sent to prison for %3 minute/s, for ROE violations",  _player, (name _player), strN(round(_time_left/60))];
format['server globalChat toString(%1);', toArray(_message)] call A_broadcast_fnc_broadcast;

[_player, "roeprison", true] call A_player_fnc_set_bool;
_player setPos (getPos CopPrison);
[_player] call A_player_fnc_reset_gear;

private["_time_original"];
_time_original = _time_left;

while {_time_left >= 0} do {
	//only update the time left every 30 seconds to avoid spamming the stats
	if ((_time_left % 30) == 0) then {
		[_player, "roeprisontime", _time_left] call A_player_fnc_set_scalar;
	};
	
	hintsilent format["Time until release\n%1 seconds", _time_left];
	
	//PLAYER DISAPPEARED ...
	if (isNull(_player)) exitWith { 
		[_player, "roeprisontime", _time_left] call A_player_fnc_set_scalar;
	};
	
	//PLAYER DIED
	if (!(alive _player)) exitWith {
		[_player, "roeprisontime", _time_left] call A_player_fnc_set_scalar;
	};
	
	//PLAYER HAS ESCAPED PRISON
	if ((_player distance CopPrison) >= 100) then {
		private["_message"];
		_message = format["%1-%2 attempted to escape from prison with %3 minute/s left on his sentence", _player, (name _player), strN(round(_time_left/60))];
		format['server globalChat toString(%1);', toArray(_message)] call A_broadcast_fnc_broadcast;
		_player setPos (getPos CopPrison);
	};

	//PLAYER HAS SERVED HIS FULL SENTNECE
	if (_time_left <= 0 ) exitWith {
		[_player, "roeprisontime", 0] call A_player_fnc_set_scalar;
		[_player, "roeprison", false] call A_player_fnc_set_bool;
		_message = format["%1-%2 has been set free, after serving %3 minute/s", _player, (name _player), strN(round(_time_original/60))];
		format['server globalChat toString(%1);', toArray(_message)] call A_broadcast_fnc_broadcast;
		_player setPos (getPos CopPrisonAusgang);
	};
	
	_time_left  = _time_left - 1;
	sleep 1;
};
};
