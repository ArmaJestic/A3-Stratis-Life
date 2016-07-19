// A_storage_menu_fnc_menu_generate_selection_code

#include "../../includes/constants.h"
#include "../../includes/macro.h"


ARGV(0,_action);
if (undefined(_action)) exitWith {{""}};
if (typeName _action != "STRING") exitWith {{""}};

private["_code"];
_code = compile (format[
' 
	private["_item", "_count"];
	ARGV(0,_item);
	ARGV(1,_count);
	private["_infos", "_weight", "_text"];
	_infos  = _item call A_inventory_fnc_get_item_array;
	if (count(_infos) == 0) exitWith {""};
	_weight = ITEM_DATA_WEIGHT(_infos) * _count;
	_text = (strM(_weight) + "");
	(_text)
', _action]);

_code
