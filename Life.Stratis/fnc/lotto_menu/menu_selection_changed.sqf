// A_lotto_menu_fnc_menu_selection_changed

#include "../../includes/constants.h"
#include "../../includes/macro.h"


ARGV(0,_control);
ARGV(1,_index);

private["_ticked_id"];
_ticked_id = _control lbData _index;

private["_ticket"];
_ticket = [_ticked_id]  call A_lotto_menu_fnc_ticket_lookup_id;

if (undefined(_ticket)) exitWith {};
private["_ticket_price", "_ticket_chance", "_ticket_payout"];
_ticket_price = _ticket select A_lotto_menu_var_ticket_price;
_ticket_chance = _ticket select A_lotto_menu_var_ticket_chance;
_ticket_payout = _ticket select A_lotto_menu_var_ticket_payout;

ctrlSetText [lotto_ticket_price_field_idc, format["$%1", strM(_ticket_price)]];
ctrlSetText [lotto_ticket_info_field_idc, format["%1", str(_ticket_chance) + "%"]];
ctrlSetText [lotto_ticket_payout_field_idc, format["$%1", strM(_ticket_payout)]];
