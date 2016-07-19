#include "constants.h"

class mobile_menu {										
	idd = mobile_menu_dialog_idd;														
	movingEnable = true;								
	controlsBackground[] = {mobile_background};									
	objects[] = { };						

	name = "MOBILE_MENU";
	onUnload = "";
	onLoad="uiNamespace setVariable ['MOBILE_MENU', _this select 0]";
	
	controls[] = {
		mobile_header,
		mobile_background,
		mobile_text_button,		
		mobile_close_button,
		mobile_players_label,
		mobile_players_field,
		mobile_characters_label,
		mobile_characters_field,
		mobile_text_price_label,
		mobile_text_price_field,
		mobile_menu_text_field,
		mobile_menu_overflow_field
	};																					

	class mobile_header : RscMenuTitle {
		idc = mobile_header_idc;																				
		x = -10; y = -10;
		w = 0.05; h = 0.05;										
		style = ST_CENTER;																								
		SizeEX = 0.03;
		colorBackground[] = GUI_BCG_RGB;
		text = "Mobile";
		moving = 1;
	};															

	class mobile_background : RscBackground {
		idc = mobile_background_idc;
		x = -10; y = -10;
		w = 0.05; h = 0.05;
		moving = 1;
	};

	class mobile_text_button : RscMenuButton {		
		idc = mobile_text_button_idc;			
		x = -10; y = -10;
		w = 0.05; h = 0.05;																								
		text = "Text";											
	};


	class mobile_close_button : RscMenuButton {
		idc = mobile_close_button_idc;
		x = -10; y = -10;
		w = 0.05; h = 0.05;							
		text = "Close";																										
		action = "closedialog 0;";		
	};										

	class mobile_menu_text_field : RscEditMulti {
		idc = mobile_menu_text_field_idc;																												
		x = -10; y = -10;
		w = 0.18; h = 0.04;
		colorBackground[] = FIELD_BACKGROUND;
		text = "";																														
	};
	
	class mobile_menu_overflow_field : RscEditMulti {
		idc = mobile_menu_overflow_field_idc;																												
		x = -10; y = -10;
		w = 0.18; h = 0.04;
		colorBackground[] = FIELD_BACKGROUND;
		text = "";																														
	};
	
	class mobile_players_label : RscText {
		idc = mobile_players_label_idc;																												
		x = -10; y = -10;
		w = 0.05; h = 0.05;																							
		style = ST_LEFT;												
		text = "Players:";				
	};	

	class mobile_players_field : RscCombo {
		idc = mobile_players_field_idc;														
		x = -10; y = -10;
		w = 0.05; h = 0.05;							
	};
	
	
	class mobile_characters_label : RscText {
		idc = mobile_characters_label_idc;																												
		x = -10; y = -10;
		w = 0.05; h = 0.05;																							
		style = ST_LEFT;												
		text = "Players:";				
	};	

	class mobile_characters_field : RscText {
		idc = mobile_characters_field_idc;														
		x = -10; y = -10;
		w = 0.05; h = 0.05;							
	};

	//ticket price
	class mobile_text_price_label : RscText {
		idc = mobile_text_price_label_idc;							
		x = -10; y = -10;
		w = 0.05; h = 0.05;																				
		style = ST_LEFT;						
		text = "Text price:";															
	};

	class mobile_text_price_field : RscText {
		idc = mobile_text_price_field_idc;																											
		x = -10; y = -10;
		w = 0.05; h = 0.05;							
	};		
};
