#include "constants.h"

class factory_dialog {

	idd = factory_dialog_idd;
	movingEnable = true;
	controlsBackground[] = {
		left_background, left_header,
		right_background, right_frame
		
	};
	
	name = "FACTORY_MENU";
	onUnload = "";
	onLoad="uiNamespace setVariable ['FACTORY_MENU', _this select 0]";
	
	objects[] = { };
	controls[] = {
		items_list, 
		item_produced_label, item_produced_field,
		item_cost_label, item_cost_field,
		amount_label, amount_field,
		enqueue_button,
		create_button, 
		
		dummybutton,
		
		
		queue_list,
		in_production_label, in_production_field,
		in_production_eta_label, in_production_eta_field,
		dequeue_button,
		close_button,
		
		status_background1,
		status_frame1,
		status_field1,
		
		status_background2,
		status_frame2,
		status_field2
	};

	class left_background: Rscbackground {
		idc = factory_left_background_idc;
		moving = 1;
		x = 0.30-10; y = 0.10-10;
		w = 0.39; h = 0.63;
	};
	
	class left_header : RscMenuTitle {
		idc = factory_left_header_idc;
		moving = 1;
		x = 0.30-10; y = 0.10-10;
		w = 0.39; h = 0.63;
		text = "Factory Production";
	};

	class items_list : RscListBox {
		idc = factory_enqueue_list_idc;
		x = 0.32-10; y = 0.14-10;
		w = 0.35; h = 0.30;
		onLBSelChanged = "_this call A_factory_fnc_update_enqueue_item;";
	};

	class item_produced_label : RscText {
		idc = factory_item_produced_label_idc;
		x = 0.32-10; y = 0.47-10;
		w = 0.13; h = 0.04;
		text = "Produced: ";
	};
	
	class item_produced_field: RscText {
		idc = factory_item_produced_field_idc;
		x = 0.49-10; y = 0.47-10;
		w = 0.18; h = 0.04;
		colorBackground[] = FIELD_BACKGROUND;
		text = "0";
	};
	
	class item_cost_label : RscText {
		idc = factory_item_cost_label_idc;
		x = 0.32-10; y = 0.52-10;
		w = 0.13; h = 0.04;
		text = "Production cost: ";
	};
	
	class item_cost_field: RscText {
		idc = factory_item_cost_field_idc;
		x = 0.49-10; y = 0.52-10;
		w = 0.18; h = 0.04;
		colorBackground[] = FIELD_BACKGROUND;
		text = "$0";
	};

	class amount_label : RscText {
		idc = factory_amount_label_idc;
		x = 0.32-10; y = 0.57-10;
		w = 0.13; h = 0.04;
		text = "Amount: ";
	};
	
	class amount_field_background : RscText {
		idc = factory_amount_field_background_idc;
		x = 0.49-10; y = 0.57-10;
		w = 0.18; h = 0.04;
		colorBackground[] = FIELD_BACKGROUND;
	};
	
	class amount_field : RscEdit {
		idc = factory_amount_field_idc;
		x = 0.49-10; y = 0.57-10;
		w = 0.18; h = 0.04;
		onKeyDown = "call A_factory_fnc_update_enqueue_item;";
		text = "1";
	};

	class enqueue_button : RscMenuButton {
		idc = factory_enqueue_button_idc;
		x = 0.32-10; y = 0.62-10;
		w = 0.35; h = 0.04;
		colorBackgroundDisabled[] = DISABLED_BUTTON_BACKGROUND;
		colorDisabled[] = DISABLED_BUTTON_TEXT;
		text = "Produce item";
	};
	
	class create_button : RscMenuButton {
		idc = factory_create_button_idc;
		x = 0.32-10; y = 0.67-10;
		w = 0.35; h = 0.04;
		colorBackgroundDisabled[] = DISABLED_BUTTON_BACKGROUND;
		colorDisabled[] = DISABLED_BUTTON_TEXT;
		text = "Create item";
	};
	
	class right_background: RscBackground {
		idc = factory_right_background_idc;
		moving = 1;
		x = 0.73-10; y = 0.10-10;
		w = 0.39; h = 0.63;
	};
	
	class right_frame : RscMenuTitle {
		idc = factory_right_header_idc;
		moving = 1;
		x = 0.73-10; y = 0.10-10;
		w = 0.39; h = 0.63;
		text = "Factory Production";
	};
	
	
	class queue_list : RscListBox {
		idc = factory_dequeue_list_idc;
		x = 0.75-10; y = 0.14-10;
		w = 0.35; h = 0.30;
		onLBSelChanged = "_this call A_factory_fnc_update_dequeue_item;";
	};


	class in_production_label : RscText {
		idc = factory_in_production_label_idc;
		x = 0.75-10; y = 0.47-10;
		w = 0.13; h = 0.04;
		text = "Production item: ";
	};
	
	class in_production_field : RscText {
		idc = factory_production_field_idc;
		x = 0.92-10; y = 0.47-10;
		w = 0.18; h = 0.04;
		colorBackground[] = FIELD_BACKGROUND;
		text = "(none)";
	};
	
	
	class in_production_eta_label : RscText {
		idc = factory_in_production_eta_label_idc;
		x = 0.75-10; y = 0.52-10;
		w = 0.13; h = 0.04;
		text = "Production time: ";
	};
	
	class in_production_eta_field: RscText {
		idc = factory_production_eta_field_idc;
		x = 0.92-10; y = 0.52-10;
		w = 0.18; h = 0.04;
		colorBackground[] = FIELD_BACKGROUND;
		text = "0";
	};
	
	class dequeue_button : RscMenuButton {
		idc = factory_dequeue_button_idc;
		x = 0.75-10; y = 0.62-10;
		w = 0.35; h = 0.04;
		colorBackgroundDisabled[] = DISABLED_BUTTON_BACKGROUND;
		colorDisabled[] = DISABLED_BUTTON_TEXT;
		text = "Cancel item";
	};
	
		
	class close_button : RscMenuButton {
		idc = factory_close_button_idc;
		x = 0.75-10; y = 0.67-10;
		w = 0.35; h = 0.04;
		colorBackgroundDisabled[] = DISABLED_BUTTON_BACKGROUND;
		colorDisabled[] = DISABLED_BUTTON_TEXT;
		text = "Close";
		action = "closeDialog 0;";
	};
	
	class status_frame1 : RscBackground {
		idc = factory_status_frame1_idc;
		x = 0.30-10; y = 0.75-10;
		w = 0.82; h = 0.04;
	};

	class status_background1: RscBackground {
		idc = factory_status_background1_idc;
		moving = 1;
		x = 0.30-10; y = 0.75-10;
		w = 0.82; h = 0.04;
	};
	
	class status_field1 : RscText {
		idc = factory_status_field1_idc;
		x = 0.30-10; y = 0.75-10;
		w = 0.82; h =  0.04;
		SizeEX=0.024;
		text = "";
	};
	
	class status_frame2 : RscBackground {
		idc = factory_status_frame2_idc;
		x = 0.30-10; y = 0.81-10;
		w = 0.82; h = 0.04;
	};

	class status_background2: RscBackground {
		idc = factory_status_background2_idc;
		moving = 1;
		x = 0.30-10; y = 0.81-10;
		w = 0.82; h = 0.04;
	};
	
	class status_field2 : RscText {
		idc = factory_status_field2_idc;
		x = 0.30-10; y = 0.81-10;
		w = 0.82; h =  0.04;
		SizeEX=0.024;
		text = "";
	};
	
	class dummybutton : RscDummy {idc = 1030;};
};
