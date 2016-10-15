// A_camera_fnc_set_heading

#include "..\..\includes\dikcodes.h"
#include "..\..\includes\macro.h"


ARGV(0,_player);
ARGV(1,_heading);

private["_camera"];
_camera = [_player, "camera"] call A_object_fnc_getVariable;
if (UNDEFINED(_camera)) exitWith {null};

//player groupChat format["_heading_before = %1", _heading];	
[_player, _heading] call A_camera_fnc_save_heading;
_heading = [_player] call A_camera_fnc_get_heading;

//player groupChat format["_heading_last = %1", _heading];
private["_vectors"];
_vectors = [_heading] call A_camera_fnc_heading2vectors;
_camera setVectorDirAndUp _vectors;

if (UNDEFINED(camera_rabbit)) exitWith {};
camera_rabbit attachTo [_camera, [0,0,0]];
