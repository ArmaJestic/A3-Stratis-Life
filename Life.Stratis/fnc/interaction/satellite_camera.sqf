// A_interaction_fnc_satellite_camera

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"

_this spawn {
ARGV(0,_player);
ARGV(1,_position);

private["_camera", "_commit_time"];
_commit_time = 1;
_camera = "camera" camCreate _position;
_camera cameraEffect ["internal", "back"];
_camera camSetFOV 0.700;
_camera camPreload 5;
_camera camCommit 0;
_camera setVectorUp [(sin 0)*(cos -89),-(sin -89),(cos 0)*(cos -89)];
waitUntil {camCommitted _camera};

[_player, "satellite_camera", _camera] call A_object_fnc_setVariable;
[_player, "satellite_camera_commit_time", 1] call A_object_fnc_setVariable;

if (!(createDialog "free_camera")) exitWith {
	player groupChat format["ERROR: could not create satellite camera dialog"];
};

(findDisplay free_camera_dialog_idd) displaySetEventHandler["KeyDown", "_this call  A_interaction_fnc_satellite_camera_keydown_handler"];

buttonSetAction [free_camera_button_left_idc, "[[-100, 0, 0]] call A_interaction_fnc_satellite_camera_move"];
buttonSetAction [free_camera_button_up_idc, "[[0, 100, 0]] call A_interaction_fnc_satellite_camera_move"];
buttonSetAction [free_camera_button_down_idc, "[[0, -100, 0]] call A_interaction_fnc_satellite_camera_move"];
buttonSetAction [free_camera_button_right_idc, "[[100, 0, 0]] call A_interaction_fnc_satellite_camera_move"];
buttonSetAction [free_camera_button_nv_on_idc, "camUseNVG true;"];
buttonSetAction [free_camera_butotn_nv_off_idc, "camUseNVG false;"];
buttonSetAction [free_camera_button_stop_idc, "[[0, 0, 0]] call A_interaction_fnc_satellite_camera_move"];
buttonSetAction [free_camera_button_close_idc, "closeDialog 0;"];
sliderSetRange [free_camera_slider_zoom_idc, 175, 1500];
sliderSetSpeed [free_camera_slider_zoom_idc, 100, 250];
sliderSetRange [free_camera_slider_light_idc, 0, 200];
sliderSetSpeed [free_camera_slider_light_idc, 0.05, 20];

private["_slider1", "_slider2"];
_slider1 = 0;
_slider2 = 0;

waitUntil {
	if ( (round(sliderPosition free_camera_slider_zoom_idc)) != _slider1 ) then {
		_slider1 = (round(sliderPosition free_camera_slider_zoom_idc));
		_camera camsetpos [(getpos _camera select 0), (getpos _camera select 1), _slider1]; 
		_camera camCommit _commit_time;
	};

	if ((sliderPosition free_camera_slider_light_idc) != _slider2 ) then {
		_slider2 = (sliderPosition free_camera_slider_light_idc);
		if (_slider2 < 600) then {
			setAperture _slider2;
		} 
		else {
			setAperture -1;
		};
	};
	
	not(ctrlVisible free_camera_button_close_idc)
};

_camera cameraEffect ["terminate", "back"];
titleCut [" ","Black in", 0];
camDestroy _camera;
};
