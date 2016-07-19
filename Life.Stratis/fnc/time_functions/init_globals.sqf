// A_time_functions_fnc_init_globals

#include "..\..\includes\macro.h"


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
