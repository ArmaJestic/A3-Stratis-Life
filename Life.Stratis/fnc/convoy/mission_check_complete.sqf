// A_convoy_fnc_mission_check_complete

#include "..\..\includes\macro.h"

#define Spawn_convoy 1
#define Driver_dead 2
#define Damaged_convoy 3
#define Cop_escort 4


ARGV(0,_truck);
ARGV(1,_group);
ARGV(2,_time);

//the convoy cash has been stolen
if (not(convoy_cash)) exitwith { 
	convoy_complete_side = Civilian;
	true
};

//exit early if the truck is dead
if (not(alive _truck)) exitWith {
	private["_message"];
	_message = format["The goverment convoy truck was destroyed. The money has burned"];
	format['server globalChat toString(%1);', toArray(_message)] call broadcast;
	convoy_complete_side = sideUnknown;
	true
};

//convoy has been running for a while ... lets kill it
if (_time >= 900) exitWith {
	convoy_complete_side = sideUnknown;
	// if there's a cop nearby and the trucks have the payroll until now, so this cop is well protecting truck :]
	{
		private["_unit"];
		_unit = _x;
		if ([_unit] call A_player_fnc_blufor) exitWith {
			convoy_complete_side = west;
		};
	} foreach (nearestObjects [getpos _truck,["Man"], 60]);
	true
};

//convoy has arrived at its destination
if (((driver _truck) distance _destination) < 25) exitWith {  		
	format['[Cop_escort] call A_convoy_fnc_side_msg;'] call broadcast;
	convoy_complete_side = west;
	true
};

false
