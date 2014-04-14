#include "constants.h"

class prison_menu {
	idd = prison_menu_idd;														
	movingEnable = true;								
	controlsBackground[] = {prison_menu_background};									
	objects[] = { };						

	name = "PRISON_MENU";
	onUnload = "";
	onLoad="uiNamespace setVariable ['PRISON_MENU', _this select 0]";
	
	controls[] = {
		prison_menu_header,
		prison_menu_close_button,
		prison_menu_pay_button,
		prison_bail_amount_label,
		prison_bail_amount_field
	};
	
	class prison_menu_header : RscMenuTitle {
		idc = prison_menu_header_idc;																				
		x = -10; y = -10;
		w = 0.05; h = 0.05;										
		style = ST_CENTER;																								
		SizeEX = 0.03;
		colorBackground[] = GUI_BCG_RGB;
		text = "";
		moving = 1;
	};															

	class prison_menu_background : RscBackground {
		idc = prison_menu_background_idc;
		x = -10; y = -10;
		w = 0.05; h = 0.05;
		moving = 1;
	};

	class prison_menu_pay_button : RscMenuButton {		
		idc = prison_menu_pay_button_idc;			
		x = -10; y = -10;
		w = 0.05; h = 0.05;																								
		text = "Pay";											
	};

	class prison_menu_close_button : RscMenuButton {
		idc = prison_menu_close_button_idc;
		x = -10; y = -10;
		w = 0.05; h = 0.05;							
		text = "Close";																										
		action = "closedialog 0;";		
	};										

	//bail amount
	class prison_bail_amount_label : RscText {
		idc = prison_menu_bail_label_idc;																												
		x = -10; y = -10;
		w = 0.05; h = 0.05;																							
		style = ST_LEFT;												
		text = "Bail Amount:";				
	};	

	class prison_bail_amount_field : RscEdit {
		idc = prison_menu_bail_field_idc;														
		x = -10; y = -10;
		w = 0.05; h = 0.05;							
	};
};