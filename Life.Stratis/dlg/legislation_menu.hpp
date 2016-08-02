#include "..\includes\constants.h"

class legislation_menu {										
	idd = legislation_menu_menu_dialog_idd;														
	movingEnable = true;								
	controlsBackground[] = {legislation_menu_background};									
	objects[] = { };						

	name = "LEGISLATION_MENU";
	onUnload = "";
	onLoad="uiNamespace setVariable ['LEGISLATION_MENU', _this select 0]";
	
	controls[] = {
		legislation_menu_header,
		legislation_menu_select_button,		
		legislation_menu_close_button,
		legislation_menu_list,
	};															

	class legislation_menu_header : RscMenuTitle {
		idc = legislation_menu_header_idc;																				
		x = -10; y = -10;
		w = 0.05; h = 0.05;										
		style = ST_CENTER;																								
		SizeEX = 0.03;
		colorBackground[] = GUI_BCG_RGB;
		text = "Legislation";
		moving = 1;
	};															

	class legislation_menu_background : RscBackground {
		idc = legislation_menu_background_idc;
		x = -10; y = -10;
		w = 0.05; h = 0.05;
		moving = 1;
	};

	class legislation_menu_select_button : RscMenuButton {		
		idc = legislation_menu_select_button_idc;			
		x = -10; y = -10;
		w = 0.05; h = 0.05;																								
		text = "Select";											
	};

	class legislation_menu_close_button : RscMenuButton {
		idc = legislation_menu_close_button_idc;
		x = -10; y = -10;
		w = 0.05; h = 0.05;							
		text = "Close";																										
		action = "closedialog 0;";		
	};										

	class legislation_menu_list : RscListBox {
		idc = legislation_menu_list_idc;																												
		x = -10; y = -10;
		w = 0.05; h = 0.50;																																		
	};	
};

class legislation_modify_law_menu {										
	idd = legislation_modify_law_menu_dialog_idd;														
	movingEnable = true;								
	controlsBackground[] = {legislation_modify_law_menu_background};									
	objects[] = { };						

	name = "LEGISLATION_MODIFY_LAW_MENU";
	onUnload = "";
	onLoad="uiNamespace setVariable ['LEGISLATION_MODIFY_LAW_MENU', _this select 0]";
	
	controls[] = {
		legislation_modify_law_menu_header,
		legislation_modify_law_menu_background,
		legislation_modify_law_menu_submit_button,
		legislation_modify_law_menu_close_button,
		legislation_modify_law_menu_field
	};															

	class legislation_modify_law_menu_header : RscMenuTitle {
		idc = legislation_modify_law_menu_header_idc;																				
		x = -10; y = -10;
		w = 0.05; h = 0.05;										
		style = ST_CENTER;																								
		SizeEX = 0.03;
		colorBackground[] = GUI_BCG_RGB;
		text = "Legislation";
		moving = 1;
	};															

	class legislation_modify_law_menu_background : RscBackground {
		idc = legislation_modify_law_menu_background_idc;
		x = -10; y = -10;
		w = 0.05; h = 0.05;
		moving = 1;
	};

	class legislation_modify_law_menu_submit_button : RscMenuButton {		
		idc = legislation_modify_law_menu_submit_button_idc;			
		x = -10; y = -10;
		w = 0.05; h = 0.05;																								
		text = "Submit";											
	};

	class legislation_modify_law_menu_close_button : RscMenuButton {
		idc = legislation_modify_law_menu_close_button_idc;
		x = -10; y = -10;
		w = 0.05; h = 0.05;							
		text = "Close";																										
		action = "closedialog 0;";		
	};										

	class legislation_modify_law_menu_field : RscEditMulti {
		idc = legislation_modify_law_menu_field_idc;																												
		x = -10; y = -10;
		w = 0.18; h = 0.04;
		colorBackground[] = FIELD_BACKGROUND;
		text = "";																																
	};	
};
