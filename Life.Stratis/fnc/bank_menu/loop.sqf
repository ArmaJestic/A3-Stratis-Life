// A_bank_menu_fnc_loop

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_player);

private["_bank_tax"];
_bank_tax = ["Bank"] call A_economy_menu_fnc_lookup_tax_value_type;
		
waitUntil {
	private["_money", "_bank"];
	_money = [_player, "money"] call A_inventory_fnc_get_item_amount;
	_bank = [_player] call A_bank_fnc_get_value;
	
	ctrlSetText [bank_menu_balance_cash_field_idc, format ["$%1", strM(_money)]];
	ctrlSetText [bank_menu_balance_field_idc, format ["$%1", strM(_bank)]];
	
	private["_amount"];
	_amount = [ctrlText bank_menu_amount_field_idc] call A_misc_fnc_parse_number;
	if (_amount < 0) then {_amount = 0};
	
	if ((lbData[bank_menu_destination_field_idc, (lbCurSel bank_menu_destination_field_idc)]) == str(_player)) then {
		ctrlSetText [bank_menu_transaction_fee_field_idc,"$0"];
	}else{
		ctrlSetText [bank_menu_transaction_fee_field_idc, format ["$%1", strM(_amount + round(_amount * (_bank_tax/100)))]];
	};
	!(ctrlVisible bank_menu_header_idc);
};
