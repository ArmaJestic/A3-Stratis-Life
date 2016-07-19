#include "..\includes\constants.h"

class economy_tax_menu {										
	idd = economy_tax_menu_dialog_idd;														
	movingEnable = true;								
	controlsBackground[] = {economy_tax_menu_background};									
	objects[] = { };						

	name = "ECONOMY_TAX_MENU";
	onUnload = "";
	onLoad="uiNamespace setVariable ['ECONOMY_TAX_MENU', _this select 0]";
	
	controls[] = {
		economy_tax_menu_header,
		economy_tax_menu_background,
		economy_tax_menu_submit_button,		
		economy_tax_menu_close_button,
		economy_tax_menu_info_slider,
		economy_tax_menu_info_label,
		economy_tax_menu_info_field
	};																					

	class economy_tax_menu_header : RscMenuTitle {
		idc = economy_tax_menu_header_idc;																				
		x = -10; y = -10;
		w = 0.05; h = 0.05;										
		style = ST_CENTER;																								
		SizeEX = 0.03;
		colorBackground[] = GUI_BCG_RGB;
		text = "Economy";
		moving = 1;
	};															

	class economy_tax_menu_background : RscBackground {
		idc = economy_tax_menu_background_idc;
		x = -10; y = -10;
		w = 0.05; h = 0.05;
		moving = 1;
	};

	class economy_tax_menu_submit_button : RscMenuButton {		
		idc = economy_tax_menu_submit_button_idc;			
		x = -10; y = -10;
		w = 0.05; h = 0.05;																								
		text = "Submit";											
	};

	class economy_tax_menu_close_button : RscMenuButton {
		idc = economy_tax_menu_close_button_idc;
		x = -10; y = -10;
		w = 0.05; h = 0.05;							
		text = "Close";																										
		action = "closedialog 0;";		
	};										

	class economy_tax_menu_info_slider : RscSliderH {
		idc = economy_tax_menu_info_slider_idc;																												
		x = -10; y = -10;
		w = 0.05; h = 0.05;			
	};	

	//info 
	class economy_tax_menu_info_label : RscText {
		idc = economy_tax_menu_info_label_idc;																												
		x = -10; y = -10;
		w = 0.05; h = 0.05;																							
		style = ST_LEFT;												
		text = "Tax bracket:";				
	};

	class economy_tax_menu_info_field : RscText {
		idc = economy_tax_menu_info_field_idc;																								
		x = -10; y = -10;
		w = 0.05; h = 0.05;													
	};
};
