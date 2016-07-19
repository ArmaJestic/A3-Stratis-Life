// A_shop_menu_fnc_reset_sell_labels

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ctrlSetText [sell_demand_field_idc, "0"];
ctrlSetText [sell_sales_tax_field_idc, "$0"];
ctrlSetText [sell_market_ajust_field_idc, "$0"];
ctrlSetText [sell_total_return_field_idc, "$0"];
ctrlSetText [sell_button_idc, "Sell"];
ctrlEnable [sell_button_idc, false];
ctrlSetText [buy_sell_status_label_idc, ""];
