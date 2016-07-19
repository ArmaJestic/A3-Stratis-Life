// A_inventory_menu_fnc_interact_inventory_menu_item_changed

#include "../../includes/macro.h"
#include "../../includes/constants.h"


ARGV(0,_control);
ARGV(1,_index);

private["_item", "_amount"];
_item = _control lbData _index;
_amount = [player, _item]  call A_inventory_fnc_get_item_amount;

private["_data"];
_data = ITEM_DATA(_item);
if (count(_data) == 0) exitWith {};

private["_weight"];
_weight = ITEM_DATA_WEIGHT(_data);

ctrlSetText [inventory_desciption_text_idc, format ["%1", _item call A_inventory_fnc_get_item_description_2]];
ctrlSetText [inventory_item_amount_field_idc, format ["%1", strN(_amount)]];
ctrlSetText [inventory_item_info_weight_field_idc, format ["%2 Kg", _weight, strN((_weight*(_amount)))]];
