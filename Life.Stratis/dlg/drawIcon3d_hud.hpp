class drawIcon3d_hud {
	idd = drawIcon3d_idd;
	movingEnable = 0;
	enableSimulation = 0;
	enableDisplay = 0;
	fadein       = 0;
	duration     = 1e+011;
	fadeout      = 0;
	name         = "drawIcon3d_hud";
	onLoad       = "uiNamespace setVariable['drawIcon3d_hud', _this select 0]";
	objects[]    = {};
	controls[]   = {drawIcon3d_hud_text};

	class drawIcon3d_hud_text {
		idc = drawIcon3d_text_idc;
		type = CT_STRUCTURED_TEXT;
		style = ST_CENTER;
		colorBackground[] = { 0, 0, 0, 0 };
		x = -10; y = -10;
		w = 0.1; h = 0.1;
		size = 0.022;
		text = "";
	};
};