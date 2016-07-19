#include "constants.h"

class lotto_menu {										
	idd = lotto_menu_dialog_idd;														
	movingEnable = true;								
	controlsBackground[] = {lotto_background};									
	objects[] = { };						

	name = "LOTTO_MENU";
	onUnload = "";
	onLoad="uiNamespace setVariable ['LOTTO_MENU', _this select 0]";
	
	controls[] = {
		lotto_header,
		lotto_background,
		lotto_buy_button,		
		lotto_close_button,
		lotto_ticket_type_field,
		lotto_ticket_type_combo,
		lotto_ticket_price_label,
		lotto_ticket_price_field,
		lotto_ticket_info_label,
		lotto_ticket_info_field,
		lotto_ticket_payout_label,
		lotto_ticket_payout_field
	};																					

	class lotto_header : RscMenuTitle {
		idc = lotto_header_idc;																				
		x = -10; y = -10;
		w = 0.05; h = 0.05;										
		style = ST_CENTER;																								
		SizeEX = 0.03;
		colorBackground[] = GUI_BCG_RGB;
		text = "Lotto";
		moving = 1;
	};															

	class lotto_background : RscBackground {
		idc = lotto_background_idc;
		x = -10; y = -10;
		w = 0.05; h = 0.05;
		moving = 1;
	};

	class lotto_buy_button : RscMenuButton {		
		idc = lotto_buy_button_idc;			
		x = -10; y = -10;
		w = 0.05; h = 0.05;																								
		text = "Buy";											
	};

	class lotto_close_button : RscMenuButton {
		idc = lotto_close_button_idc;
		x = -10; y = -10;
		w = 0.05; h = 0.05;							
		text = "Close";																										
		action = "closedialog 0;";		
	};										


	//ticket type
	class lotto_ticket_type_field : RscText {
		idc = lotto_ticket_type_label_idc;																												
		x = -10; y = -10;
		w = 0.05; h = 0.05;																							
		style = ST_LEFT;												
		text = "Ticket type:";				
	};	

	class lotto_ticket_type_combo : RscCombo {
		idc = lotto_ticket_type_field_idc;														
		x = -10; y = -10;
		w = 0.05; h = 0.05;							
	};									


	//ticket price
	class lotto_ticket_price_label : RscText {
		idc = lotto_ticket_price_label_idc;							
		x = -10; y = -10;
		w = 0.05; h = 0.05;																				
		style = ST_LEFT;						
		text = "Ticket price:";															
	};

	class lotto_ticket_price_field : RscText {
		idc = lotto_ticket_price_field_idc;																											
		x = -10; y = -10;
		w = 0.05; h = 0.05;							
	};		

	//ticket info
	class lotto_ticket_info_label : RscText {
		idc = lotto_ticket_info_label_idc;																												
		x = -10; y = -10;
		w = 0.05; h = 0.05;																							
		style = ST_LEFT;												
		text = "Ticket info";				
	};

	class lotto_ticket_info_field : RscText {
		idc = lotto_ticket_info_field_idc;																								
		x = -10; y = -10;
		w = 0.05; h = 0.05;													
	};
	
	//ticket info
	class lotto_ticket_payout_label : RscText {
		idc = lotto_ticket_payout_label_idc;																												
		x = -10; y = -10;
		w = 0.05; h = 0.05;																							
		style = ST_LEFT;												
		text = "Ticket info";				
	};

	class lotto_ticket_payout_field : RscText {
		idc = lotto_ticket_payout_field_idc;																								
		x = -10; y = -10;
		w = 0.05; h = 0.05;													
	};
};
