// A_interaction_fnc_simple_camera

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"
#include "..\..\includes\dikcodes.h"

 _this spawn {
ARGV(0,_player);
ARGV(1,_target);

if (not(createDialog "free_camera")) exitWith {
	player groupChat format["ERROR: could not create camera dialog"];
};

private["_camera", "_zoom"];
_camera = "camera" camCreate [(getPosATL _target select 0) + 40, (getPosATL _target select 1), 20];

_zoom  = [10,30];

buttonSetAction [free_camera_button_nv_on_idc, format["camUseNVG true;"] ];
buttonSetAction [free_camera_butotn_nv_off_idc, format["camUseNVG false;"] ];
buttonSetAction [free_camera_button_close_idc, format["closeDialog 0;"] ];
sliderSetRange [free_camera_slider_light_idc, 0, 200];
sliderSetSpeed [free_camera_slider_light_idc, 0.05, 20];


ctrlShow [free_camera_slider_zoom_idc, false];
ctrlShow [free_camera_button_left_idc, false];
ctrlShow [free_camera_button_up_idc, false];
ctrlShow [free_camera_button_down_idc, false];
ctrlShow [free_camera_button_right_idc, false];
ctrlShow [free_camera_button_stop_idc, false];

_camera cameraEffect ["internal", "back"];
_camera camSetPos [(getPosATL _target select 0)+40,(getPosATL _target select 1),20];
_camera camSetTarget _target;
_camera camSetFOV 0.700;
_camera camPreload 5;
_camera camCommit 0;

private["_light_slider"];
_light_slider = 0;
waitUntil {
	if ( (sliderPosition free_camera_slider_light_idc) != _light_slider ) then {
		_light_slider = (sliderPosition free_camera_slider_light_idc);
		if (_light_slider < 600) then {
			setAperture _light_slider;
		}else{
			setAperture -1;
		};
	};
	not(ctrlVisible free_camera_button_close_idc)
};

_camera cameraEffect ["terminate","back"];
titleCut [" ","Black in",1];
camDestroy _camera;
};
