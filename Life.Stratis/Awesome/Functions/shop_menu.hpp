#include "constants.h"

class shops_menu {
	idd = shop_dialog_idd;
	movingEnable = true;
	controlsBackground[] = {buy_background, sell_background, buy_frame, sell_frame};
	objects[] = { };
		
	name = "SHOPS_MENU";
	onUnload = "call trunk_close;";
	onLoad="uiNamespace setVariable ['SHOPS_MENU', _this select 0]";
	
	controls[] = {  
					sell_show_all_items_label, sell_show_all_items_cbox,
					put_gear_label, buy_put_gear_cbox,
					
					
					sell_items_list, 
					sell_button, sell_button_cancel,
					sell_demand_label, sell_demand_field,
					sell_items_to_sell_label, sell_items_to_sell_field, sell_items_to_sell_background,
					sell_market_adjust_label, sell_market_ajust_field,
					sell_sales_tax_label, sell_sales_tax_field,
					sell_total_return_label, sell_total_return_field,
					
					buy_items_list,
					buy_button, buy_button_cancel,
					buy_supply_label, buy_supply_field,
					buy_items_to_buy_label, buy_items_to_buy_field, buy_tiems_to_buy_field_background,
					buy_market_adjust_label, buy_marked_adjust_field,
					buy_sales_tax_label, buy_salex_tax_field,
					buy_total_due_label, buy_total_due_field,
					
					buy_sell_status_background, buy_sell_status_frame, buy_sell_status_label 
					
					};

	class buy_items_list : RscListBox {
		idc = buy_items_list_idc;
		moving = 1;
		x = 0.93-10; y = -0.10-10;
		w = 0.42; h = 0.4037;
		rowHeight = 0.065;
		onLBSelChanged = "_this call shop_update_buy_item;";
	};
	
	class buy_items_to_buy_label : RscText {
		idc = buy_items_to_buy_label_idc;
		x = 0.44-10; y = 0.40-10;
		w = 0.20; h = 0.04;
		SizeEX=0.026;
		text = "Items to buy: ";
	};
	
	class buy_items_to_buy_field : RscEdit {
		idc = buy_items_to_buy_field_idc;
		x = 0.65-10; y = 0.40-10;
		w = 0.2105; h = 0.04;
		text = "1";
		onKeyUp = "_this call shop_update_buy_item;";
	};
	
	class buy_tiems_to_buy_field_background : RscText {
		idc = buy_tiems_to_buy_field_background_idc;
		x = 0.65-10; y = 0.40-10;
		w = 0.2105; h = 0.04;
		colorBackground[] = BOX_BACKGROUND;
	};
	
	class buy_supply_label : RscText {
		idc = buy_supply_label_idc;
		x = 0.44-10; y = 0.45-10;
		w = 0.20; h = 0.04;
		SizeEX=0.026;
		text = "Supply:";
	};
	
	class buy_supply_field : RscText {
		idc = buy_supply_field_idc;
		x = 0.65-10; y = 0.45-10;
		w = 0.2105; h = 0.04;
		colorBackground[] = BOX_BACKGROUND;
		text = "0";
	};
	
	class buy_market_adjust_label : RscText {
		idc = buy_market_adjust_label_idc;
		x = 0.44-10; y = 0.50-10;
		w = 0.20; h = 0.04;
		SizeEX=0.026;
		text = "Market adjustment:";
	};
	
	class buy_marked_adjust_field : RscText {
		idc = buy_marked_adjust_field_idc;
		x = 0.65-10; y = 0.50-10;
		w = 0.2105; h = 0.04;
		colorBackground[] = BOX_BACKGROUND;
		text = "$0";
	};
	
	class buy_sales_tax_label : RscText {
		idc = buy_sales_tax_label_idc;
		x = 0.44-10; y = 0.55-10;
		w = 0.20; h = 0.04;
		SizeEX=0.026;
		text = "Sales tax:";
	};
	
