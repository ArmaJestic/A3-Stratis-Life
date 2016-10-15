#include "..\includes\constants.h"

class list_simple_menu {										
	idd = list_simple_menu_menu_dialog_idd;														
	movingEnable = true;								
	controlsBackground[] = {list_simple_menu_background};									
	objects[] = { };						

	name = "LIST_SIMPLE_MENU";
	onUnload = "";
	onLoad="uiNamespace setVariable['LIST_SIMPLE_MENU', _this select 0]";
	
	controls[] = {
		DLG_LIST_SIMPLE_INDEX_HEADER,
		list_simple_menu_select_button,		
		list_simple_menu_close_button,
		DLG_LIST_SIMPLE_INDEX_LIST,
	};															

	class DLG_LIST_SIMPLE_INDEX_HEADER : RscMenuTitle {
		idc = list_simple_menu_header_idc;																				
		x = -10; y = -10;
		w = 0.05; h = 0.05;										
		style = ST_CENTER;																								
		SizeEX = 0.03;
		colorBackground[] = GUI_BCG_RGB;
		text = "list_simple";
		moving = 1;
	};															

	class list_simple_menu_background : RscBackground {
		idc = list_simple_menu_background_idc;
		x = -10; y = -10;
		w = 0.05; h = 0.05;
		moving = 1;
	};

	class list_simple_menu_select_button : RscMenuButton {		
		idc = list_simple_menu_submit_button_idc;			
		x = -10; y = -10;
		w = 0.05; h = 0.05;																								
		text = "Select";											
	};

	class list_simple_menu_close_button : RscMenuButton {
		idc = list_simple_menu_close_button_idc;
		x = -10; y = -10;
		w = 0.05; h = 0.05;							
		text = "Close";																										
		action = "closedialog 0;";		
	};										

	class DLG_LIST_SIMPLE_INDEX_LIST : RscListBox {
		idc = list_simple_menu_list_idc;																												
		x = -10; y = -10;
		w = 0.05; h = 0.50;																																		
	};	
};
