 class speed_gun_hud {
	idd = speed_gun_idd;
	movingEnable = 0;
	enableSimulation = 0;
	enableDisplay = 0;
	fadein       = 0;
	duration     = 1e+011;
	fadeout      = 0;
	name         = "speed_gun_hud";
	onLoad       = "uiNamespace setVariable ['speed_gun_hud', _this select 0]";
	objects[]    = {};
	controls[]   = {
		speed_gun_background,
		speed_gun_digit0,
		speed_gun_digit1,
		speed_gun_digit2,
		speed_gun_cursor
	};

	class speed_gun_background: RscPicture {
		idc = speed_gun_background_idc;
		x = -10; y = -10;
		w = 0.1; h = 0.1;
	};
	
	class speed_gun_digit0: RscPicture {
		idc = speed_gun_digit0_idc;
		x = -10; y = -10;
		w = 0.1; h = 0.1;
	};
	
	class speed_gun_digit1: RscPicture {
		idc = speed_gun_digit1_idc;
		x = -10; y = -10;
		w = 0.1; h = 0.1;
	};
	
	class speed_gun_digit2: RscPicture {
		idc = speed_gun_digit2_idc;
		x = -10; y = -10;
		w = 0.1; h = 0.1;
	};
	
	class speed_gun_cursor: RscPictureKeepAspect {
		idc = speed_gun_cursor_idc;
		x = -10; y = -10;
		w = 0.1; h = 0.1;
	};
};
