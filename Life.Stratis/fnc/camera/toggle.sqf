// A_camera_fnc_toggle

#include "..\..\includes\dikcodes.h"
#include "..\..\includes\macro.h"


ARGV(0,_player)
private["_player"];
if (isNil "camera_unit" || {typeName camera_unit != "OBJECT" || {isNull camera_unit}}) then {
	camera_unit = player;
};
_player = camera_unit;

private["_camera"];

_camera = [_player, "camera"] call A_object_fnc_getVariable;
_camera = if (undefined(_camera)) then {objNull} else {_camera};


if (isNull _camera) then {
	camera_unit groupChat format["Enabling camera!"];
	[] call A_camera_fnc_setup_targetMarker;
	[] call A_camera_fnc_setup_mouseMoving;
	[] call A_camera_fnc_setup_keyDown;
	[] call A_camera_fnc_setup_keyUp;
	[] call A_camera_fnc_setup_mouseButtonClick;
	[] call A_camera_fnc_setup_MouseZChanged;
	[] call A_camera_fnc_setup_MouseButtonDown;
	[] call A_camera_fnc_setup_MouseButtonUp;
	[_player] call A_camera_fnc_create;
	
	[] call A_camera_fnc_start_loop;

}else{
	camera_unit groupChat format["Disabling camera!"];
	[] call A_camera_fnc_remove_targetMarker;
	[] call A_camera_fnc_remove_mouseMoving;
	[] call A_camera_fnc_remove_keyDown;
	[] call A_camera_fnc_remove_keyUp;
	[] call A_camera_fnc_remove_mouseButtonClick;
	[] call A_camera_fnc_remove_MouseZChanged;
	[] call A_camera_fnc_remove_MouseButtonDown;
	[] call A_camera_fnc_remove_MouseButtonUp;
	
	[] call A_camera_fnc_stop_loop;
			
	[_player] call A_camera_fnc_destroy;
	
};
