#include "..\includes\constants.h"

class inventory_menu {										
	idd = -1;														
	movingEnable = true;								
	controlsBackground[] = {background};									
	objects[] = { };						

	name = "INVENTORY_MENU";
	onUnload = "";
	onLoad="uiNamespace setVariable ['INVENTORY_MENU', _this select 0]";
	
	controls[] = {
		header, 
		button_use, 
		button_drop, 
		button_cancel, 
		button_give,
		InfoItem, 
		InfoItemVar, 
		InfoAnzahl, 
		InfoAnzahlVar, 
		InfoAddinfo, 
		InfoAddinfoVar, 
		InfoGewicht, 
		InfoGewichtVar,
		UseAmounteingabe, 
		description, 
		playerlist, 
		Itemlist, 
		dummybutton
	};																					

	class header : RscMenuTitle {
		idc = inventory_header_idc;																				
		x = -10; y = -10;
		w = 0.05; h = 0.05;										
		style = ST_CENTER;																								
		SizeEX = 0.03;
		colorBackground[] = GUI_BCG_RGB;
		text = $STRD_inv_description_inventar_header;
		moving = 1;
	};															

	class background : RscBackground {
		idc = inventory_background_idc;
		x = -10; y = -10;
		w = 0.05; h = 0.05;
		moving = 1;
	};

	class button_use : RscMenuButton {		
		idc = inventory_button_use_idc;			
		x = -10; y = -10;
		w = 0.05; h = 0.05;																								
		text = $STRD_inv_description_inventar_use;											
	};

	class button_cancel : RscMenuButton {
		idc = inventory_button_close_idc;
		x = -10; y = -10;
		w = 0.05; h = 0.05;							
		text = $STRD_inv_description_buyitem_close;																										
		A_actions_fnc_action = "closedialog 0;";		
	};										

	class button_drop : RscMenuButton {
		idc = inventory_button_drop_idc;					
		x = -10; y = -10;
		w = 0.05; h = 0.05;																													
		text = $STRD_inv_description_inventar_drop;														
	};												

	class button_give : RscMenuButton {	
		idc = inventory_button_give_idc;																										
		x = -10; y = -10;
		w = 0.05; h = 0.05;													
		text = $STRD_inv_description_inventar_schluessel_uebergabe;				
	};

	class UseAmounteingabe : RscEdit {	
		idc = inventory_textbox_amount_idc;																						
		x = -10; y = -10;
		w = 0.05; h = 0.05;				
		text = "1";					
	};

	class playerlist : RscCombo {	
		idc = inventory_player_list_idc;			
		x = -10; y = -10;
		w = 0.05; h = 0.05;						
	};		

	class InfoItem : RscText {
		idc = inventory_item_info_label_idc;							
		x = -10; y = -10;
		w = 0.05; h = 0.05;																				
		style = ST_LEFT;						
		text = $STRD_inv_description_inventar_item;															
	};

	class InfoItemVar : RscText {
		idc = inventory_item_info_field_idc;																											
		x = -10; y = -10;
		w = 0.05; h = 0.05;							
	};		

	class InfoAnzahl : RscText {
		idc = inventory_item_amount_label_idc;																												
		x = -10; y = -10;
		w = 0.05; h = 0.05;																							
		style = ST_LEFT;												
		text = $STRD_inv_description_inventar_amount;				
	};

	class InfoAnzahlVar : RscText {
		idc = inventory_item_amount_field_idc;																								
		x = -10; y = -10;
		w = 0.05; h = 0.05;													
	};

	class InfoAddinfo : RscText {
		idc = inventory_item_info_add_label;								
		x = -10; y = -10;
		w = 0.05; h = 0.05;																							
		style = ST_LEFT;														
		text = $STRD_inv_description_inventar_addinfo;			
	};

	class InfoAddinfoVar : RscText {
		idc = inventory_item_info_add_field;																													
		x = -10; y = -10;
		w = 0.05; h = 0.05;										
	};													

	class InfoGewicht : RscText {
		idc = inventory_item_info_weight_label_idc;																														
		x = -10; y = -10;
		w = 0.05; h = 0.05;					
		style = ST_LEFT;																								
		text = $STRD_inv_description_inventar_gewicht;															
	};

	class InfoGewichtVar : RscText {																						
		idc = inventory_item_info_weight_field_idc;											
		x = -10; y = -10;
		w = 0.05; h = 0.05;										
	};																			

	class description : RscText {
		idc = inventory_desciption_text_idc;																	
		x = -10; y = -10;
		w = 0.05; h = 0.05;																								
		style = ST_MULTI;																
		lineSpacing = 1;															
	};													

	class Itemlist : RscListbox {
		idc = inventory_items_list_idc;														
		x = -10; y = -10;
		w = 0.05; h = 0.195;
		rowHeight = 0.065;
	};									

	class dummybutton : RscDummy {
		idc = 1001;
	};
};
