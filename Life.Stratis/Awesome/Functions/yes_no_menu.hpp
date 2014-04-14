#include "constants.h"

class yes_no_menu {										
	idd = yes_no_menu_menu_dialog_idd;														
	movingEnable = true;								
	controlsBackground[] = {yes_no_menu_background};									
	objects[] = { };						

	name = "YES_NO_MENU";
	onUnload = "";
	onLoad="uiNamespace setVariable ['YES_NO_MENU', _this select 0]";
	
	controls[] = {
		yes_no_menu_header,
		yes_no_menu_yes_button,		
		yes_no_menu_no_button,
		yes_no_menu_label,
	};															

	class yes_no_menu_header : RscMenuTitle {
		idc = yes_no_menu_header_idc;																				
		x = -10; y = -10;
		w = 0.05; h = 0.05;										
		style = ST_CENTER;																								
		SizeEX = 0.03;
		colorBackground[] = GUI_BCG_RGB;
		text = "yes_no";
		moving = 1;
	};															

	class yes_no_menu_background : RscBackground {
		idc = yes_no_menu_background_idc;
		x = -10; y = -10;
		w = 0.05; h = 0.05;
		moving = 1;
	};

	class yes_no_menu_yes_button : RscMenuButton {		
		idc = yes_no_menu_yes_button_idc;			
		x = -10; y = -10;
		w = 0.05; h = 0.05;																								
		text = "Yes";											
	};

	class yes_no_menu_no_button : RscMenuButton {
		idc = yes_no_menu_no_button_idc;
		x = -10; y = -10;
		w = 0.05; h = 0.05;							
		text = "No";																										
		action = "closedialog 0;";		
	};										

	class yes_no_menu_label : RscText {
		idc = yes_no_menu_label_idc;																												
		x = -10; y = -10;
		w = 0.05; h = 0.50;	
		style = ST_MULTI;																
		lineSpacing = 1;			
	};	
};