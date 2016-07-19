// A_interaction_fnc_player_camera

#include "../../includes/macro.h"
#include "../../includes/constants.h"
#include "../../includes/dikcodes.h"

_this spawn {
ARGV(0,_target);
ARGV(1,_watchtime);

private["_tx", "_ty", "_tz", "_tpos"];
_tpos = getPosATL _target;
_tx = _tpos select 0;
_ty = _tpos select 1;
_tz = _tpos select 2;

private["_camera"];
_camera = "camera" camcreate [_tx, _ty, 15];

if (not(createDialog "free_camera")) exitWith {
	player groupChat format["ERROR: could not create civilian camera dialog"];
};


_camera cameraEffect ["internal", "back"];
_camera camSetPos [(getPosATL vehicle _target select 0),(getPosATL vehicle _target select 1), 10];
_camera camSetTarget vehicle _target;
_camera camSetFOV 0.700;
_camera camPreload 5;
_camera camCommit 0;
waitUntil {camCommitted _camera};
_camera camsetpos [_tx, _ty ,10];
_camera camSetTarget vehicle _target;
_camera camSetFOV 0.700;
_camera camCommit 0;

private["_endTime"];
_endTime = time + _watchtime;


buttonSetAction [free_camera_button_nv_on_idc, format["camUseNVG true;"]];
buttonSetAction [free_camera_butotn_nv_off_idc, format["camUseNVG false;"]];
buttonSetAction [free_camera_button_close_idc, format["closeDialog 0;"]];
sliderSetRange [free_camera_slider_zoom_idc, 0, 50];
sliderSetSpeed [free_camera_slider_zoom_idc, 100, 250];
sliderSetPosition [free_camera_slider_zoom_idc, 10];
sliderSetRange [free_camera_slider_light_idc, 0, 200];
sliderSetSpeed [free_camera_slider_light_idc, 0.05, 20];

ctrlShow [free_camera_button_left_idc, false];
ctrlShow [free_camera_button_up_idc, false];
ctrlShow [free_camera_button_down_idc, false];
ctrlShow [free_camera_button_right_idc, false];
ctrlShow [free_camera_button_stop_idc, false];

private["_tx", "_ty", "_tpos", "_td", "_tz", "_dx", "_slider2"];
_dx = -20;
_slider2 = 0;

waitUntil {
	_tpos = getPosATL (vehicle _target);
	_tx = _tpos select 0;
	_ty = _tpos select 1;
	_tz = _tpos select 2;
	_td = getDir (vehicle _target);
	
	_camera camSetTarget [(10 * sin(_td)+ _tx), (10*cos(_td)+_ty), _tz];
	_camera camSetPos [(_tx + _dx * sin(_td)), (_ty + _dx * cos(_td)), (_tz+(round(sliderPosition free_camera_slider_zoom_idc)))];
	_camera camSetFOV 0.700;
	_camera camCommit 0;
	waituntil {camCommitted _camera};
	
	if ((sliderPosition free_camera_slider_light_idc) != _slider2 ) then {
		_slider2 = (sliderPosition free_camera_slider_light_idc);
		if (_slider2 < 600) then {
			setAperture _slider2;
		}
		else{
			setAperture -1;
		};
	};

	(not(ctrlVisible free_camera_button_close_idc) || time > _endTime)
};

setAperture -1;
_camera cameraEffect ["terminate","back"];
titleCut [" ","Black in",1];
camDestroy _camera;
closeDialog 0;
};
