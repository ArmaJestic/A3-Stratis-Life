// A_convoy_fnc_create_marker

#include "..\..\includes\macro.h"

#define Spawn_convoy 1
#define Driver_dead 2
#define Damaged_convoy 3
#define Cop_escort 4


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
