#include "constants.h"

class animations_menu_dialog {										
	idd = animations_menu_dialog_idd;														
	movingEnable = true;								
	controlsBackground[] = {};			
	
	objects[] = { };						

	name = "ANIMATIONS_MENU";
	onUnload = "";
	onLoad="uiNamespace setVariable ['ANIMATIONS_MENU', _this select 0]";
	
	controls[] = {
		animations_menu_header,
		animations_menu_background,
		animations_menu_list,
		animations_menu_select_button,
		animations_menu_close_button
	};																					

	class animations_menu_header : RscMenuTitle {		
		idc = animations_menu_header_idc;
		x = -10; y = -10;
		w = 0.05; h = 0.05;										
		style = ST_CENTER;																								
		SizeEX = 0.03;
		colorBackground[] = GUI_BCG_RGB;
		text = "Lotto";
		moving = 1;
	};															

	class animations_menu_background : RscBackground {
		idc = animations_menu_background_idc;
		x = -10; y = -10;
		w = 0.05; h = 0.05;
		moving = 1;
	};
	
	class animations_menu_list : RscListBox {
		idc = animations_menu_list_idc;
		x = 0.32-10; y = 0.14-10;
		w = 0.35; h = 0.40;
	};

	class animations_menu_select_button : RscMenuButton {		
		idc = animations_menu_select_button_idc;			
		x = -10; y = -10;																						
		text = "Select";											
	};

	class animations_menu_close_button : RscMenuButton {
		idc = animations_menu_close_button_idc;
		x = -10; y = -10;
		w = 0.05; h = 0.05;							
		text = "Close";																										
		action = "closedialog 0;";		
	};
};
