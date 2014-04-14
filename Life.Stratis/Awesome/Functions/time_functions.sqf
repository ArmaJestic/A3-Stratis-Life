#include "macro.h"
if (not(undefined(time_functions_defined))) exitWith {null};

time_init_globals = {
	time_year = 0;
	time_month = 1;
	time_day = 2;
	time_hour = 3;
	time_minute = 4;
	time_second = 5;

	YEAR = 2012;
	DAYSYEAR = 366;
	SECSDAY = (24 * 60 * 60);
	
	//wait until the remote globals are initialized
	waitUntil {
		time_sunrise_to_sunset_minutes = server getVariable "time_sunrise_to_sunset_minutes";
		time_sunset_to_sunrise_minutes = server getVariable "time_sunset_to_sunrise_minutes";
		time_offset = server getVariable "time_offset";
		
		if (undefined(time_sunrise_to_sunset_minutes)) exitWith { false };
		if (undefined(time_sunset_to_sunrise_minutes)) exitWith { false };
		if (undefined(time_offset)) exitWith { false };
		if (not(typeName time_sunrise_to_sunset_minutes == "SCALAR" &&
		    typeName time_sunset_to_sunrise_minutes == "SCALAR" &&
			typeName time_offset == "SCALAR")) exitWith { false };
		true
	};
	
	time_sunrise_to_sunset =  time_sunrise_to_sunset_minutes * 60;          
	time_sunset_to_sunrise = time_sunset_to_sunrise_minutes * 60;           
	time_full_day = time_sunrise_to_sunset + time_sunset_to_sunrise;       

	time_sunrise_seconds = 7 * 60 * 60;                                        
	time_sunset_seconds = time_sunrise_seconds + (SECSDAY / 2); 
	
};

time_init_remote_globals = {
	if (!isServer) exitWith {null};
	if (not(undefined(time_remote_globals_defined))) exitWith {null};
	
	time_sunrise_to_sunset_minutes = 120;
	time_sunset_to_sunrise_minutes = 10;
	time_offset = 0;

	server setVariable ["time_sunrise_to_sunset_minutes", time_sunrise_to_sunset_minutes, true];
	server setVariable ["time_sunset_to_sunrise_minutes", time_sunset_to_sunrise_minutes, true];
	server setVariable ["time_offset", time_sunset_to_sunrise_minutes, true];

	time_remote_globals_defined = true;
};

[] call time_init_remote_globals;
[] call time_init_globals;

time_real2game_seconds = {
	private ["_gsecs", "_base_seconds", "_seconds_since_sunrise", "_seconds_since_sunset" ];
	ARGV(0,_rsecs);
	
	_game_days = floor(_rsecs / time_full_day);
	_gsecs = _game_days  * SECSDAY;
	
	private["_cycle_seconds", "_sunrise_secs"];
	_sunrise_secs = _rsecs  % time_full_day;
	
	if (_sunrise_secs <= time_sunrise_to_sunset) then {
		_cycle_seconds = ((_sunrise_secs * (SECSDAY / 2))  / time_sunrise_to_sunset);
	}
	else {
		_sunset_secs = _sunrise_secs - time_sunrise_to_sunset;
		_sunrise_secs = time_sunrise_to_sunset;
		_cycle_seconds = ((_sunrise_secs * (SECSDAY / 2))  / time_sunrise_to_sunset);
		_cycle_seconds = _cycle_seconds + ((_sunset_secs * (SECSDAY / 2))  / time_sunset_to_sunrise);
	};
	
	_cycle_seconds = floor(_cycle_seconds);
	(_gsecs + _cycle_seconds + time_offset)
};

time_game_time_number = {
	private ["_rsecs", "_gsecs"];
	
	if (undefined(init_date)) then {
		init_date = [YEAR, 01, 27, 10, 30];
	};
	_rsecs = floor(serverTime);
	
	_isecs = (dateToNumber init_date);
	_gsecs = ([_rsecs] call time_real2game_seconds) / (DAYSYEAR * SECSDAY);
	
	_result = (_isecs + _gsecs);
	_date =  numberToDate [YEAR, _result];
	//player groupChat format["_date = %1", _date];
	_result
};


time_update = {
	private ["_game_time", "_rsecs", "_gsecs"];
	if (time_loop_exit) exitWith {};

	_game_time_number	= call time_game_time_number;

	private ["_direction", "_i", "_skipMin", "_seconds"];

	_seconds = floor((_game_time_number - (dateToNumber date)) * (DAYSYEAR * SECSDAY));
	
	_skipMin = floor(_seconds / 60);
	if (_skipMin == 0) exitWith {null};
	
	//player groupChat format["_skipMin = %1", _skipMin];

	//no need to skip a whole day ...
	private["_fullDayMin"];
	_fullDayMin = (24 * 60);
	_skipMin = _skipMin % _fullDayMin;
	
	
	if (_skipMin > (_fullDayMin/2)) then {
		_skipMin = -1 * (_fullDayMin - _skipMin);
	};
	if (_skipMin == 0) exitWith {null};
	
	_direction = (_skipMin/(abs(_skipMin)));
	_skipMin = abs(_skipMin);
	
	_i = 0;
	while { _i < _skipMin } do {
		skipTime ((_direction * 1)/60);
		_i = _i + 1;
		if (time_loop_exit) exitWith {null};
	};
};


time_init = {
	ARGV(0,_quiet);
	if (undefined(_quiet)) then {_quiet = false;};
	init_date = null;
	time_loop_exit = false;
	call time_init_globals;
	_game_time_number = call time_game_time_number;
	_new_date = numberToDate [YEAR, _game_time_number];

	if (not(_quiet)) then {
		player groupChat  format["Synchronizing time with server @ %1, %2m day, %3m night", _new_date, time_sunrise_to_sunset_minutes, time_sunset_to_sunrise_minutes];
	};

	setDate _new_date;
};

time_loop = {
	ARGV(0,_init);
	ARGV(1,_quiet);
	if (_init) then {[_quiet] call time_init;};
	
	private ["_i"];
	_i = 0;
	while {true} do {
		[] call time_update;

		sleep 1;
		_i = _i + 1;
		if (time_loop_exit) exitWith {null};
		if (_i > 7200) exitWith { [false] spawn time_loop; };
	};
};


time_move = {
	_this spawn {
		ARGV(0,_offset);
		if (undefined(_offset)) exitWith {null};
		if (typeName _offset != "SCALAR") exitWith {null};
		_offset = _offset * 60 * 60;
		server setVariable ["time_offset", ((server getVariable "time_offset") + _offset), true];

		"if (!isServer || (isServer && !isDedicated)) then { call time_init_globals; };" call broadcast;
	};
};


time_reset = {
	_this spawn {
		ARGV(0,_sunrise);
		ARGV(1,_sunset);
		
		if (undefined(_sunrise)) exitWith {null};
		if (undefined(_sunset)) exitWith {null};
		
		if (typeName _sunrise != "SCALAR") exitWith {null};
		if (typeName _sunset != "SCALAR") exitWith {null};
		
		"if (!isServer || (isServer && !isDedicated)) then { time_loop_exit = true; };" call broadcast;
		sleep 3;
			
		server setVariable ["time_sunrise_to_sunset_minutes", _sunrise, true];
		server setVariable ["time_sunset_to_sunrise_minutes", _sunset, true];
		sleep 3;
		"if (!isServer || (isServer && !isDedicated)) then { [true] spawn time_loop;};" call broadcast;
	};
};

if (!isServer || (isServer && !isDedicated)) then {
	//[false] call time_init;
	[true] spawn time_loop;
};

time_functions_defined = true;
