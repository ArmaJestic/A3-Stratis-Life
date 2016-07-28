#include "..\includes\constants.h"

class storage_menu {

	idd = storage_menu_dialog_idd;
	movingEnable = true;
	
	name = "STORAGE_MENU";
	onLoad="uiNamespace setVariable ['STORAGE_MENU', _this select 0]";
	onUnload = "call A_trunk_fnc_close;";
	
	controlsBackground[] = {
		storage_menu_left_header, 
		storage_menu_left_background,
		storage_menu_right_header, 
		storage_menu_right_background
	};
	
	objects[] = { };
	controls[] = {
		storage_menu_left_list,
		storage_menu_right_list,
		storage_menu_take_button,
		storage_menu_put_button,
		storage_menu_close_button,
		storage_menu_left_amount_label,
		storage_menu_left_amount_field,
		storage_menu_left_weight_label,
		storage_menu_left_weight_field,
		storage_menu_right_amount_label,
		storage_menu_right_amount_field,
		storage_menu_right_weight_label,
		storage_menu_right_weight_field,
		storage_menu_left_total_weight_label,
		storage_menu_left_total_weight_field,
		storage_menu_right_total_weight_label,
		storage_menu_right_total_weight_field
	};


	
	class storage_menu_left_header : RscMenuTitle {
		idc = storage_menu_left_header_idc;
		moving = 1;
		x = 0.30-10; y = 0.10-10;
		w = 0.39; h = 0.63;
		text = "";
	};
	
	class storage_menu_right_header : RscMenuTitle {
		idc = storage_menu_right_header_idc;
		moving = 1;
		x = 0.30-10; y = 0.10-10;
		w = 0.39; h = 0.63;
		text = "";
	};
	
	
	class storage_menu_left_background: Rscbackground {
		idc = storage_menu_left_background_idc;
		moving = 1;
		x = 0.30-10; y = 0.10-10;
		w = 0.39; h = 0.63;
	};
	
	class storage_menu_right_background: Rscbackground {
		idc = storage_menu_right_background_idc;
		moving = 1;
		x = 0.30-10; y = 0.10-10;
		w = 0.39; h = 0.63;
	};
	
	class storage_menu_left_list : RscListBox {
		idc = storage_menu_left_list_idc;
		x = 0.32-10; y = 0.14-10;
		w = 0.35; h = 0.3601;
		onLBSelChanged = "";
		rowHeight = 0.065;
	};
	
	class storage_menu_right_list : RscListBox {
		idc = storage_menu_right_list_idc;
		x = 0.32-10; y = 0.14-10;
		w = 0.35; h = 0.3601;
		onLBSelChanged = "";
		rowHeight = 0.065;
	};	
	
	class storage_menu_left_amount_label : RscText {
		idc = storage_menu_left_amount_label_idc;
		x = 0.32-10; y = 0.47-10;
		w = 0.13; h = 0.04;
		text = "Produced: ";
	};
	
	class storage_menu_left_amount_field: RscEdit {
		idc = storage_menu_left_amount_field_idc;
		x = 0.49-10; y = 0.47-10;
		w = 0.18; h = 0.04;
		colorBackground[] = FIELD_BACKGROUND;
		text = "0";
	};
	
		
	class storage_menu_left_weight_label : RscText {
		idc = storage_menu_left_weight_label_idc;
		x = 0.32-10; y = 0.47-10;
		w = 0.13; h = 0.04;
		text = "Produced: ";
	};
	
	class storage_menu_left_weight_field: RscText {
		idc = storage_menu_left_weight_field_idc;
		x = 0.49-10; y = 0.47-10;
		w = 0.18; h = 0.04;
		colorBackground[] = FIELD_BACKGROUND;
		text = "0";
	};	
	
	class storage_menu_right_amount_label : RscText {
		idc = storage_menu_right_amount_label_idc;
		x = 0.32-10; y = 0.47-10;
		w = 0.13; h = 0.04;
		text = "Produced: ";
	};
	
	class storage_menu_right_amount_field: RscEdit {
		idc = storage_menu_right_amount_field_idc;
		x = 0.49-10; y = 0.47-10;
		w = 0.18; h = 0.04;
		colorBackground[] = FIELD_BACKGROUND;
		text = "0";
	};		
	
	class storage_menu_right_weight_label : RscText {
		idc = storage_menu_right_weight_label_idc;
		x = 0.32-10; y = 0.47-10;
		w = 0.13; h = 0.04;
		text = "Produced: ";
	};
	
	class storage_menu_right_weight_field: RscText {
		idc = storage_menu_right_weight_field_idc;
		x = 0.49-10; y = 0.47-10;
		w = 0.18; h = 0.04;
		colorBackground[] = FIELD_BACKGROUND;
		text = "0";
	};		
	
	class storage_menu_left_total_weight_label : RscText {
		idc = storage_menu_left_total_weight_label_idc;
		x = 0.32-10; y = 0.47-10;
		w = 0.13; h = 0.04;
		text = "Produced: ";
	};
	
	class storage_menu_left_total_weight_field: RscText {
		idc = storage_menu_left_total_weight_field_idc;
		x = 0.49-10; y = 0.47-10;
		w = 0.18; h = 0.04;
		colorBackground[] = FIELD_BACKGROUND;
		text = "0";
	};		

	class storage_menu_right_total_weight_label : RscText {
		idc = storage_menu_right_total_weight_label_idc;
		x = 0.32-10; y = 0.47-10;
		w = 0.13; h = 0.04;
		text = "Produced: ";
	};
	
	class storage_menu_right_total_weight_field: RscText {
		idc = storage_menu_right_total_weight_field_idc;
		x = 0.49-10; y = 0.47-10;
		w = 0.18; h = 0.04;
		colorBackground[] = FIELD_BACKGROUND;
		text = "0";
	};			
	
	class storage_menu_take_button : RscMenuButton {
		idc = storage_menu_take_button_idc;
		x = 0.32-10; y = 0.62-10;
		w = 0.35; h = 0.04;
		colorBackgroundDisabled[] = DISABLED_BUTTON_BACKGROUND;
		colorDisabled[] = DISABLED_BUTTON_TEXT;
		text = "";
	};
	
	class storage_menu_put_button : RscMenuButton {
		idc = storage_menu_put_button_idc;
		x = 0.32-10; y = 0.67-10;
		w = 0.35; h = 0.04;
		colorBackgroundDisabled[] = DISABLED_BUTTON_BACKGROUND;
		colorDisabled[] = DISABLED_BUTTON_TEXT;
		text = "Create item";
	};
	
	class storage_menu_close_button : RscMenuButton {
		idc = storage_menu_close_button_idc;
		x = 0.32-10; y = 0.67-10;
		w = 0.35; h = 0.04;
		colorBackgroundDisabled[] = DISABLED_BUTTON_BACKGROUND;
		colorDisabled[] = DISABLED_BUTTON_TEXT;
		text = "Close";
		A_actions_fnc_action = "closeDialog 0;";
	};	
};
