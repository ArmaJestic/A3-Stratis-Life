// A_convoy_fnc_loop4

#include "header.h"


params["_convoy_truck","_convoy_group","_convoy_marker","_destination"];

//cleanup the convoy items
{deleteVehicle _x;} foreach units _convoy_group;
deleteVehicle _convoy_truck; 
deleteGroup _convoy_group;
deleteMarker _convoy_marker;

// reset loop
[(RESPAWN_TIME * 54),[],A_convoy_fnc_loop] call A_frame_fnc_wait;