// A_shop_menu_fnc_reset_buy_labels

#include "header.h"


ctrlSetText [buy_supply_field_idc, "0"];
ctrlSetText [buy_salex_tax_field_idc, "$0"];
ctrlSetText [buy_marked_adjust_field_idc, "$0"];
ctrlSetText [buy_total_due_field_idc, "$0"];
ctrlSetText [buy_button_idc, "Buy"];
ctrlEnable [buy_button_idc, false];
ctrlSetText [buy_sell_status_label_idc, ""];
