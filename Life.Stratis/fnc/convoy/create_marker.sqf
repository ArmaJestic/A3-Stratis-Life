// A_convoy_fnc_create_marker

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"

#define CONVOY_MSG_SPAWN 1
#define CONVOY_MSG_DRIVER_DEAD 2
#define CONVOY_MSG_DAMAGED 3
#define CONVOY_MSG_COMPLETE 4


ARGV(0,_location);

// spawn markers truck and soldiers
private["_marker", "_name"];
_name = "convoy";
_marker = createMarker [_name, [0,0]];																				
_marker setMarkerShape "ICON";								
_marker setMarkerType "mil_dot";										
_marker setMarkerColor "ColorRed";																														
_marker setMarkerText "Government Convoy";
_marker setMarkerPos [(_location select 0), (_location select 1)];
_marker
