#include "..\includes\constants.h"

class arrest_menu {										
	idd = arrest_menu_dialog_idd;														
	movingEnable = true;								
	controlsBackground[] = {arrest_menu_background};									
	objects[] = { };						

	name = "ARREST_MENU";
	onUnload = "";
	onLoad="uiNamespace setVariable['ARREST_MENU', _this select 0]";
	
	controls[] = {
		arrest_menu_header,
		arrest_menu_background,
		arrest_menu_submit_button,		
		arrest_menu_close_button,
		arrest_menu_time_slider,
		arrest_menu_time_label,
		arrest_menu_time_field,
		arrest_menu_bail_slider,
		arrest_menu_bail_label,
		arrest_menu_bail_field
	};																					

	class arrest_menu_header : RscMenuTitle {
		idc = arrest_menu_header_idc;																				
		x = -10; y = -10;
		w = 0.05; h = 0.05;										
		style = ST_CENTER;																								
		SizeEX = 0.03;
		colorBackground[] = GUI_BCG_RGB;
		text = "Economy";
		moving = 1;
	};															

	class arrest_menu_background : RscBackground {
		idc = arrest_menu_background_idc;
		x = -10; y = -10;
		w = 0.05; h = 0.05;
		moving = 1;
	};

	class arrest_menu_submit_button : RscMenuButton {		
		idc = arrest_menu_submit_button_idc;			
		x = -10; y = -10;
		w = 0.05; h = 0.05;																								
		text = "Submit";											
	};

	class arrest_menu_close_button : RscMenuButton {
		idc = arrest_menu_close_button_idc;
		x = -10; y = -10;
		w = 0.05; h = 0.05;							
		text = "Close";																										
		action = "closedialog 0;";		
	};										

	class arrest_menu_time_slider : RscSliderH {
		idc = arrest_menu_time_slider_idc;																												
		x = -10; y = -10;
		w = 0.05; h = 0.05;			
	};	

	class arrest_menu_time_label : RscText {
		idc = arrest_menu_time_label_idc;																												
		x = -10; y = -10;
		w = 0.05; h = 0.05;																							
		style = ST_LEFT;												
		text = "Tax bracket:";				
	};

	class arrest_menu_time_field : RscText {
		idc = arrest_menu_time_field_idc;																								
		x = -10; y = -10;
		w = 0.05; h = 0.05;													
	};
	
	
	class arrest_menu_bail_slider : RscSliderH {
		idc = arrest_menu_bail_slider_idc;																												
		x = -10; y = -10;
		w = 0.05; h = 0.05;			
	};	

	class arrest_menu_bail_label : RscText {
		idc = arrest_menu_bail_label_idc;																												
		x = -10; y = -10;
		w = 0.05; h = 0.05;																							
		style = ST_LEFT;												
		text = "Tax bracket:";				
	};

	class arrest_menu_bail_field : RscText {
		idc = arrest_menu_bail_field_idc;																								
		x = -10; y = -10;
		w = 0.05; h = 0.05;													
	};
};
