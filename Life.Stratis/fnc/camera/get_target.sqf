// A_camera_fnc_get_target

#include "..\..\includes\dikcodes.h"
#include "..\..\includes\macro.h"


//player groupChat format["A_camera_fnc_get_target %1"];
ARGV(0,_player);

private["_pos1", "_pos2"];
_pos1 = [_player] call A_camera_fnc_get_position;
_pos2 = screenToWorld [(safezoneX + 0.5 * safezoneW), (safezoneY + 0.5 * safezoneH)];
_object_intersect = lineIntersectsWith [ATLtoASL(_pos1), ATLtoASL(_pos2), objNull, objNull, true];

private["_target_marker_pos", "_current_target", "_target_marker"];
_target_marker_pos = _pos2;

_target_marker = ([_player] call A_camera_fnc_get_target_marker);
_target_marker setPos _target_marker_pos;

if (isNil "camera_rabbit" || {typeName camera_rabbit != "OBJECT" || {isNull camera_rabbit}}) exitWith {objNull};
_current_target = cursorTarget;
if (!(isNull(_current_target))) then {
	private["_tracked", "_offset", "_heading", "_damage", "_simulation", "_hidden", "_attached"];
	_tracked = _current_target getVariable ["tracked", false];
	_offset = [_current_target, "offset", []] call A_object_fnc_getVariable;
	_heading = [_current_target, "heading", []] call A_object_fnc_getVariable;
	_reference = (A_camera_var_export_reference_object == _current_target);
	_damage = [_current_target, "damage", false] call A_object_fnc_getVariable;
	_simulation = simulationEnabled _current_target;
	_hidden = [_current_target, "hidden", false] call A_object_fnc_getVariable;
	_attached = [_current_target, "attached", false] call A_object_fnc_getVariable;
	hintSilent format["%1\n(%2)\ntracked: %3\noffset: %4\n heading: %5\nreference: %6\ndamage: %7\nsimulation: %8\nhidden: %9\nattached: %10", 
		_current_target,
		typeOf _current_target,
		_tracked, 
		_offset,
		_heading,
		_reference,
		_damage,
		_simulation,
		_hidden,
		_attached];
}else{
	hintSilent str(_current_target);
};
_current_target
