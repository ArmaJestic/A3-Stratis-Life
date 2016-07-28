#include "..\includes\constants.h"

class INV_list
{						
	idd = -1;
	movingEnable = true;
	controlsBackground[] = {DLG_BACK1, background};
	objects[] = { };
	controls[] = {liste, close, dummybutton};
														
	class DLG_BACK1: RscBackground {
		x = 0.21; y = 0.05;																												
		w = 0.52; h = 0.84;									
	};										

	class background : RscBgRahmen {																														
		x = 0.21; y = 0.05;						
		w = 0.52; h = 0.84;						
		text = "List";					
	};						

	class liste : RscListBox {												
		idc = 1;																				
		x = 0.22; y = 0.08;																														
		w = 0.50; h = 0.73;																				
		SizeEX = 0.0195; 																
		RowHeight = 0.03; 			
	};										

	class close : RscButton {						
		idc = 2;																								
		x = 0.39; y = 0.83;										
		w = 0.20; h = 0.04;																										
		text = $STRD_inv_description_buyitem_close;																														
		A_actions_fnc_action = "closedialog 0;";															
	};			

	class dummybutton : RscDummy {idc = 2017;};

};

class INV_ItemListDialog
{													
	idd = -1;														
	movingEnable = true;									
	controlsBackground[] = {DLG_BACK1, background};							
	objects[] = { };											
	controls[] = {Itemlist, InfoText, InfoGewicht, list_needed, button_cancel, dummybutton};									
	
	class DLG_BACK1: Rscbackground {																										
		x = 0.05; y = 0.05;															   
		w = 0.90; h = 0.90;				
	};									
	
	class background : RscBgRahmen {												
		x = 0.05; y = 0.05;													    
		w = 0.90; h = 0.90;																										
		text = "Item Information";												
	};																						
	
	class Itemlist : RscListBox {										
		idc = 1;										
		x = 0.10; y = 0.10;																										
		w = 0.20; h = 0.70;														
	};																								
	
	class InfoText : RscText {										
		idc = 2;																								
		x = 0.35; y = 0.10;		   
		w = 0.55; h = 0.34;												
		style = ST_MULTI;												
		lineSpacing = 1;							
	};																												
	
	class InfoGewicht : RscText {																						
		idc = 3;								
		x = 0.66; y = 0.55;		   
		w = 0.25; h = 0.04;																				
		style = ST_RIGHT;										
	};																		
	
	class list_needed : RscListBox {										
		idc = 4;										
		x = 0.35; y = 0.45;																						
		w = 0.30; h = 0.35;						
	};																	
	
	class button_cancel : RscButton {																
		x = 0.40; y = 0.90;								
		w = 0.20; h = 0.04;														
		idc = 5;																						
		A_actions_fnc_action = "closedialog 0;";			
	};						
	
	class dummybutton : RscDummy {idc = 1038;};
};
