// A_interaction_fnc_vehicle_breakout

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"


ARGV(0,_player);
ARGV(1,_vehicle);
if (!([_player] call A_player_fnc_human)) exitWith {null};
if (!([_vehicle] call A_vehicle_fnc_exists)) exitWith {null};

if (_vehicle == _player) exitWith {null};

breakingout = if (undefined(breakingout)) then {false} else {breakingout};

if (breakingout) exitWith {
	player groupChat "You are already trying to get out";
};

if(speed _vehicle > 30) exitWith {
	player groupChat "The vehicle is moving too fast";
};

if (!((locked _vehicle) == 2) ||
    ([_player] call A_player_fnc_armed) ||
	([_player, _vehicle] call A_vehicle_fnc_owner) ||
	(_vehicle isKindOf "Motorcycle") ||
	(_vehicle isKindOf "ATV_Base_EP1") 
	) exitWith {
	[_player,_vehicle, true] call A_player_fnc_exit_vehicle;
};

breakingout = true;
player groupchat "Wait 10 seconds while you find a way out of this vehicle";	
sleep 10; 
if(speed _vehicle > 30) exitWith {
	player groupchat "The vehicle is moving too fast";
	breakingout = false;
};

if (_vehicle == _player) exitWith {
	breakingout = false;
};

[_player, _vehicle, true] call A_player_fnc_exit_vehicle;
breakingout = false;
