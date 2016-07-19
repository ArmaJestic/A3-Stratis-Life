// A_camera_fnc_plane_intersect

#include "..\..\includes\dikcodes.h"
#include "..\..\includes\macro.h"


ARGV(0,_current_target);
if (undefined(_current_target)) exitWith {[]};

private["_offset"];
_offset = [_current_target, "offset", (_current_target modelToWorld [0,0,0])] call A_object_fnc_getVariable;
	
//compute the intersection between the camera's direction vector, and the object's X,Y plane
_camera = [_player, "camera", objNull] call A_object_fnc_getVariable;
if (isNull _camera) exitWith {[]};

private["_vdir", "_pos"];
_vdir = vectorDir _camera;
_pos = _camera modelToWorld [0,0,0];
_vdir = [_vdir, (((_offset select 2) - (_pos select 2)) /(_vdir select 2))] call BIS_fnc_vectorMultiply;
_pos = [_pos, _vdir] call BIS_fnc_vectorAdd;
_pos set [2, (_offset select 2)];
_pos
