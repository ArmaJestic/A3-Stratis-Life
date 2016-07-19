// A_convoy_fnc_loop

#include "..\..\includes\macro.h"

#define Spawn_convoy 1
#define Driver_dead 2
#define Damaged_convoy 3
#define Cop_escort 4


format["A_convoy_fnc_loop %1", _this] call A_convoy_fnc_debug;

sleep (convoyrespawntime * 3);
private["_message"];
_message = "There are rumors that a government convoy is leaving in a few minutes.";
format["hint toString(%1);", toArray(_message)] call broadcast;
sleep (convoyrespawntime * 3);

//Gets position to spawn
private["_spawn", "_location"];
_spawn = call A_convoy_fnc_get_spawn;
_location = getPosATL _spawn;

private["_convoy_truck", "_convoy_marker", "_convoy_group"];
_convoy_truck = [_location] call A_convoy_fnc_create_truck;
_convoy_marker = [_location] call A_convoy_fnc_create_marker;
_convoy_group = [_convoy_truck, _location] call A_convoy_fnc_create_units;

format['[Spawn_convoy] call A_convoy_fnc_side_msg;'] call broadcast;

//init convoy globals
convoy_complete = false;
convoy_cash = true;
convoy_complete_side = sideUnknown;
convoy_running_time = 0;
convoy_units_exited = false;

publicVariable "convoy_cash";

//start the convoy loop, and wait for it to complete
[_convoy_truck, _convoy_group, _convoy_marker, copbase1] spawn A_convoy_fnc_mission_loop;	
waitUntil {convoy_complete};

//announce who won the convoy
private["_side_str"];
_side_str = [convoy_complete_side] call A_convoy_fnc_side2string;
_message = format["%1 side won the goverment convoy mission. Next truck leaves in %2 minutes", _side_str, convoyrespawntime];
format['server globalChat toString(%1);', toArray(_message)] call broadcast;

sleep 10;

//cleanup the convoy items
{deleteVehicle _x;} foreach units _convoy_group;
deleteVehicle _convoy_truck; 
deleteGroup _convoy_group;
deleteMarker _convoy_marker;

//waits for respawn
sleep (convoyrespawntime * 54);

[] spawn A_convoy_fnc_loop;