	class buy_salex_tax_field : RscText {
		idc = buy_salex_tax_field_idc;
		x = 0.65-10; y = 0.55-10;
		w = 0.2105; h = 0.04;
		colorBackground[] = BOX_BACKGROUND;
		text = "$0";
	};
	
	class buy_total_due_label : RscText {
		idc = buy_total_due_label_idc;
		x = 0.44-10; y = 0.60-10;
		w = 0.20; h = 0.04;
		SizeEX=0.026;
		text = "Total due:";
	};
	
	class buy_total_due_field : RscText {
		idc = buy_total_due_field_idc;
		x = 0.65-10; y = 0.60-10;
		w = 0.2105; h = 0.04;
		colorBackground[] = BOX_BACKGROUND;
		text = "$0";
	};
	
	class put_gear_label : RscText {
		idc = buy_put_gear_label_idc;
		x = 0.44-10; y = 0.65-10;
		w = 0.30; h = 0.04;
		SizeEX=0.026;
	};
	
	class buy_put_gear_cbox: RscCheckBox {
		idc = buy_put_gear_cbox_idc;
		x = 0.44-10; y = 0.65-10;
		w = 0.30-10; h = 0.04-10;
		onCheckBoxesSelChanged = "call shop_toggle_put_gear_cb; call shop_update_buy_item;";
	};

	class buy_frame : RscMenuTitle {
		idc = buy_frame_idc;
		x = 0.42-10; y = -0.13-10;
		w = 0.46; h = 0.90;
		text = "Buy Items";
		moving = 1;
	};
	
	class buy_background: RscBackground {
		idc = buy_background_idc;
		moving = 1;
		x = 0.42-10; y = -0.13-10;
		w = 0.46; h = 0.90;
	};
	
	class buy_button : RscMenuButton {
		idc = buy_button_idc;
		x = 0.44-10; y = 0.70-10;
		w = 0.20; h = 0.04;
		text = "Buy";
		colorBackgroundDisabled[] = DISABLED_BUTTON_BACKGROUND;
		colorDisabled[] = DISABLED_BUTTON_TEXT;
	};

	class buy_button_cancel : RscMenuButton {
		idc = buy_button_cancel_idc;
		x = 0.6605-10; y = 0.70-10;
		w = 0.20; h = 0.04;
		text = "Cancel";
		action = "closedialog 0";
	};
	
	class sell_items_list : RscListBox 	{
		idc = sell_items_list_idc;
		moving = 1;
		x = 0.93-10; y = -0.10-10;
		w = 0.42; h = 0.4037;
		rowHeight = 0.065;
		onLBSelChanged = "_this call shop_update_sell_item;";
	};
	
	class sell_items_to_sell_label : RscText {
		idc = sell_items_to_sell_label_idc;
		x = 0.93-10; y = 0.40-10;
		w = 0.20; h = 0.04;
		SizeEX=0.026;
		text = "Items to sell: ";
	};
	
	class sell_items_to_sell_field : RscEdit {
		idc = sell_items_to_sell_field_idc;
		x = 1.14-10; y = 0.40-10;
		w = 0.2105; h = 0.04;
		text = "1";
		onKeyUp = "_this call shop_update_sell_item;";
	};
	
	class sell_items_to_sell_background : RscText {
		idc = sell_items_to_sell_background_idc;
		x = 1.14-10; y = 0.40-10;
		w = 0.2105; h = 0.04;
		colorBackground[] = BOX_BACKGROUND;
	};
	
	class sell_demand_label : RscText {
		idc = sell_demand_label_idc;
		x = 0.93-10; y = 0.45-10;
		w = 0.20; h = 0.04;
		SizeEX=0.026;
		text = "Demand:";
	};
	
	class sell_demand_field : RscText {
		idc = sell_demand_field_idc;
		x = 1.14-10; y = 0.45-10;
		w = 0.2105; h = 0.04;
		colorBackground[] = BOX_BACKGROUND;
		text = "0";
	};
	
	
	
