#include "..\includes\constants.h"

class ticket_menu {										
	idd = ticket_menu_dialog_idd;														
	movingEnable = true;								
	controlsBackground[] = {ticket_menu_background};									
	objects[] = { };						

	name = "TICKET_MENU";
	onUnload = "";
	onLoad="uiNamespace setVariable ['TICKET_MENU', _this select 0]";
	
	controls[] = {
		ticket_menu_header,
		ticket_menu_background,
		ticket_menu_submit_button,		
		ticket_menu_close_button,
		ticket_menu_price_label,
		ticket_menu_price_field,
	};																					

	class ticket_menu_header : RscMenuTitle {
		idc = ticket_menu_header_idc;																				
		x = -10; y = -10;
		w = 0.05; h = 0.05;										
		style = ST_CENTER;																								
		SizeEX = 0.03;
		colorBackground[] = GUI_BCG_RGB;
		text = "Ticket Menu";
		moving = 1;
	};															

	class ticket_menu_background : RscBackground {
		idc = ticket_menu_background_idc;
		x = -10; y = -10;
		w = 0.05; h = 0.05;
		moving = 1;
	};

	class ticket_menu_submit_button : RscMenuButton {		
		idc = ticket_menu_submit_button_idc;			
		x = -10; y = -10;
		w = 0.05; h = 0.05;																								
		text = "Buy";											
	};

	class ticket_menu_close_button : RscMenuButton {
		idc = ticket_menu_close_button_idc;
		x = -10; y = -10;
		w = 0.05; h = 0.05;							
		text = "Close";																										
		A_actions_fnc_action = "closedialog 0;";		
	};										

	//ticket_menu price
	class ticket_menu_price_label : RscText {
		idc = ticket_menu_price_label_idc;							
		x = -10; y = -10;
		w = 0.05; h = 0.05;																				
		style = ST_LEFT;						
		text = "Ticket amount:";															
	};

	class ticket_menu_price_field : RscEdit {
		idc = ticket_menu_price_field_idc;																											
		x = -10; y = -10;
		w = 0.05; h = 0.05;							
	};
};
