#include "..\includes\constants.h"

#define MAIN_MENU_BUTTON(class_name,class_idc) \
	class class_name : RscMenuButton {         \
		idc = class_idc;                       \
		x = 10; y = 10;                        \
		w = 0.05; h = 0.05;                    \
		text = "";                             \
		moving = 1;                            \
	}

class main_menu {
	idd = mainDialog_idd;
	movingEnable = true;
	controlsBackground[] = {};
	objects[] = { };
	controls[] = {
		main_menu_header,
		main_menu_right_button_close,
		main_menu_button_1,
		main_menu_button_2,
		main_menu_button_3,
		main_menu_button_4,
		main_menu_button_5,
		main_menu_button_6,
		main_menu_button_7,
		main_menu_button_8,
		main_menu_button_9,
		main_menu_button_10,
		main_menu_button_11,
		main_menu_button_12,
		main_menu_button_13,
		main_menu_button_14,
		main_menu_button_15,
		main_menu_button_16,
		main_menu_button_17,
		main_menu_button_18,
		main_menu_button_19,
		main_menu_button_20
	};

	name = "MAIN_MENU";
	onUnload = "";
	onLoad="uiNamespace setVariable ['MAIN_MENU', _this select 0]";

	class main_menu_header : RscMenuTitle {
		idc = main_menu_header_idc;
		x = -10; y = -10;
		w = 0.05; h = 0.05;
		text = "";
		moving = 1;
	};
	
	
	MAIN_MENU_BUTTON(main_menu_right_button_close,main_menu_right_button_close_idc);
	MAIN_MENU_BUTTON(main_menu_button_1,main_menu_button_1_idc);
	MAIN_MENU_BUTTON(main_menu_button_2,main_menu_button_2_idc);
	MAIN_MENU_BUTTON(main_menu_button_3,main_menu_button_3_idc);
	MAIN_MENU_BUTTON(main_menu_button_4,main_menu_button_4_idc);
	MAIN_MENU_BUTTON(main_menu_button_5,main_menu_button_5_idc);
	MAIN_MENU_BUTTON(main_menu_button_6,main_menu_button_6_idc);
	MAIN_MENU_BUTTON(main_menu_button_7,main_menu_button_7_idc);
	MAIN_MENU_BUTTON(main_menu_button_8,main_menu_button_8_idc);
	MAIN_MENU_BUTTON(main_menu_button_9,main_menu_button_9_idc);
	MAIN_MENU_BUTTON(main_menu_button_10,main_menu_button_10_idc);
	MAIN_MENU_BUTTON(main_menu_button_11,main_menu_button_11_idc);
	MAIN_MENU_BUTTON(main_menu_button_12,main_menu_button_12_idc);
	MAIN_MENU_BUTTON(main_menu_button_13,main_menu_button_13_idc);
	MAIN_MENU_BUTTON(main_menu_button_14,main_menu_button_14_idc);
	MAIN_MENU_BUTTON(main_menu_button_15,main_menu_button_15_idc);
	MAIN_MENU_BUTTON(main_menu_button_16,main_menu_button_16_idc);
	MAIN_MENU_BUTTON(main_menu_button_17,main_menu_button_17_idc);
	MAIN_MENU_BUTTON(main_menu_button_18,main_menu_button_18_idc);
	MAIN_MENU_BUTTON(main_menu_button_19,main_menu_button_19_idc);
	MAIN_MENU_BUTTON(main_menu_button_20,main_menu_button_20_idc);	
};



class main_menu_right {
	idd = mainDialog_idd;
	movingEnable = true;
	controlsBackground[] = {main_menu_right_background};
	objects[] = { };
	
	controls[] = {
		main_menu_right_header,
		main_menu_right_content,
		main_menu_right_button_close,
	};

	name = "MAIN_MENU_RIGHT";
	onUnload = "";
	onLoad="uiNamespace setVariable ['MAIN_MENU_RIGHT', _this select 0]";

	class main_menu_right_header : RscMenuTitle {
		idc = main_menu_right_header_idc;
		x = -10; y = -10;
		w = 0.05; h = 0.05;
		text = "";
		moving = 1;
	};
	
	class main_menu_right_background : RscBackground {
		idc = main_menu_right_background_idc;
		x = -10; y = -10;
		w = 0.05; h = 0.05;
		moving = 1;
	};
	
	class main_menu_right_content : RscListBox {
		idc = main_menu_right_content_idc;
		moving = 1;
		x = -10; y = -10;
		w = 0.42; h = 0.60;
	};
	
	MAIN_MENU_BUTTON(main_menu_right_button_close,main_menu_right_button_close_idc);	
};
