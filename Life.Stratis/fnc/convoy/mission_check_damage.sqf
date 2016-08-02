// A_convoy_fnc_mission_check_damage

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"

#define CONVOY_MSG_SPAWN 1
#define CONVOY_MSG_DRIVER_DEAD 2
#define CONVOY_MSG_DAMAGED 3
#define CONVOY_MSG_COMPLETE 4


ARGV(0,_truck);
ARGV(1,_group);

if ((damage _truck) < 0.2) exitWith {null};
if (not([(driver _truck)] call A_player_fnc_exists)) exitWith {null};

private["_velocity", "_direction"];

_velocity = velocity _truck ;
_direction = direction _truck ;		
_speed = 5; 
// speed boost when shots hits vehicle, is a permanent max fullspeed for vehicle, as 5 m/s is 180km/h
_truck setVelocity [
	(_velocity select 0)+((sin _direction) * _speed), 
	(_velocity select 1) + ((cos _direction) * _speed),
	(_velocity select 2)
];
