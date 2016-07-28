// A_paint_fnc_preview_zoom



private ["_choice"];
_choice = _this select 0;

switch _choice do {
	case 1:{
		switch P_CamDir do {
			case 1:{
				if (P_CamZoomX > 0.5) Then {P_CamZoomX = P_CamZoomX - 0.5};
			};
			case 2:{
				if (P_CamZoomX < -0.5) Then {P_CamZoomX = P_CamZoomX + 0.5};
			};
			case 3:{
				if (P_CamZoomY < -0.5) Then {P_CamZoomY = P_CamZoomY + 0.5};
			};
			case 4:{
				if (P_CamZoomY > 0.5) Then {P_CamZoomY = P_CamZoomY - 0.5};
			};
		};
	};
	case 2:{
		switch P_CamDir do {
			case 1:{
				if (P_CamZoomX < 10) Then {P_CamZoomX = P_CamZoomX + 0.5};
			};
			case 2:{
				if (P_CamZoomX > -10) Then {P_CamZoomX = P_CamZoomX - 0.5};
			};
			case 3:{
				if (P_CamZoomY > -10) Then {P_CamZoomY = P_CamZoomY - 0.5};
			};
			case 4:{
				if (P_CamZoomY < 10) Then {P_CamZoomY = P_CamZoomY + 0.5};
			};
		};
	};
};
