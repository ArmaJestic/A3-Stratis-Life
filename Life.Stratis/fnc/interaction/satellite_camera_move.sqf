// A_interaction_fnc_satellite_camera_move

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"


ARGV(0,_offset);
private["_camera", "_commit_time"];

_camera = [player, "satellite_camera"] call A_object_fnc_getVariable;
_commit_time = [player, "satellite_camera_commit_time"] call A_object_fnc_getVariable;

private["_position"];
_position = getPos _camera;
_position set [0, ((_position select 0) + (_offset select 0))];
_position set [1, ((_position select 1) + (_offset select 1))];
_position set [2, ((_position select 2) + (_offset select 2))];

_camera camSetPos _position; 
_camera camCommit _commit_time;