	class sell_market_adjust_label : RscText {
		idc = sell_market_adjust_label_idc;
		x = 0.93-10; y = 0.50-10;
		w = 0.20; h = 0.04;
		SizeEX=0.026;
		text = "Market adjustment:";
	};
	
	class sell_market_ajust_field : RscText {
		idc = sell_market_ajust_field_idc;
		x = 1.14-10; y = 0.50-10;
		w = 0.2105; h = 0.04;
		colorBackground[] = BOX_BACKGROUND;
		text = "$0";
	};
	
	class sell_sales_tax_label : RscText {
		idc = sell_sales_tax_label_idc;
		x = 0.93-10; y = 0.55-10;
		w = 0.20; h = 0.04;
		SizeEX=0.026;
		text = "Sales tax:";
	};
	
	class sell_sales_tax_field : RscText {
		idc = sell_sales_tax_field_idc;
		x = 1.14-10; y = 0.55-10;
		w = 0.2105; h = 0.04;
		colorBackground[] = BOX_BACKGROUND;
		text = "$0";
	};
	
	class sell_total_return_label : RscText {
		idc = sell_total_return_label_idc;
		x = 0.93-10; y = 0.60-10;
		w = 0.20; h = 0.04;
		SizeEX=0.026;
		text = "Total return:";
	};
	
	class sell_show_all_items_label : RscText {
		idc = sell_show_all_items_label_idc;
		x = 0.93-10; y = 0.65-10;
		w = 0.30; h = 0.04;
		SizeEX=0.026;
	};
	
	class sell_show_all_items_cbox: RscCheckBox {
		idc = sell_show_all_items_cbox_idc;
		x = 0.93-10; y = 0.65-10;
		w = 0.30; h = 0.04;
		onCheckBoxesSelChanged = "call shop_toggle_sell_cb; [] spawn shop_update_sell_list;";
	};
	
	class sell_total_return_field : RscText {
		idc = sell_total_return_field_idc;
		x = 1.14-10; y = 0.60-10;
		w = 0.2105; h = 0.04;
		colorBackground[] = BOX_BACKGROUND;
		text = "$0";
	};
	
	class sell_frame : RscMenuTitle {
		idc = sell_frame_idc;
		x = 0.91-10; y = -0.13-10;
		w = 0.46; h = 0.90;
		text = "Sell Items";
		moving = 1;
	};
	
	class sell_background: RscBackground {
		idc = sell_background_idc;
		moving = 1;
		x = 0.91-10; y = -0.13-10;
		w = 0.46; h = 0.90;
	};

	
	class sell_button : RscMenuButton {
		idc = sell_button_idc;
		x = 0.93-10; y = 0.70-10;
		w = 0.20; h = 0.04;
		text = "Sell";
		colorBackgroundDisabled[] = DISABLED_BUTTON_BACKGROUND;
		colorDisabled[] = DISABLED_BUTTON_TEXT;
	};

	class sell_button_cancel : RscMenuButton {
		idc = sell_button_cancel_idc;
		x = 1.1505-10; y = 0.70-10;
		w = 0.20; h = 0.04;
		text = "Cancel";
		action = "closedialog 0;";
	};
	
	class buy_sell_status_label : RscText {
		idc = buy_sell_status_label_idc;
		x = 0.42-10; y = 0.80-10;
		w = 0.949; h =  0.05;
		SizeEX=0.024;
		text = "";
	};

	class buy_sell_status_frame : RscBackground {
		idc = buy_sell_status_frame_idc;
		x = 0.42-10; y = 0.80-10;
		w = 0.949; h = 0.05;
	};
	
	class buy_sell_status_background: RscBackground {
		idc = buy_sell_status_background_idc;
		moving = 1;
		x = 0.42-10; y = 0.80-10;
		w = 0.949; h = 0.05;
	};

};