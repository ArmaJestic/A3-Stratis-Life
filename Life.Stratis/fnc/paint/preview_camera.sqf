// A_paint_fnc_preview_camera



private ["_choice"];

_choice = _this select 0;
switch _choice do {
	case 1: {
		P_CamOffsetX = 0;
		P_CamOffsetY = 0;
		P_CamZoomX = 3.5;
		P_CamZoomY = 0;
		P_CamDir = 1;
	};
	case 2: {
		P_CamOffsetX = 0;
		P_CamOffsetY = 0;
		P_CamZoomX = -3.5;
		P_CamZoomY = 0;
		P_CamDir = 2;
	};
	case 3: {
		P_CamOffsetX = 0;
		P_CamOffsetY = 0;
		P_CamZoomX = 0;
		P_CamZoomY = -3.5;
		P_CamDir = 3;
	};
	case 4: {
		P_CamOffsetX = 0;
		P_CamOffsetY = 0;
		P_CamZoomX = 0;
		P_CamZoomY = 3.5;
		P_CamDir = 4;
	};
};
