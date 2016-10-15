#include "..\includes\constants.h"

class voting_menu {										
	idd = voting_menu_menu_dialog_idd;														
	movingEnable = true;								
	controlsBackground[] = {
		voting_menu_background,
		voting_menu_list_background1,
		voting_menu_list_background2
	};
	
	objects[] = { };						

	name = "VOTING_MENU";
	onUnload = "";
	onLoad="uiNamespace setVariable['VOTING_MENU', _this select 0]";
	
	controls[] = {
		voting_menu_header,
		voting_menu_select_button,		
		voting_menu_close_button,
		voting_menu_list,
		voting_menu_current_label,
		voting_menu_current_field,
		voting_menu_timeout_label,
		voting_menu_timeout_field,
		voting_auto_pop_label,
		voting_auto_pop_checkbox
	};															

	class voting_menu_header : RscMenuTitle {
		idc = voting_menu_header_idc;																				
		x = -10; y = -10;
		w = 0.05; h = 0.05;										
		style = ST_CENTER;																								
		SizeEX = 0.03;
		colorBackground[] = GUI_BCG_RGB;
		text = "voting";
		moving = 1;
	};															

	class voting_menu_background : RscBackground {
		idc = voting_menu_background_idc;
		x = -10; y = -10;
		w = 0.05; h = 0.05;
		moving = 1;
	};
	


	class voting_menu_select_button : RscMenuButton {		
		idc = voting_menu_submit_button_idc;			
		x = -10; y = -10;
		w = 0.05; h = 0.05;																								
		text = "Select";											
	};

	class voting_menu_close_button : RscMenuButton {
		idc = voting_menu_close_button_idc;
		x = -10; y = -10;
		w = 0.05; h = 0.05;							
		text = "Close";																										
		action = "closedialog 0;";		
	};										

	class voting_menu_list : RscListNBox {
		idc = voting_menu_list_idc;																												
		x = -10; y = -10;
		w = 0.05; h = 0.50;																																		
	};	
	
	class voting_menu_list_background1 : RscBackground {
		idc = voting_menu_list_background1_idc;
		x = -10; y = -10;
		w = 0.05; h = 0.05;
		moving = 1;
	};
	
	class voting_menu_list_background2 : RscBackground {
		idc = voting_menu_list_background2_idc;
		x = -10; y = -10;
		w = 0.05; h = 0.05;
		moving = 1;
	};
	
	class voting_menu_current_label: RscText {
		idc = voting_menu_current_label_idc;
		x = -10; y = -10;
		w = 0.05; h = 0.05;
	};
	
	class voting_menu_current_field: RscText {
		idc = voting_menu_current_field_idc;
		text = "0";
		x = -10; y = -10;
		w = 0.05; h = 0.05;
	};
	
	class voting_menu_timeout_label: RscText {
		idc = voting_menu_timeout_label_idc;
		x = -10; y = -10;
		w = 0.05; h = 0.05;
	};
	
	class voting_menu_timeout_field: RscText {
		idc = voting_menu_timeout_field_idc;
		text = "0";
		x = -10; y = -10;
		w = 0.05; h = 0.05;
	};
	
	class voting_auto_pop_label: RscText {
		idc = voting_auto_pop_label_idc;
		x = 0.26; y = 0.55;
		w = 0.38; h = 0.04;
		text = "";
	};
	
	class voting_auto_pop_checkbox: RscCheckBox {
		idc = voting_auto_pop_checkbox_idc;
		x = 0.26; y = 0.55;
		w = 0.38; h = 0.04;
	};
};

class voting_nomination_menu {										
	idd = voting_nomination_menu_dialog_idd;														
	movingEnable = true;								
	controlsBackground[] = {voting_nomination_menu_background};									
	objects[] = { };						

	name = "VOTING_NOMINATION_MENU";
	onUnload = "";
	onLoad="uiNamespace setVariable['VOTING_NOMINATION_MENU', _this select 0]";
	
	controls[] = {
		voting_nomination_menu_header,
		voting_nomination_menu_select_button,		
		voting_nomination_menu_close_button,
		voting_nomination_menu_list,
		voting_nomination_menu_option_label,
		voting_nomination_menu_option_field,
		voting_nomination_menu_timeout_label,
		voting_nomination_menu_timeout_field
	};	

	class voting_nomination_menu_header : RscMenuTitle {
		idc = voting_nomination_menu_header_idc;																				
		x = -10; y = -10;
		w = 0.05; h = 0.05;										
		style = ST_CENTER;																								
		SizeEX = 0.03;
		colorBackground[] = GUI_BCG_RGB;
		text = "nomination";
		moving = 1;
	};															

	class voting_nomination_menu_background : RscBackground {
		idc = voting_nomination_menu_background_idc;
		x = -10; y = -10;
		w = 0.05; h = 0.05;
		moving = 1;
	};

	class voting_nomination_menu_select_button : RscMenuButton {		
		idc = voting_nomination_menu_submit_button_idc;			
		x = -10; y = -10;
		w = 0.05; h = 0.05;																								
		text = "Select";											
	};

	class voting_nomination_menu_close_button : RscMenuButton {
		idc = voting_nomination_menu_close_button_idc;
		x = -10; y = -10;
		w = 0.05; h = 0.05;							
		text = "Close";																										
		action = "closedialog 0;";		
	};										

	class voting_nomination_menu_list : RscListBox {
		idc = voting_nomination_menu_list_idc;																												
		x = -10; y = -10;
		w = 0.05; h = 0.50;																																		
	};	
	
	class voting_nomination_menu_option_label: RscText {
		idc = voting_nomination_menu_option_label_idc;
		x = -10; y = -10;
		w = 0.05; h = 0.05;
	};
	
	class voting_nomination_menu_option_field: RscCombo {
		idc = voting_nomination_menu_option_field_idc;
		text="";
		x = -10; y = -10;
		w = 0.05; h = 0.05;
	};
	
	class voting_nomination_menu_timeout_label: RscText {
		idc = voting_nomination_menu_timeout_label_idc;
		x = -10; y = -10;
		w = 0.05; h = 0.05;
	};
	
	class voting_nomination_menu_timeout_field: RscText {
		idc = voting_nomination_menu_timeout_field_idc;
		text="";
		x = -10; y = -10;
		w = 0.05; h = 0.05;
	};
};



