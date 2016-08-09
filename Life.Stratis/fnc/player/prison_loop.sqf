// A_player_fnc_prison_loop

#include "..\..\includes\macro.h"

 _this spawn {
ARGV(0,_player);
ARGV(1,_time_left);
ARGV(2,_bail_left);

if (undefined(_player)) exitWith {null};
if (_player != player) exitWith {null};
if (!([_player] call A_player_fnc_human)) exitWith {null};

if (undefined(_time_left)) exitWith {null};
if (typeName _time_left != "SCALAR") exitWith {null};

if (undefined(_bail_left)) exitWith {null};
if (typeName _bail_left != "SCALAR") exitWith {null};


private["_player_name", "_time_original"];
_player_name = (name _player);
_time_original = _time_left;

//move player to prison
_player setPos (getMarkerPos "prisonspawn");
_player setDamage 0;

//mark as arrested and clear warrants
[_player] call A_player_fnc_reset_warrants;
[_player, true] call A_player_fnc_set_arrest;
[_player, "restrained", false] call A_player_fnc_set_bool;
[_player, "stunned", false] call A_player_fnc_set_bool;


while {_time_left >= 0 && _bail_left >= 0} do {
	_bail_left = floor(((_time_left/_time_original)) * ([_player] call A_player_fnc_get_bail));
	
	//only update the time and bail left every 30 seconds to avoid spamming the stats
	if ((_time_left % 30) == 0) then {
		[_player, _bail_left] call A_player_fnc_set_bail;
		[_player, "jailtimeleft", _time_left] call A_player_fnc_set_scalar;
	};
	
	hintsilent format["Time until release\n%1 seconds\nBail left to pay\n$%2", _time_left, strM(_bail_left)];
	//PLAYER DISAPPEARED ...
	if (isNull(_player)) exitWith { 
		private["_message"];
		_message = format["%1 has pulled a ninja escape from prison >_< !", _player_name];
		format['server globalChat toString(%1);', toArray(_message)] call A_broadcast_fnc_broadcast;
	};
	
	//PLAYER DIED
	if (!(alive _player)) exitWith {
		private["_message"];
		_message = format["%1-%2 has died while in prison",_player, _player_name];
		format['server globalChat toString(%1);', toArray(_message)] call A_broadcast_fnc_broadcast;
		[_player, "jailtimeleft", _time_left] call A_player_fnc_set_scalar;
		[_player, _bail_left] call A_player_fnc_set_bail;
		[_player, true] call A_player_fnc_set_arrest;
	};
	
	//PLAYER HAS BEEN SET FREE
	if (!([_player] call A_player_fnc_get_arrest)) exitWith {
		/*
		private["_message"];
		_message = format["%1-%2 has been set free by the authorities", _player, _player_name];
		format['server globalChat toString(%1);', toArray(_message)] call A_broadcast_fnc_broadcast;
		*/
		[_player] call A_player_fnc_prison_reset;
		[_player] call A_player_fnc_prison_release;
	};
	
	//PLAYER HAS ESCAPED PRISON
	if ((player distance prison_logic) >= 100) exitWith {
		private["_message"];
		_message = format["%1-%2 has pulled a daring escape from prison >_< !", _player, _player_name];
		format['server globalChat toString(%1);', toArray(_message)] call A_broadcast_fnc_broadcast;
		[_player, false] call A_player_fnc_set_arrest;
		[_player, "jailtimeleft", 0] call A_player_fnc_set_scalar;
		[_player, 0] call A_player_fnc_set_bail;
		[_player, "(prison-break)", 20000] call A_player_fnc_update_warrants;
	};
	
	//PLAYER HAS SERVED HIS FULL SENTNECE
	if (_time_left <= 0 ) exitWith {
		private["_message"];
		_message = format["%1-%2 has been released from prison, after serving a %3 minute/s sentence", _player, _player_name, round(_time_original/60)];
		format['server globalChat toString(%1);', toArray(_message)] call A_broadcast_fnc_broadcast;
		[_player] call A_player_fnc_prison_reset;
		[_player] call A_player_fnc_prison_release;
	};
	
	//PLAYER HAS PAID THE FULL BAIL
	if (_bail_left <= 0 && _time_left > 0 ) exitWith {
		private["_message"];
		_message = format["%1-%2 has been relased from prison, after paying bail", _player, _player_name];
		format['server globalChat toString(%1);', toArray(_message)] call A_broadcast_fnc_broadcast;
		[_player] call A_player_fnc_prison_reset;
		[_player] call A_player_fnc_prison_release;
	};
	
	_time_left  = _time_left - 1;
	sleep 1;
};
};
